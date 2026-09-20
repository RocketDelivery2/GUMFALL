# Compare-EngineEvaluationDeterminismTrace.ps1
# Compares two technology-neutral authoritative-state traces for Prototype 1.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$BaselinePath,

    [Parameter(Mandatory)]
    [string]$ReplayPath,

    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$SchemaPath = Join-Path $Root 'schemas/engine_evaluation_trace.schema.json'

if (-not (Test-Path -LiteralPath $SchemaPath -PathType Leaf)) {
    throw "Determinism trace schema not found: $SchemaPath"
}

if ($PSVersionTable.PSVersion.Major -lt 7 -or
    ($PSVersionTable.PSVersion.Major -eq 7 -and $PSVersionTable.PSVersion.Minor -lt 4)) {
    throw "PowerShell 7.4+ is required for Test-Json schema validation."
}

function Read-Trace {
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Label
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "$Label trace not found: $Path"
    }

    $Raw = Get-Content -LiteralPath $Path -Raw

    if (-not (Test-Json -Json $Raw -SchemaFile $SchemaPath -ErrorAction Stop)) {
        throw "$Label trace failed schema validation: $Path"
    }

    return $Raw | ConvertFrom-Json -AsHashtable
}

$Baseline = Read-Trace -Path $BaselinePath -Label 'Baseline'
$Replay = Read-Trace -Path $ReplayPath -Label 'Replay'

$IdentityFields = @(
    'candidate',
    'source_sha',
    'engine_version',
    'seed_id',
    'input_hash',
    'initial_state_hash'
)

foreach ($Field in $IdentityFields) {
    if ([string]$Baseline[$Field] -ne [string]$Replay[$Field]) {
        $Result = [ordered]@{
            status = 'FAIL'
            match = $false
            divergence_tick = $null
            reason = "Trace identity mismatch: $Field"
            baseline_value = [string]$Baseline[$Field]
            replay_value = [string]$Replay[$Field]
        }

        $Result | ConvertTo-Json -Depth 6
        exit 1
    }
}

$BaselineTicks = @($Baseline.ticks)
$ReplayTicks = @($Replay.ticks)
$MinCount = [Math]::Min($BaselineTicks.Count, $ReplayTicks.Count)

for ($Index = 0; $Index -lt $MinCount; $Index++) {
    $BaseTick = $BaselineTicks[$Index]
    $ReplayTick = $ReplayTicks[$Index]

    if ([int64]$BaseTick.tick -ne [int64]$ReplayTick.tick) {
        $Result = [ordered]@{
            status = 'FAIL'
            match = $false
            divergence_tick = $null
            reason = 'Tick sequence mismatch'
            baseline_tick = [int64]$BaseTick.tick
            replay_tick = [int64]$ReplayTick.tick
            index = $Index
        }

        $Result | ConvertTo-Json -Depth 6
        exit 1
    }

    if ([string]$BaseTick.state_hash -ne [string]$ReplayTick.state_hash) {
        $Result = [ordered]@{
            status = 'FAIL'
            match = $false
            divergence_tick = [int64]$BaseTick.tick
            reason = 'Authoritative state hash divergence'
            baseline_hash = [string]$BaseTick.state_hash
            replay_hash = [string]$ReplayTick.state_hash
        }

        $Result | ConvertTo-Json -Depth 6
        exit 1
    }
}

if ($BaselineTicks.Count -ne $ReplayTicks.Count) {
    $Result = [ordered]@{
        status = 'FAIL'
        match = $false
        divergence_tick = $null
        reason = 'Trace length mismatch'
        baseline_tick_count = $BaselineTicks.Count
        replay_tick_count = $ReplayTicks.Count
    }

    $Result | ConvertTo-Json -Depth 6
    exit 1
}

if ([string]$Baseline.final_state_hash -ne [string]$Replay.final_state_hash) {
    $Result = [ordered]@{
        status = 'FAIL'
        match = $false
        divergence_tick = $null
        reason = 'Final authoritative state hash mismatch'
        baseline_final_hash = [string]$Baseline.final_state_hash
        replay_final_hash = [string]$Replay.final_state_hash
    }

    $Result | ConvertTo-Json -Depth 6
    exit 1
}

$Result = [ordered]@{
    status = 'PASS'
    match = $true
    divergence_tick = $null
    reason = 'All authoritative state hashes match'
    candidate = [string]$Baseline.candidate
    source_sha = [string]$Baseline.source_sha
    tick_count = $BaselineTicks.Count
    final_state_hash = [string]$Baseline.final_state_hash
}

$Result | ConvertTo-Json -Depth 6
exit 0
