# Test-EngineEvaluationBodyIntegrityTimingTool.ps1
# Self-test for Summarize-EngineEvaluationBodyIntegrityTiming.ps1.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Tool = Join-Path $Root 'tools/Summarize-EngineEvaluationBodyIntegrityTiming.ps1'
if (-not (Test-Path -LiteralPath $Tool -PathType Leaf)) {
    throw "Timing summarizer not found: $Tool"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-body-timing-test-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null

try {
    $PassCsv = Join-Path $TempRoot 'pass.csv'
    $FailCsv = Join-Path $TempRoot 'fail.csv'

    @'
tick,duration_ms
0,1.00
1,1.50
2,1.75
3,2.00
'@ | Set-Content -LiteralPath $PassCsv -Encoding utf8NoBOM

    @'
tick,duration_ms
0,1.00
1,1.50
2,2.25
3,1.75
'@ | Set-Content -LiteralPath $FailCsv -Encoding utf8NoBOM

    $PassOutput = & pwsh -NoProfile -File $Tool -CsvPath $PassCsv -ThresholdMs 2.0 2>&1
    $PassCode = $LASTEXITCODE
    $PassText = ($PassOutput | Out-String)

    if ($PassCode -ne 0) {
        throw ("Expected passing timing data to exit 0." + [Environment]::NewLine + $PassText)
    }

    if ($PassText -notmatch '"status"\s*:\s*"PASS"') {
        throw ("Passing timing data did not report PASS." + [Environment]::NewLine + $PassText)
    }

    $FailOutput = & pwsh -NoProfile -File $Tool -CsvPath $FailCsv -ThresholdMs 2.0 2>&1
    $FailCode = $LASTEXITCODE
    $FailText = ($FailOutput | Out-String)

    if ($FailCode -eq 0) {
        throw ("Expected threshold-exceeding data to fail." + [Environment]::NewLine + $FailText)
    }

    if ($FailText -notmatch '"threshold_exceeded_count"\s*:\s*1') {
        throw ("Failing timing data did not report one threshold exceedance." + [Environment]::NewLine + $FailText)
    }

    Write-Host '[PASSED] Body Integrity timing summarizer self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}

# The failing child-process case intentionally exits 1; reset wrapper status.
exit 0
