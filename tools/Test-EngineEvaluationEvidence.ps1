# Test-EngineEvaluationEvidence.ps1
# Validates machine-readable GUMFALL engine-evaluation evidence.
# Result manifests use result.json or *.result.json; other JSON artifacts are privacy/parse checked only.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$SchemaPath = Join-Path $Root 'schemas/engine_evaluation_result.schema.json'
$EvidenceRoot = Join-Path $Root 'evidence/engine-evaluation'

if (-not (Test-Path -LiteralPath $SchemaPath -PathType Leaf)) {
    throw "Engine evaluation schema not found: $SchemaPath"
}

if ($PSVersionTable.PSVersion.Major -lt 7 -or
    ($PSVersionTable.PSVersion.Major -eq 7 -and $PSVersionTable.PSVersion.Minor -lt 4)) {
    throw "PowerShell 7.4+ is required for Test-Json schema validation."
}

if (-not (Test-Path -LiteralPath $EvidenceRoot -PathType Container)) {
    Write-Host '[PASSED] No engine evaluation JSON evidence found.'
    exit 0
}

$JsonFiles = @(
    Get-ChildItem -LiteralPath $EvidenceRoot -Recurse -File -Filter '*.json'
)

if ($JsonFiles.Count -eq 0) {
    Write-Host '[PASSED] No engine evaluation JSON evidence found.'
    exit 0
}

$ManifestFiles = @(
    $JsonFiles | Where-Object {
        $_.Name -ieq 'result.json' -or $_.Name -like '*.result.json'
    }
)

$Findings = [System.Collections.Generic.List[string]]::new()

function Add-Finding {
    param([string]$Message)
    $script:Findings.Add($Message)
}

$ForbiddenKeys = @(
    'hostname',
    'user_name',
    'username',
    'serial_number',
    'serialnumber',
    'mac_address',
    'macaddress',
    'ip_address',
    'ipaddress'
)

function Test-ForbiddenKeys {
    param(
        $Node,
        [string]$Path,
        [string]$FileName
    )

    if ($null -eq $Node) {
        return
    }

    if ($Node -is [System.Collections.IDictionary]) {
        foreach ($Key in $Node.Keys) {
            $KeyText = [string]$Key
            if ($ForbiddenKeys -contains $KeyText.ToLowerInvariant()) {
                Add-Finding "Forbidden identifying key '$KeyText' in $FileName at $Path."
            }
            Test-ForbiddenKeys -Node $Node[$Key] -Path "$Path.$KeyText" -FileName $FileName
        }
        return
    }

    if ($Node -is [System.Collections.IEnumerable] -and -not ($Node -is [string])) {
        $Index = 0
        foreach ($Item in $Node) {
            Test-ForbiddenKeys -Node $Item -Path "$Path[$Index]" -FileName $FileName
            $Index++
        }
    }
}

$ParsedByPath = @{}

foreach ($File in $JsonFiles) {
    $Relative = $File.FullName.Substring($Root.Length).TrimStart('\', '/')
    $Raw = Get-Content -LiteralPath $File.FullName -Raw

    try {
        $Parsed = $Raw | ConvertFrom-Json -AsHashtable
        $ParsedByPath[$File.FullName] = [ordered]@{
            relative = $Relative
            raw = $Raw
            value = $Parsed
        }
        Test-ForbiddenKeys -Node $Parsed -Path '$' -FileName $Relative
    } catch {
        Add-Finding "Invalid JSON: $Relative"
    }
}

foreach ($File in $ManifestFiles) {
    if (-not $ParsedByPath.ContainsKey($File.FullName)) {
        continue
    }

    $ParsedRecord = $ParsedByPath[$File.FullName]
    $Relative = [string]$ParsedRecord.relative
    $Raw = [string]$ParsedRecord.raw
    $Manifest = $ParsedRecord.value

    try {
        $Valid = Test-Json -Json $Raw -SchemaFile $SchemaPath -ErrorAction Stop
        if (-not $Valid) {
            Add-Finding "Schema validation failed: $Relative"
            continue
        }
    } catch {
        Add-Finding "Schema validation error in ${Relative}: $($_.Exception.Message)"
        continue
    }

    $Result = [string]$Manifest.result

    if ($Result -in @('PASS', 'FAIL')) {
        if ([string]::IsNullOrWhiteSpace([string]$Manifest.executed_at_utc)) {
            Add-Finding "$Relative result $Result requires executed_at_utc."
        }

        $MeasurementCount = 0
        if ($Manifest.measurements -is [System.Collections.IDictionary]) {
            $MeasurementCount = $Manifest.measurements.Count
        }

        if ($MeasurementCount -lt 1) {
            Add-Finding "$Relative result $Result requires at least one measurement."
        }

        if (@($Manifest.artifacts).Count -lt 1) {
            Add-Finding "$Relative result $Result requires at least one evidence artifact."
        }
    }

    if ($Result -eq 'BLOCKED' -and @($Manifest.limitations).Count -lt 1) {
        Add-Finding "$Relative result BLOCKED requires at least one limitation/blocker."
    }

    if ($Result -eq 'NOT_PERFORMED' -and $null -ne $Manifest.executed_at_utc) {
        Add-Finding "$Relative is NOT_PERFORMED but has executed_at_utc."
    }
}

if ($Findings.Count -gt 0) {
    foreach ($Finding in $Findings) {
        Write-Host "[FAILED] $Finding"
    }

    throw "Engine evaluation evidence validation found $($Findings.Count) issue(s)."
}

Write-Host "[PASSED] Engine evaluation evidence validation passed for $($ManifestFiles.Count) result manifest(s) and $($JsonFiles.Count) JSON artifact(s)."
