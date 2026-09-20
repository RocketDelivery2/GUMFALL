# Summarize-EngineEvaluationBodyIntegrityTiming.ps1
# Summarizes Prototype 2 raw tick timings without running an engine benchmark.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$CsvPath,

    [double]$ThresholdMs = 2.0
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $CsvPath -PathType Leaf)) {
    throw "Timing CSV not found: $CsvPath"
}

if ($ThresholdMs -le 0) {
    throw "ThresholdMs must be greater than zero."
}

$Rows = @(Import-Csv -LiteralPath $CsvPath)
if ($Rows.Count -lt 1) {
    throw "Timing CSV contains no data rows."
}

$Durations = [System.Collections.Generic.List[double]]::new()
$Ticks = [System.Collections.Generic.List[int64]]::new()

foreach ($Row in $Rows) {
    if ($null -eq $Row.PSObject.Properties['tick'] -or
        $null -eq $Row.PSObject.Properties['duration_ms']) {
        throw "Timing CSV must contain tick and duration_ms columns."
    }

    $TickValue = 0L
    if (-not [int64]::TryParse([string]$Row.tick, [ref]$TickValue)) {
        throw "Invalid tick value: $($Row.tick)"
    }

    $DurationValue = 0.0
    if (-not [double]::TryParse(
        [string]$Row.duration_ms,
        [System.Globalization.NumberStyles]::Float,
        [System.Globalization.CultureInfo]::InvariantCulture,
        [ref]$DurationValue
    )) {
        throw "Invalid duration_ms value at tick ${TickValue}: $($Row.duration_ms)"
    }

    if ($DurationValue -lt 0) {
        throw "duration_ms cannot be negative at tick $TickValue."
    }

    $Ticks.Add($TickValue)
    $Durations.Add($DurationValue)
}

for ($Index = 1; $Index -lt $Ticks.Count; $Index++) {
    if ($Ticks[$Index] -le $Ticks[$Index - 1]) {
        throw "Ticks must be strictly increasing. Found $($Ticks[$Index - 1]) then $($Ticks[$Index])."
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
$Exceeded = @($Sorted | Where-Object { $_ -gt $ThresholdMs }).Count

$Result = [ordered]@{
    status = $(if ($Exceeded -eq 0) { 'PASS' } else { 'FAIL' })
    threshold_ms = $ThresholdMs
    sample_count = $Count
    first_tick = $Ticks[0]
    last_tick = $Ticks[$Ticks.Count - 1]
    average_ms = [Math]::Round([double]$Average, 6)
    median_ms = [Math]::Round([double]$Median, 6)
    p95_ms = [Math]::Round([double]$P95, 6)
    maximum_ms = [Math]::Round([double]$Maximum, 6)
    threshold_exceeded_count = $Exceeded
    criterion = 'all recorded authoritative simulation ticks <= threshold_ms'
}

$Result | ConvertTo-Json -Depth 4

if ($Exceeded -eq 0) {
    exit 0
}

exit 1
