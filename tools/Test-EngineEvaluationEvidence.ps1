# Test-EngineEvaluationEvidence.ps1
# Validates machine-readable GUMFALL engine-evaluation evidence manifests.
# This script validates evidence integrity only; it does not select or rank engines.

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
    Write-Host '[PASSED] No engine evaluation result JSON files found.'
    exit 0
}

$Files = @(
    Get-ChildItem -LiteralPath $EvidenceRoot -Recurse -File -Filter '*.json'
)

if ($Files.Count -eq 0) {
    Write-Host '[PASSED] No engine evaluation result JSON files found.'
    exit 0
}

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

foreach ($File in $Files) {
    $Relative = $File.FullName.Substring($Root.Length).TrimStart('\', '/')
    $Raw = Get-Content -LiteralPath $File.FullName -Raw

    $Manifest = $null
    try {
        $Manifest = $Raw | ConvertFrom-Json -AsHashtable
    } catch {
        Add-Finding "Invalid JSON: $Relative"
        continue
    }

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

    Test-ForbiddenKeys -Node $Manifest -Path '$' -FileName $Relative

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

Write-Host "[PASSED] Engine evaluation evidence validation passed for $($Files.Count) manifest(s)."
