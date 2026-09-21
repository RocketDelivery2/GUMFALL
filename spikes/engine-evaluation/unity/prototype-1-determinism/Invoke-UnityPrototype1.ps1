# Invoke-UnityPrototype1.ps1
# Executes GUMFALL engine-evaluation Prototype 1 in two separate Unity Editor processes.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$UnityExe,

    [Parameter(Mandatory)]
    [string]$SourceSha,

    [Parameter(Mandatory)]
    [string]$EvidenceDirectory,

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

if (-not (Test-Path -LiteralPath $UnityExe -PathType Leaf)) {
    throw "Unity executable not found: $UnityExe"
}

if ($SourceSha -notmatch '^[0-9a-fA-F]{40}$') {
    throw 'SourceSha must be a 40-character hexadecimal Git SHA.'
}

$Comparator = Join-Path $Root 'tools/Compare-EngineEvaluationDeterminismTrace.ps1'
$RunnerSource = Join-Path $PSScriptRoot 'Prototype1Runner.cs'

if (-not (Test-Path -LiteralPath $Comparator -PathType Leaf)) {
    throw "Comparator not found: $Comparator"
}

if (-not (Test-Path -LiteralPath $RunnerSource -PathType Leaf)) {
    throw "Unity runner source not found: $RunnerSource"
}

New-Item -ItemType Directory -Path $EvidenceDirectory -Force | Out-Null

$BaselineTrace = Join-Path $EvidenceDirectory 'baseline.trace.json'
$ReplayTrace = Join-Path $EvidenceDirectory 'replay.trace.json'
$InputPath = Join-Path $EvidenceDirectory 'inputs.csv'
$BaselineSummary = Join-Path $EvidenceDirectory 'baseline.summary.json'
$ReplaySummary = Join-Path $EvidenceDirectory 'replay.summary.json'
$ComparatorResult = Join-Path $EvidenceDirectory 'comparator.json'

$WorkRoot = Join-Path ([IO.Path]::GetTempPath()) ('gumfall-unity-p1-' + [guid]::NewGuid().ToString('N'))
$ProjectPath = Join-Path $WorkRoot 'UnityProject'
$CreateLog = Join-Path $WorkRoot 'create-project.log'
$BaselineLog = Join-Path $WorkRoot 'baseline.log'
$ReplayLog = Join-Path $WorkRoot 'replay.log'

function Quote-Argument {
    param([string]$Value)
    return '"' + ($Value -replace '"', '\"') + '"'
}

function Invoke-UnityStage {
    param(
        [Parameter(Mandatory)]
        [string]$Stage,

        [Parameter(Mandatory)]
        [string[]]$Arguments,

        [Parameter(Mandatory)]
        [string]$LogPath
    )

    $StartInfo = New-Object System.Diagnostics.ProcessStartInfo
    $StartInfo.FileName = $UnityExe
    $StartInfo.UseShellExecute = $false
    $StartInfo.CreateNoWindow = $true
    $StartInfo.Arguments = (($Arguments | ForEach-Object { Quote-Argument $_ }) -join ' ')

    $Process = [System.Diagnostics.Process]::Start($StartInfo)
    if ($null -eq $Process) {
        throw "Unable to start Unity for stage: $Stage"
    }

    $Process.WaitForExit()
    $ExitCode = $Process.ExitCode
    $Process.Dispose()

    if ($ExitCode -ne 0) {
        Write-Host ""
        Write-Host "=== $Stage LOG TAIL ===" -ForegroundColor Yellow

        if (Test-Path -LiteralPath $LogPath -PathType Leaf) {
            Get-Content -LiteralPath $LogPath -Tail 120
        }
        else {
            Write-Host "Expected log was not created: $LogPath"
        }

        throw "Unity stage '$Stage' failed with exit code $ExitCode. Work directory preserved: $WorkRoot"
    }
}

$Succeeded = $false

try {
    New-Item -ItemType Directory -Path $WorkRoot -Force | Out-Null

    Write-Host ""
    Write-Host "=== CREATE TEMPORARY UNITY PROJECT ===" -ForegroundColor Cyan
    Invoke-UnityStage -Stage 'create-project' -LogPath $CreateLog -Arguments @(
        '-batchmode',
        '-quit',
        '-createProject', $ProjectPath,
        '-logFile', $CreateLog
    )

    $EditorDirectory = Join-Path $ProjectPath 'Assets/Editor'
    New-Item -ItemType Directory -Path $EditorDirectory -Force | Out-Null
    Copy-Item -LiteralPath $RunnerSource -Destination (Join-Path $EditorDirectory 'Prototype1Runner.cs') -Force

    Write-Host ""
    Write-Host "=== UNITY BASELINE PROCESS ===" -ForegroundColor Cyan
    Invoke-UnityStage -Stage 'baseline' -LogPath $BaselineLog -Arguments @(
        '-batchmode',
        '-nographics',
        '-quit',
        '-projectPath', $ProjectPath,
        '-executeMethod', 'Gumfall.EngineEvaluation.Prototype1Runner.Run',
        '-logFile', $BaselineLog,
        '-gumfallMode', 'baseline',
        '-gumfallTracePath', $BaselineTrace,
        '-gumfallInputPath', $InputPath,
        '-gumfallSummaryPath', $BaselineSummary,
        '-gumfallSourceSha', $SourceSha
    )

    Write-Host ""
    Write-Host "=== UNITY REPLAY PROCESS ===" -ForegroundColor Cyan
    Invoke-UnityStage -Stage 'replay' -LogPath $ReplayLog -Arguments @(
        '-batchmode',
        '-nographics',
        '-quit',
        '-projectPath', $ProjectPath,
        '-executeMethod', 'Gumfall.EngineEvaluation.Prototype1Runner.Run',
        '-logFile', $ReplayLog,
        '-gumfallMode', 'replay',
        '-gumfallTracePath', $ReplayTrace,
        '-gumfallInputPath', $InputPath,
        '-gumfallSummaryPath', $ReplaySummary,
        '-gumfallSourceSha', $SourceSha
    )

    foreach ($RequiredPath in @(
        $BaselineTrace,
        $ReplayTrace,
        $InputPath,
        $BaselineSummary,
        $ReplaySummary
    )) {
        if (-not (Test-Path -LiteralPath $RequiredPath -PathType Leaf)) {
            throw "Prototype did not create required artifact: $RequiredPath"
        }
    }

    Write-Host ""
    Write-Host "=== COMPARE BASELINE AND REPLAY ===" -ForegroundColor Cyan

    $ComparisonRaw = & pwsh -NoProfile -File $Comparator -Root $Root -BaselinePath $BaselineTrace -ReplayPath $ReplayTrace
    $ComparatorExit = $LASTEXITCODE
    $ComparisonText = $ComparisonRaw -join [Environment]::NewLine

    [IO.File]::WriteAllText(
        $ComparatorResult,
        $ComparisonText + [Environment]::NewLine,
        (New-Object Text.UTF8Encoding($false))
    )

    $Comparison = $ComparisonText | ConvertFrom-Json
    $Baseline = Get-Content -LiteralPath $BaselineSummary -Raw | ConvertFrom-Json
    $Replay = Get-Content -LiteralPath $ReplaySummary -Raw | ConvertFrom-Json

    if ($Baseline.tick_rate_hz -ne 60 -or $Replay.tick_rate_hz -ne 60) {
        throw 'Prototype did not execute at the declared 60 Hz fixed-tick contract.'
    }

    if ($Baseline.collision_count -ne 1 -or $Replay.collision_count -ne 1) {
        throw 'Prototype did not execute exactly one bounded collision in both runs.'
    }

    if ($Baseline.engine_physics_participated -ne $false -or
        $Replay.engine_physics_participated -ne $false) {
        throw 'Prototype unexpectedly reported engine physics in authoritative resolution.'
    }

    if ($ComparatorExit -ne 0 -or $Comparison.status -ne 'PASS' -or $Comparison.match -ne $true) {
        throw "Determinism comparison failed. Comparator artifact preserved: $ComparatorResult"
    }

    $Succeeded = $true

    [ordered]@{
        status = 'PASS'
        source_sha = $SourceSha.ToLowerInvariant()
        tick_rate_hz = [int]$Baseline.tick_rate_hz
        tick_count = [int]$Baseline.tick_count
        collision_count = [int]$Baseline.collision_count
        engine_physics_participated = $false
        input_hash = [string]$Baseline.input_hash
        initial_state_hash = [string]$Baseline.initial_state_hash
        final_state_hash = [string]$Baseline.final_state_hash
        baseline_trace = $BaselineTrace
        replay_trace = $ReplayTrace
        input_artifact = $InputPath
        baseline_summary = $BaselineSummary
        replay_summary = $ReplaySummary
        comparator_artifact = $ComparatorResult
    } | ConvertTo-Json -Depth 5
}
finally {
    if ($Succeeded -and (Test-Path -LiteralPath $WorkRoot)) {
        Remove-Item -LiteralPath $WorkRoot -Recurse -Force
    }
    elseif (-not $Succeeded) {
        Write-Host ""
        Write-Host 'Unity work directory preserved for diagnosis:' -ForegroundColor Yellow
        Write-Host $WorkRoot
    }
}
