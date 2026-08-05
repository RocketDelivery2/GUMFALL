[CmdletBinding()]
param(
    [string] $Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Extensions = @(
    '.md', '.txt', '.json', '.cs', '.ps1', '.yml', '.yaml',
    '.bicep', '.bicepparam', '.csproj', '.slnx', '.html', '.css',
    '.js', '.asmdef'
)

$SecretPatterns = @(
    '-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----',
    '\b(?:ghp_|github_pat_)[A-Za-z0-9_]{20,}\b',
    '\bsk-proj-[A-Za-z0-9_-]{20,}\b',
    'DefaultEndpointsProtocol=https;AccountName='
)

$Findings = New-Object System.Collections.Generic.List[string]

$Files = Get-ChildItem -LiteralPath $Root -Recurse -File |
    Where-Object { $Extensions -contains $_.Extension.ToLowerInvariant() }

foreach ($File in $Files) {
    $Relative = $File.FullName.Substring($Root.Length).TrimStart('\', '/')
    $Content = Get-Content -LiteralPath $File.FullName -Raw

    $LineNumber = 0
    foreach ($Line in ($Content -split "`r?`n")) {
        $LineNumber++
        if ($Line.EndsWith(' ') -or $Line.EndsWith("`t")) {
            $Findings.Add("Trailing whitespace: $Relative:$LineNumber")
        }
    }

    if ($Relative -ne 'tools\Test-Production-Foundation.ps1' -and
        $Relative -ne 'tools/Test-Production-Foundation.ps1') {
        foreach ($Pattern in $SecretPatterns) {
            if ($Content -match $Pattern) {
                $Findings.Add("Potential secret pattern: $Relative")
            }
        }
    }
}

$JsonFiles = Get-ChildItem -LiteralPath $Root -Recurse -Filter '*.json' -File
foreach ($JsonFile in $JsonFiles) {
    try {
        Get-Content -LiteralPath $JsonFile.FullName -Raw |
            ConvertFrom-Json | Out-Null
    }
    catch {
        $Findings.Add("Invalid JSON: $($JsonFile.FullName)")
    }
}

$PrivateTracked = @(& git -C $Root ls-files 2>$null) |
    Where-Object {
        $_ -like 'design-private/*' -or
        $_ -like '*GUMFALL-Legal-Private*' -or
        $_ -like '*Patent-Pro-Bono*Request*.pdf'
    }

foreach ($PrivateFile in $PrivateTracked) {
    $Findings.Add("Private/protected file is tracked: $PrivateFile")
}

if ($Findings.Count -gt 0) {
    $Findings | ForEach-Object { Write-Host $_ }
    throw "Production foundation validation found $($Findings.Count) issue(s)."
}

Write-Host (
    '[PASSED] Production foundation validation passed for {0} files.' -f
    $Files.Count
)
