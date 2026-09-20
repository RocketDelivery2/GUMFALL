# Test-EngineEvaluationReconciliationTool.ps1
# Self-test for Summarize-EngineEvaluationReconciliation.ps1.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Tool = Join-Path $Root 'tools/Summarize-EngineEvaluationReconciliation.ps1'
if (-not (Test-Path -LiteralPath $Tool -PathType Leaf)) {
    throw "Reconciliation summarizer not found: $Tool"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-reconciliation-test-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null

try {
    $CsvPath = Join-Path $TempRoot 'reconciliation.csv'
    $InvalidCsvPath = Join-Path $TempRoot 'invalid.csv'

    @'
event_id,client_role,predicted_value,authoritative_value,correction_magnitude,correction_ms,server_authority_preserved
1,client-a,10,9,1,12,true
2,client-b,20,18,2,18,true
'@ | Set-Content -LiteralPath $CsvPath -Encoding utf8NoBOM

    @'
event_id,client_role,predicted_value,authoritative_value,correction_magnitude,correction_ms,server_authority_preserved
2,client-a,10,9,1,12,true
2,client-b,20,18,2,18,true
'@ | Set-Content -LiteralPath $InvalidCsvPath -Encoding utf8NoBOM

    $Output = & pwsh -NoProfile -File $Tool -CsvPath $CsvPath 2>&1
    $Code = $LASTEXITCODE
    $Text = ($Output | Out-String)

    if ($Code -ne 0) {
        throw ("Expected valid reconciliation data to exit 0." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"status"\s*:\s*"MEASURED"') {
        throw ("Reconciliation summary did not report MEASURED." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"event_count"\s*:\s*2') {
        throw ("Reconciliation summary did not report two events." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"authority_violation_count"\s*:\s*0') {
        throw ("Reconciliation summary did not report zero authority violations." + [Environment]::NewLine + $Text)
    }

    if ($Text -notmatch '"authority_preserved_for_all_events"\s*:\s*true') {
        throw ("Reconciliation summary did not report preserved authority." + [Environment]::NewLine + $Text)
    }

    $InvalidOutput = & pwsh -NoProfile -File $Tool -CsvPath $InvalidCsvPath 2>&1
    $InvalidCode = $LASTEXITCODE
    if ($InvalidCode -eq 0) {
        throw ("Expected duplicate event IDs to fail." + [Environment]::NewLine + ($InvalidOutput | Out-String))
    }

    Write-Host '[PASSED] Prototype 4 reconciliation summarizer self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}

exit 0
