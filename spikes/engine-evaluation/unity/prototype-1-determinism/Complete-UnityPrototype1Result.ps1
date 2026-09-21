# Complete-UnityPrototype1Result.ps1
# Converts successful Prototype 1 artifacts into a validated PASS result manifest.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$RunDirectory,

    [Parameter(Mandatory)]
    [string]$SourceSha,

    [Parameter(Mandatory)]
    [string]$SourceBranch,

    [string]$Root
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Root)) {
    if ([string]::IsNullOrWhiteSpace($PSCommandPath)) {
        throw 'Unable to derive repository root because PSCommandPath is unavailable.'
    }

    $Cursor = Split-Path -Parent $PSCommandPath
    1..4 | ForEach-Object {
        $Cursor = Split-Path -Parent $Cursor
    }
    $Root = $Cursor
}

if ($SourceSha -notmatch '^[0-9a-fA-F]{40}$') {
    throw 'SourceSha must be a 40-character hexadecimal Git SHA.'
}

$ResultPath = Join-Path $RunDirectory 'result.json'
$EnvironmentPath = Join-Path $RunDirectory 'environment.json'
$BaselineTracePath = Join-Path $RunDirectory 'baseline.trace.json'
$ReplayTracePath = Join-Path $RunDirectory 'replay.trace.json'
$InputPath = Join-Path $RunDirectory 'inputs.csv'
$BaselineSummaryPath = Join-Path $RunDirectory 'baseline.summary.json'
$ReplaySummaryPath = Join-Path $RunDirectory 'replay.summary.json'
$ComparatorPath = Join-Path $RunDirectory 'comparator.json'

foreach ($Path in @(
    $ResultPath,
    $EnvironmentPath,
    $BaselineTracePath,
    $ReplayTracePath,
    $InputPath,
    $BaselineSummaryPath,
    $ReplaySummaryPath,
    $ComparatorPath
)) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Required Prototype 1 artifact not found: $Path"
    }
}

$Existing = Get-Content -LiteralPath $ResultPath -Raw | ConvertFrom-Json
$BaselineTrace = Get-Content -LiteralPath $BaselineTracePath -Raw | ConvertFrom-Json
$ReplayTrace = Get-Content -LiteralPath $ReplayTracePath -Raw | ConvertFrom-Json
$BaselineSummary = Get-Content -LiteralPath $BaselineSummaryPath -Raw | ConvertFrom-Json
$ReplaySummary = Get-Content -LiteralPath $ReplaySummaryPath -Raw | ConvertFrom-Json
$Comparator = Get-Content -LiteralPath $ComparatorPath -Raw | ConvertFrom-Json

if ($Existing.candidate -ne 'unity' -or
    $Existing.prototype -ne 'prototype-1-determinism' -or
    $Existing.source_sha -ne $SourceSha) {
    throw 'Initialized result manifest does not match this Unity Prototype 1 source SHA.'
}

if ($BaselineTrace.source_sha -ne $SourceSha -or
    $ReplayTrace.source_sha -ne $SourceSha) {
    throw 'Trace source SHA does not match the committed evaluation source.'
}

if ($BaselineTrace.engine_version -ne $ReplayTrace.engine_version) {
    throw 'Baseline and replay used different Unity versions.'
}

if ($BaselineTrace.input_hash -ne $ReplayTrace.input_hash -or
    $BaselineTrace.initial_state_hash -ne $ReplayTrace.initial_state_hash) {
    throw 'Baseline and replay identity fields do not match.'
}

if ($BaselineSummary.tick_rate_hz -ne 60 -or
    $ReplaySummary.tick_rate_hz -ne 60) {
    throw 'Fixed-tick evidence is not 60 Hz.'
}

if ($BaselineSummary.tick_count -ne $ReplaySummary.tick_count -or
    $BaselineSummary.tick_count -lt 1) {
    throw 'Baseline and replay tick counts do not match.'
}

if ($BaselineSummary.collision_count -ne 1 -or
    $ReplaySummary.collision_count -ne 1) {
    throw 'Expected exactly one bounded collision in both runs.'
}

if ($BaselineSummary.engine_physics_participated -ne $false -or
    $ReplaySummary.engine_physics_participated -ne $false) {
    throw 'Authoritative resolution unexpectedly used engine physics.'
}

if ($Comparator.status -ne 'PASS' -or
    $Comparator.match -ne $true -or
    $null -ne $Comparator.divergence_tick) {
    throw 'Comparator did not establish a same-platform deterministic replay PASS.'
}

$Manifest = [ordered]@{
    schema_version = '1.0.0'
    candidate = 'unity'
    prototype = 'prototype-1-determinism'
    result = 'PASS'
    executed_at_utc = [DateTime]::UtcNow.ToString('o')
    source_sha = $SourceSha.ToLowerInvariant()
    engine = [ordered]@{
        name = 'Unity'
        version = [string]$BaselineTrace.engine_version
        modules = @()
    }
    environment = $Existing.environment
    measurements = [ordered]@{
        source_branch = $SourceBranch
        build_configuration = 'Unity Editor batchmode; isolated temporary project'
        fixed_tick_hz = 60
        tick_count = [int]$BaselineSummary.tick_count
        collision_count = 1
        deterministic_seed_id = [string]$BaselineTrace.seed_id
        input_hash = [string]$BaselineTrace.input_hash
        initial_state_hash = [string]$BaselineTrace.initial_state_hash
        baseline_final_state_hash = [string]$BaselineTrace.final_state_hash
        replay_final_state_hash = [string]$ReplayTrace.final_state_hash
        first_divergence_tick = $null
        replay_match = $true
        engine_physics_participated = $false
    }
    artifacts = @(
        'environment.json',
        'inputs.csv',
        'baseline.trace.json',
        'replay.trace.json',
        'baseline.summary.json',
        'replay.summary.json',
        'comparator.json'
    )
    limitations = @(
        'Same-platform Windows evidence only; cross-platform determinism is not established.',
        'Authoritative resolution used controlled integer simulation hosted by Unity; Unity physics did not participate.',
        'This Prototype 1 result does not establish production performance, networking correctness, or final engine suitability.'
    )
    notes = 'Baseline and replay were executed in separate Unity Editor batchmode processes. Baseline generated the deterministic seeded input sequence; replay consumed the exact recorded input artifact. DEC-001 remains OPEN.'
}

$ManifestJson = $Manifest | ConvertTo-Json -Depth 8

[IO.File]::WriteAllText(
    $ResultPath,
    $ManifestJson + [Environment]::NewLine,
    (New-Object Text.UTF8Encoding($false))
)

$Validator = Join-Path $Root 'tools/Test-EngineEvaluationEvidence.ps1'
$ValidationOutput = & pwsh -NoProfile -File $Validator -Root $Root
$ValidationExit = $LASTEXITCODE

$ValidationOutput | ForEach-Object {
    Write-Host $_
}

if ($ValidationExit -ne 0) {
    throw "Engine evaluation evidence validation failed with exit code $ValidationExit."
}

[ordered]@{
    status = 'PASS'
    candidate = 'unity'
    prototype = 'prototype-1-determinism'
    source_sha = $SourceSha.ToLowerInvariant()
    engine_version = [string]$BaselineTrace.engine_version
    tick_count = [int]$BaselineSummary.tick_count
    collision_count = 1
    input_hash = [string]$BaselineTrace.input_hash
    initial_state_hash = [string]$BaselineTrace.initial_state_hash
    final_state_hash = [string]$BaselineTrace.final_state_hash
    divergence_tick = $null
    result_manifest = $ResultPath
} | ConvertTo-Json -Depth 5
