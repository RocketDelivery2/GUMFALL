# Test-EngineEvaluationEvidenceClassification.ps1
# Self-test for result-manifest classification and privacy checks.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Validator = Join-Path $Root 'tools/Test-EngineEvaluationEvidence.ps1'
$Schema = Join-Path $Root 'schemas/engine_evaluation_result.schema.json'

if (-not (Test-Path -LiteralPath $Validator -PathType Leaf)) {
    throw "Evidence validator not found: $Validator"
}

if (-not (Test-Path -LiteralPath $Schema -PathType Leaf)) {
    throw "Evidence schema not found: $Schema"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-evidence-classification-" + [guid]::NewGuid().ToString('N'))
$TempSchemaDir = Join-Path $TempRoot 'schemas'
$EvidenceDir = Join-Path $TempRoot 'evidence/engine-evaluation/custom/prototype-1-determinism'

New-Item -ItemType Directory -Path $TempSchemaDir -Force | Out-Null
New-Item -ItemType Directory -Path $EvidenceDir -Force | Out-Null
Copy-Item -LiteralPath $Schema -Destination (Join-Path $TempSchemaDir 'engine_evaluation_result.schema.json')

try {
    @'
{
  "schema_version": "1.0.0",
  "candidate": "custom",
  "prototype": "prototype-1-determinism",
  "result": "NOT_PERFORMED",
  "executed_at_utc": null,
  "source_sha": "1111111111111111111111111111111111111111",
  "engine": {
    "name": "UNKNOWN",
    "version": "UNKNOWN",
    "modules": []
  },
  "environment": {
    "os": "UNKNOWN",
    "cpu": "UNKNOWN"
  },
  "measurements": {},
  "artifacts": [],
  "limitations": []
}
'@ | Set-Content -LiteralPath (Join-Path $EvidenceDir 'result.json') -Encoding utf8NoBOM

    @'
{
  "schema_version": "1.0.0",
  "seed_id": "seed-001",
  "ticks": [
    { "tick": 0, "state_hash": "abc123" }
  ]
}
'@ | Set-Content -LiteralPath (Join-Path $EvidenceDir 'trace.json') -Encoding utf8NoBOM

    @'
{
  "os": {
    "platform": "test"
  },
  "cpu": {
    "model": "test"
  }
}
'@ | Set-Content -LiteralPath (Join-Path $EvidenceDir 'environment.json') -Encoding utf8NoBOM

    $PassOutput = & pwsh -NoProfile -File $Validator -Root $TempRoot 2>&1
    $PassCode = $LASTEXITCODE
    $PassText = ($PassOutput | Out-String)

    if ($PassCode -ne 0) {
        throw ("Expected safe raw JSON artifacts plus result.json to pass." + [Environment]::NewLine + $PassText)
    }

    if ($PassText -notmatch '1 result manifest\(s\) and 3 JSON artifact\(s\)') {
        throw ("Validator did not report expected classification counts." + [Environment]::NewLine + $PassText)
    }

    @'
{
  "hostname": "must-not-be-committed"
}
'@ | Set-Content -LiteralPath (Join-Path $EvidenceDir 'private-artifact.json') -Encoding utf8NoBOM

    $FailOutput = & pwsh -NoProfile -File $Validator -Root $TempRoot 2>&1
    $FailCode = $LASTEXITCODE
    $FailText = ($FailOutput | Out-String)

    if ($FailCode -eq 0) {
        throw ("Expected identifying metadata in a raw JSON artifact to fail." + [Environment]::NewLine + $FailText)
    }

    if ($FailText -notmatch 'Forbidden identifying key') {
        throw ("Privacy failure did not report the forbidden key." + [Environment]::NewLine + $FailText)
    }

    Write-Host '[PASSED] Engine evaluation evidence classification self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}

exit 0
