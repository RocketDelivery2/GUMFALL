# Summarize-EngineEvaluationFrameTiming.ps1
# Summarizes Prototype 3 frame timings without running an engine benchmark or making an engine decision.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$CsvPath,

    [double]$TargetFps = 60.0
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $CsvPath -PathType Leaf)) {
    throw "Frame timing CSV not found: $CsvPath"
}

if ($TargetFps -le 0) {
    throw "TargetFps must be greater than zero."
}

$Rows = @(Import-Csv -LiteralPath $CsvPath)
if ($Rows.Count -lt 1) {
    throw "Frame timing CSV contains no data rows."
}

$Frames = [System.Collections.Generic.List[int64]]::new()
$Durations = [System.Collections.Generic.List[double]]::new()

foreach ($Row in $Rows) {
    if ($null -eq $Row.PSObject.Properties['frame'] -or
        $null -eq $Row.PSObject.Properties['duration_ms']) {
        throw "Frame timing CSV must contain frame and duration_ms columns."
    }

    $FrameValue = 0L
    if (-not [int64]::TryParse([string]$Row.frame, [ref]$FrameValue)) {
        throw "Invalid frame value: $($Row.frame)"
    }

    $DurationValue = 0.0
    if (-not [double]::TryParse(
        [string]$Row.duration_ms,
        [System.Globalization.NumberStyles]::Float,
        [System.Globalization.CultureInfo]::InvariantCulture,
        [ref]$DurationValue
    )) {
        throw "Invalid duration_ms value at frame ${FrameValue}: $($Row.duration_ms)"
    }

    if ($DurationValue -le 0) {
        throw "duration_ms must be greater than zero at frame $FrameValue."
    }

    $Frames.Add($FrameValue)
    $Durations.Add($DurationValue)
}

for ($Index = 1; $Index -lt $Frames.Count; $Index++) {
    if ($Frames[$Index] -le $Frames[$Index - 1]) {
        throw "Frames must be strictly increasing. Found $($Frames[$Index - 1]) then $($Frames[$Index])."
    }
}

$Sorted = @($Durations | Sort-Object)
$Count = $Sorted.Count
$Average = ($Sorted | Measure-Object -Average).Average

if (($Count % 2) -eq 1) {
    $Median = $Sorted[[int][Math]::Floor($Count / 2)]
} else {
    $UpperIndex = [int]($Count / 2)
    $Median = ($Sorted[$UpperIndex - 1] + $Sorted[$UpperIndex]) / 2.0
}

$P95Index = [Math]::Max(0, [int][Math]::Ceiling(0.95 * $Count) - 1)
$P95 = $Sorted[$P95Index]
$Maximum = $Sorted[$Count - 1]
$FrameBudgetMs = 1000.0 / $TargetFps
$OverBudget = @($Durations | Where-Object { $_ -gt $FrameBudgetMs }).Count
$AverageFps = 1000.0 / $Average

$Result = [ordered]@{
    status = 'MEASURED'
    target_fps = [Math]::Round($TargetFps, 6)
    target_frame_budget_ms = [Math]::Round($FrameBudgetMs, 6)
    sample_count = $Count
    first_frame = $Frames[0]
    last_frame = $Frames[$Frames.Count - 1]
    average_ms = [Math]::Round([double]$Average, 6)
    median_ms = [Math]::Round([double]$Median, 6)
    p95_ms = [Math]::Round([double]$P95, 6)
    maximum_ms = [Math]::Round([double]$Maximum, 6)
    average_fps = [Math]::Round([double]$AverageFps, 6)
    frames_over_target_budget = $OverBudget
    average_fps_meets_target = ($AverageFps -ge $TargetFps)
    p95_frame_within_target_budget = ($P95 -le $FrameBudgetMs)
    criterion_note = 'Summary only; Prototype 3 PASS also requires retained visual evidence and human acceptance.'
}

$Result | ConvertTo-Json -Depth 4
