# Summarize-EngineEvaluationReconciliation.ps1
# Summarizes Prototype 4 reconciliation events without running a network test or making an engine decision.

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$CsvPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $CsvPath -PathType Leaf)) {
    throw "Reconciliation CSV not found: $CsvPath"
}

$Rows = @(Import-Csv -LiteralPath $CsvPath)
if ($Rows.Count -lt 1) {
    throw "Reconciliation CSV contains no data rows."
}

$EventIds = [System.Collections.Generic.List[int64]]::new()
$CorrectionTimes = [System.Collections.Generic.List[double]]::new()
$CorrectionMagnitudes = [System.Collections.Generic.List[double]]::new()
$AuthorityViolations = 0

foreach ($Row in $Rows) {
    foreach ($Column in @(
        'event_id',
        'client_role',
        'predicted_value',
        'authoritative_value',
        'correction_magnitude',
        'correction_ms',
        'server_authority_preserved'
    )) {
        if ($null -eq $Row.PSObject.Properties[$Column]) {
            throw "Reconciliation CSV must contain required column '$Column'."
        }
    }

    $EventId = 0L
    if (-not [int64]::TryParse([string]$Row.event_id, [ref]$EventId)) {
        throw "Invalid event_id value: $($Row.event_id)"
    }

    if ([string]::IsNullOrWhiteSpace([string]$Row.client_role)) {
        throw "client_role cannot be empty for event $EventId."
    }

    if ([string]::IsNullOrWhiteSpace([string]$Row.predicted_value) -or
        [string]::IsNullOrWhiteSpace([string]$Row.authoritative_value)) {
        throw "predicted_value and authoritative_value are required for event $EventId."
    }

    if (-not [string]::IsNullOrWhiteSpace([string]$Row.correction_magnitude)) {
        $Magnitude = 0.0
        if (-not [double]::TryParse(
            [string]$Row.correction_magnitude,
            [System.Globalization.NumberStyles]::Float,
            [System.Globalization.CultureInfo]::InvariantCulture,
            [ref]$Magnitude
        )) {
            throw "Invalid correction_magnitude value for event $EventId."
        }
        if ($Magnitude -lt 0) {
            throw "correction_magnitude cannot be negative for event $EventId."
        }
        $CorrectionMagnitudes.Add($Magnitude)
    }

    if (-not [string]::IsNullOrWhiteSpace([string]$Row.correction_ms)) {
        $CorrectionMs = 0.0
        if (-not [double]::TryParse(
            [string]$Row.correction_ms,
            [System.Globalization.NumberStyles]::Float,
            [System.Globalization.CultureInfo]::InvariantCulture,
            [ref]$CorrectionMs
        )) {
            throw "Invalid correction_ms value for event $EventId."
        }
        if ($CorrectionMs -lt 0) {
            throw "correction_ms cannot be negative for event $EventId."
        }
        $CorrectionTimes.Add($CorrectionMs)
    }

    $AuthorityPreserved = $false
    if (-not [bool]::TryParse([string]$Row.server_authority_preserved, [ref]$AuthorityPreserved)) {
        throw "server_authority_preserved must be true or false for event $EventId."
    }

    if (-not $AuthorityPreserved) {
        $AuthorityViolations++
    }

    $EventIds.Add($EventId)
}

for ($Index = 1; $Index -lt $EventIds.Count; $Index++) {
    if ($EventIds[$Index] -le $EventIds[$Index - 1]) {
        throw "event_id values must be strictly increasing. Found $($EventIds[$Index - 1]) then $($EventIds[$Index])."
    }
}

$AverageCorrectionMs = $null
$MaximumCorrectionMs = $null
if ($CorrectionTimes.Count -gt 0) {
    $AverageCorrectionMs = [Math]::Round([double](($CorrectionTimes | Measure-Object -Average).Average), 6)
    $MaximumCorrectionMs = [Math]::Round([double](($CorrectionTimes | Measure-Object -Maximum).Maximum), 6)
}

$MaximumCorrectionMagnitude = $null
if ($CorrectionMagnitudes.Count -gt 0) {
    $MaximumCorrectionMagnitude = [Math]::Round([double](($CorrectionMagnitudes | Measure-Object -Maximum).Maximum), 6)
}

$Result = [ordered]@{
    status = 'MEASURED'
    event_count = $EventIds.Count
    first_event_id = $EventIds[0]
    last_event_id = $EventIds[$EventIds.Count - 1]
    measured_correction_time_count = $CorrectionTimes.Count
    average_correction_ms = $AverageCorrectionMs
    maximum_correction_ms = $MaximumCorrectionMs
    measured_correction_magnitude_count = $CorrectionMagnitudes.Count
    maximum_correction_magnitude = $MaximumCorrectionMagnitude
    authority_violation_count = $AuthorityViolations
    authority_preserved_for_all_events = ($AuthorityViolations -eq 0)
    criterion_note = 'Summary only; Prototype 4 PASS also requires input/state logs, 60 ms test conditions, two clients, retained capture, and human visible-pop review.'
}

$Result | ConvertTo-Json -Depth 4
