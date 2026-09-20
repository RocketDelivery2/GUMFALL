# Test-EngineEvaluationDeterminismTraceTool.ps1
# Self-test for Compare-EngineEvaluationDeterminismTrace.ps1.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Comparator = Join-Path $Root 'tools/Compare-EngineEvaluationDeterminismTrace.ps1'
if (-not (Test-Path -LiteralPath $Comparator -PathType Leaf)) {
    throw "Comparator not found: $Comparator"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-trace-test-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null

try {
    $BaselinePath = Join-Path $TempRoot 'baseline.json'
    $ReplayPath = Join-Path $TempRoot 'replay.json'
    $DivergentPath = Join-Path $TempRoot 'divergent.json'

    $Baseline = @'
{
  "schema_version": "1.0.0",
  "candidate": "custom",
  "source_sha": "1111111111111111111111111111111111111111",
  "engine_version": "test-harness-1",
  "seed_id": "seed-001",
  "input_hash": "aaaaaaaaaaaaaaaa",
  "initial_state_hash": "bbbbbbbbbbbbbbbb",
  "ticks": [
    {
      "tick": 0,
      "state_hash": "cccccccccccccccc"
    },
    {
      "tick": 1,
      "state_hash": "dddddddddddddddd"
    }
  ],
  "final_state_hash": "eeeeeeeeeeeeeeee"
}
'@

    $Replay = $Baseline

    $Divergent = @'
{
  "schema_version": "1.0.0",
  "candidate": "custom",
  "source_sha": "1111111111111111111111111111111111111111",
  "engine_version": "test-harness-1",
  "seed_id": "seed-001",
  "input_hash": "aaaaaaaaaaaaaaaa",
  "initial_state_hash": "bbbbbbbbbbbbbbbb",
  "ticks": [
    {
      "tick": 0,
      "state_hash": "cccccccccccccccc"
    },
    {
      "tick": 1,
      "state_hash": "ffffffffffffffff"
    }
  ],
  "final_state_hash": "9999999999999999"
}
'@

    [System.IO.File]::WriteAllText($BaselinePath, $Baseline, [System.Text.UTF8Encoding]::new($false))
    [System.IO.File]::WriteAllText($ReplayPath, $Replay, [System.Text.UTF8Encoding]::new($false))
    [System.IO.File]::WriteAllText($DivergentPath, $Divergent, [System.Text.UTF8Encoding]::new($false))

    $PassOutput = & pwsh -NoProfile -File $Comparator -BaselinePath $BaselinePath -ReplayPath $ReplayPath -Root $Root 2>&1
    $PassCode = $LASTEXITCODE
    $PassText = ($PassOutput | Out-String)

    if ($PassCode -ne 0) {
        throw ("Expected identical traces to pass, exit code was $PassCode." + [Environment]::NewLine + $PassText)
    }

    if ($PassText -notmatch '"status"\s*:\s*"PASS"') {
        throw ("Identical trace output did not report PASS." + [Environment]::NewLine + $PassText)
    }

    $FailOutput = & pwsh -NoProfile -File $Comparator -BaselinePath $BaselinePath -ReplayPath $DivergentPath -Root $Root 2>&1
    $FailCode = $LASTEXITCODE
    $FailText = ($FailOutput | Out-String)

    if ($FailCode -eq 0) {
        throw ("Expected divergent traces to fail." + [Environment]::NewLine + $FailText)
    }

    if ($FailText -notmatch '"divergence_tick"\s*:\s*1') {
        throw ("Divergent trace output did not report tick 1." + [Environment]::NewLine + $FailText)
    }

    Write-Host '[PASSED] Determinism trace comparator self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}

exit 0
