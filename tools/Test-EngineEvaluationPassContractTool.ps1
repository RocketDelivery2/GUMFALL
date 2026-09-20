# Test-EngineEvaluationPassContractTool.ps1
# Self-tests Prototype 3 and Prototype 4 PASS evidence schema requirements.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$SchemaPath = Join-Path $Root 'schemas/engine_evaluation_result.schema.json'
if (-not (Test-Path -LiteralPath $SchemaPath -PathType Leaf)) {
    throw "Engine evaluation result schema not found: $SchemaPath"
}

if ($PSVersionTable.PSVersion.Major -lt 7 -or
    ($PSVersionTable.PSVersion.Major -eq 7 -and $PSVersionTable.PSVersion.Minor -lt 4)) {
    throw "PowerShell 7.4+ is required for Test-Json schema validation."
}

function Assert-SchemaResult {
    param(
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$Json,
        [Parameter(Mandatory)]
        [bool]$ExpectedValid
    )

    $Actual = Test-Json -Json $Json -SchemaFile $SchemaPath -ErrorAction SilentlyContinue
    if ($Actual -ne $ExpectedValid) {
        throw "$Name expected schema validity $ExpectedValid but got $Actual."
    }
}

$Prototype3Pass = @'
{
  "schema_version": "1.0.0",
  "candidate": "custom",
  "prototype": "prototype-3-gummy-deformation",
  "result": "PASS",
  "executed_at_utc": "2026-09-20T19:00:00Z",
  "source_sha": "1111111111111111111111111111111111111111",
  "engine": {
    "name": "test-harness",
    "version": "1.0",
    "modules": []
  },
  "environment": {
    "os": "test",
    "cpu": "test"
  },
  "measurements": {
    "runtime_stretch_compress_visible": true,
    "limb_separation_visible": true,
    "post_separation_animation_visible": true,
    "ik_or_procedural_adjustment_visible": true,
    "visual_review_result": "ACCEPTABLE FOR ENGINE EVALUATION",
    "capture_artifact": "capture/prototype3.mp4",
    "average_fps": 60
  },
  "artifacts": [
    "capture/prototype3.mp4"
  ],
  "limitations": []
}
'@

$Prototype3Invalid = $Prototype3Pass -replace '"average_fps": 60', '"average_fps": 59'

$Prototype4Pass = @'
{
  "schema_version": "1.0.0",
  "candidate": "custom",
  "prototype": "prototype-4-server-authority",
  "result": "PASS",
  "executed_at_utc": "2026-09-20T19:00:00Z",
  "source_sha": "2222222222222222222222222222222222222222",
  "engine": {
    "name": "test-harness",
    "version": "1.0",
    "modules": []
  },
  "environment": {
    "os": "test",
    "cpu": "test"
  },
  "measurements": {
    "client_count": 2,
    "simulated_latency_ms": 60,
    "inputs_reached_authoritative_server": true,
    "authoritative_state_returned_to_both_clients": true,
    "deliberate_prediction_mismatch_injected": true,
    "reconciliation_observed": true,
    "server_authority_preserved": true,
    "visible_pop_review": "ACCEPTABLE FOR ENGINE EVALUATION",
    "input_log_artifact": "logs/input.jsonl",
    "authoritative_state_log_artifact": "logs/state.jsonl",
    "reconciliation_log_artifact": "logs/reconciliation.jsonl",
    "errors_desync_artifact": "logs/errors.jsonl"
  },
  "artifacts": [
    "logs/input.jsonl",
    "logs/state.jsonl",
    "logs/reconciliation.jsonl",
    "logs/errors.jsonl"
  ],
  "limitations": []
}
'@

$Prototype4Invalid = $Prototype4Pass -replace '"server_authority_preserved": true', '"server_authority_preserved": false'

Assert-SchemaResult -Name 'Prototype 3 valid PASS' -Json $Prototype3Pass -ExpectedValid $true
Assert-SchemaResult -Name 'Prototype 3 invalid sub-60 PASS' -Json $Prototype3Invalid -ExpectedValid $false
Assert-SchemaResult -Name 'Prototype 4 valid PASS' -Json $Prototype4Pass -ExpectedValid $true
Assert-SchemaResult -Name 'Prototype 4 invalid authority PASS' -Json $Prototype4Invalid -ExpectedValid $false

Write-Host '[PASSED] Prototype 3/4 PASS evidence schema self-test passed.'
