# Test-EngineEvaluationRunInitializer.ps1
# Self-test for Initialize-EngineEvaluationRun.ps1 under PowerShell 5.1+.

[CmdletBinding()]
param(
    [string]$Root
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Root)) {
    if ([string]::IsNullOrWhiteSpace($PSCommandPath)) {
        throw 'Unable to derive repository root because PSCommandPath is unavailable.'
    }

    $ScriptDirectory = Split-Path -Parent $PSCommandPath
    $Root = Split-Path -Parent $ScriptDirectory
}

$Tool = Join-Path $Root 'tools/Initialize-EngineEvaluationRun.ps1'
if (-not (Test-Path -LiteralPath $Tool -PathType Leaf)) {
    throw "Run initializer not found: $Tool"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-run-init-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null

try {
    $SourceSha = '1111111111111111111111111111111111111111'

    $DefaultOutputRoot = Join-Path $TempRoot 'default-root'
    $DefaultText = (& $Tool -Candidate custom -Prototype prototype-1-determinism -OutputRoot $DefaultOutputRoot -SourceSha $SourceSha 2>&1 | Out-String)
    $DefaultSummary = $DefaultText | ConvertFrom-Json

    if ($DefaultSummary.status -ne 'NOT_PERFORMED') {
        throw 'Initializer default-root invocation did not report NOT_PERFORMED.'
    }

    if (-not (Test-Path -LiteralPath $DefaultSummary.result_manifest -PathType Leaf)) {
        throw 'Initializer default-root invocation did not create result.json.'
    }

    $Output = & $Tool -Candidate custom -Prototype prototype-1-determinism -Root $Root -OutputRoot $TempRoot -SourceSha $SourceSha 2>&1
    $Code = $LASTEXITCODE
    $Text = ($Output | Out-String)

    if ($Code -ne 0) {
        throw ("Initializer returned a non-zero exit code." + [Environment]::NewLine + $Text)
    }

    $Summary = $Text | ConvertFrom-Json

    if ($Summary.status -ne 'NOT_PERFORMED') {
        throw "Initializer must report NOT_PERFORMED."
    }

    if ($Summary.source_sha -ne $SourceSha) {
        throw "Initializer did not preserve the supplied source SHA."
    }

    if (-not (Test-Path -LiteralPath $Summary.result_manifest -PathType Leaf)) {
        throw "Initializer did not create result.json."
    }

    if (-not (Test-Path -LiteralPath $Summary.environment_artifact -PathType Leaf)) {
        throw "Initializer did not create environment.json."
    }

    $Manifest = Get-Content -LiteralPath $Summary.result_manifest -Raw | ConvertFrom-Json
    if ($Manifest.result -ne 'NOT_PERFORMED') {
        throw "Initialized result manifest must remain NOT_PERFORMED."
    }

    if ($null -ne $Manifest.executed_at_utc) {
        throw "Initialized result manifest must not contain an execution timestamp."
    }

    if (@($Manifest.artifacts) -notcontains 'environment.json') {
        throw "Initialized result manifest must reference environment.json."
    }

    $Environment = Get-Content -LiteralPath $Summary.environment_artifact -Raw | ConvertFrom-Json
    if ($Environment.privacy.hostname_collected -ne $false -or
        $Environment.privacy.username_collected -ne $false -or
        $Environment.privacy.serial_numbers_collected -ne $false -or
        $Environment.privacy.network_identifiers_collected -ne $false) {
        throw "Initialized environment artifact violated the privacy contract."
    }

    if ($PSVersionTable.PSVersion.Major -gt 7 -or
        ($PSVersionTable.PSVersion.Major -eq 7 -and $PSVersionTable.PSVersion.Minor -ge 4)) {
        $SchemaPath = Join-Path $Root 'schemas/engine_evaluation_result.schema.json'
        $ManifestRaw = Get-Content -LiteralPath $Summary.result_manifest -Raw
        if (-not (Test-Json -Json $ManifestRaw -SchemaFile $SchemaPath -ErrorAction Stop)) {
            throw "Initialized result manifest failed schema validation."
        }
    }

    Write-Host '[PASSED] Engine evaluation run initializer self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}

exit 0
