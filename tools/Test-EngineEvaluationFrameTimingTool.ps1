# Test-EngineEvaluationFrameTimingTool.ps1
# Self-test for Summarize-EngineEvaluationFrameTiming.ps1.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Tool = Join-Path $Root 'tools/Summarize-EngineEvaluationFrameTiming.ps1'
if (-not (Test-Path -LiteralPath $Tool -PathType Leaf)) {
    throw "Frame timing summarizer not found: $Tool"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-frame-timing-test-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null

try {
    $CsvPath = Join-Path $TempRoot 'frames.csv'
    $InvalidCsvPath = Join-Path $TempRoot 'invalid.csv'

    @'
frame,duration_ms
0,10.00
1,15.00
2,16.00
3,20.00
'@ | Set-Content -LiteralPath $CsvPath -Encoding utf8NoBOM

    @'
frame,duration_ms
1,10.00
1,11.00
'@ | Set-Content -LiteralPath $InvalidCsvPath -Encoding utf8NoBOM

    $Output = & pwsh -NoProfile -File $Tool -CsvPath $CsvPath -TargetFps 60 2>&1
    $Code = $LASTEXITCODE
    $Text = ($Output | Out-String)

    if ($Code -ne 0) {
        throw ("Expected valid frame timings to exit 0." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"status"\s*:\s*"MEASURED"') {
        throw ("Frame timing summary did not report MEASURED." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"sample_count"\s*:\s*4') {
        throw ("Frame timing summary did not report four samples." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"frames_over_target_budget"\s*:\s*1') {
        throw ("Frame timing summary did not report one over-budget frame." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"average_fps_meets_target"\s*:\s*true') {
        throw ("Frame timing summary did not report average FPS meeting target." + [Environment]::NewLine + $Text)
    }

    $InvalidOutput = & pwsh -NoProfile -File $Tool -CsvPath $InvalidCsvPath -TargetFps 60 2>&1
    $InvalidCode = $LASTEXITCODE
    if ($InvalidCode -eq 0) {
        throw ("Expected non-increasing frame identifiers to fail." + [Environment]::NewLine + ($InvalidOutput | Out-String))
    }

    Write-Host '[PASSED] Prototype 3 frame timing summarizer self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}

exit 0
