# Initialize-EngineEvaluationRun.ps1
# Creates a non-identifying NOT_PERFORMED evidence package for one engine-evaluation prototype.
# This prepares evidence storage only; it does not execute, score, rank, or select an engine.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet('unity','unreal','godot','o3de','custom')]
    [string]$Candidate,

    [Parameter(Mandatory)]
    [ValidateSet(
        'prototype-1-determinism',
        'prototype-2-body-integrity-budget',
        'prototype-3-gummy-deformation',
        'prototype-4-server-authority'
    )]
    [string]$Prototype,

    [string]$Root,

    [string]$OutputRoot,

    [string]$SourceSha,

    [string]$EngineName = 'UNKNOWN',

    [string]$EngineVersion = 'UNKNOWN',

    [string[]]$Modules = @()
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

if ([string]::IsNullOrWhiteSpace($OutputRoot)) {
    $OutputRoot = Join-Path $Root 'evidence/engine-evaluation'
}

if ([string]::IsNullOrWhiteSpace($SourceSha)) {
    $Git = Get-Command git -ErrorAction SilentlyContinue
    if ($null -eq $Git) {
        throw 'Git is required when SourceSha is not supplied.'
    }

    $SourceSha = (& $Git.Source -C $Root rev-parse HEAD 2>&1 | Out-String).Trim()
}

if ($SourceSha -notmatch '^[0-9a-fA-F]{40}$') {
    throw "SourceSha must be a 40-character Git commit SHA. Received: $SourceSha"
}

$Collector = Join-Path $Root 'tools/Collect-EngineEvaluationEnvironment.ps1'
if (-not (Test-Path -LiteralPath $Collector -PathType Leaf)) {
    throw "Environment collector not found: $Collector"
}

$Timestamp = [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ')
$Suffix = [guid]::NewGuid().ToString('N').Substring(0, 8)
$RunName = "$Timestamp-$($SourceSha.Substring(0, 8))-$Suffix"
$RunDirectory = Join-Path (Join-Path (Join-Path $OutputRoot $Candidate) $Prototype) $RunName

New-Item -ItemType Directory -Path $RunDirectory -Force | Out-Null

$EnvironmentPath = Join-Path $RunDirectory 'environment.json'
$ResultPath = Join-Path $RunDirectory 'result.json'

$EnvironmentRaw = & $Collector -OutputPath $EnvironmentPath
$Environment = $EnvironmentRaw | ConvertFrom-Json

$OsText = [string]$Environment.os.platform
if ([string]::IsNullOrWhiteSpace($OsText)) {
    $OsText = 'UNKNOWN'
}

$CpuText = [string]$Environment.cpu.model
if ([string]::IsNullOrWhiteSpace($CpuText)) {
    $CpuText = 'UNKNOWN'
}

$GpuText = $null
if ($null -ne $Environment.gpu_names -and @($Environment.gpu_names).Count -gt 0) {
    $GpuText = (@($Environment.gpu_names) -join '; ')
}

$RamBytes = $null
if ($null -ne $Environment.memory_bytes) {
    $RamBytes = [int64]$Environment.memory_bytes
}

$Manifest = [ordered]@{
    schema_version = '1.0.0'
    candidate = $Candidate
    prototype = $Prototype
    result = 'NOT_PERFORMED'
    executed_at_utc = $null
    source_sha = $SourceSha.ToLowerInvariant()
    engine = [ordered]@{
        name = $EngineName
        version = $EngineVersion
        modules = @($Modules)
    }
    environment = [ordered]@{
        os = $OsText
        cpu = $CpuText
        ram_bytes = $RamBytes
        gpu = $GpuText
    }
    measurements = [ordered]@{}
    artifacts = @('environment.json')
    limitations = @(
        'Prototype execution has not started; result remains NOT_PERFORMED.'
    )
    notes = 'Evidence package initialized. Replace UNKNOWN engine metadata and add only measurements/artifacts produced by an actual prototype execution.'
}

$ManifestJson = $Manifest | ConvertTo-Json -Depth 8

[System.IO.File]::WriteAllText(
    [System.IO.Path]::GetFullPath($ResultPath),
    $ManifestJson + [Environment]::NewLine,
    [System.Text.UTF8Encoding]::new($false)
)

$Summary = [ordered]@{
    status = 'NOT_PERFORMED'
    candidate = $Candidate
    prototype = $Prototype
    source_sha = $SourceSha.ToLowerInvariant()
    run_directory = [System.IO.Path]::GetFullPath($RunDirectory)
    result_manifest = [System.IO.Path]::GetFullPath($ResultPath)
    environment_artifact = [System.IO.Path]::GetFullPath($EnvironmentPath)
}

$Summary | ConvertTo-Json -Depth 4
