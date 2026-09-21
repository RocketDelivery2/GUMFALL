# Test-EngineEvaluationCandidateDiscoveryTool.ps1
# Self-test for Find-EngineEvaluationCandidates.ps1 using a temporary synthetic install tree.

[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Tool = Join-Path $Root 'tools/Find-EngineEvaluationCandidates.ps1'
if (-not (Test-Path -LiteralPath $Tool -PathType Leaf)) {
    throw "Candidate discovery tool not found: $Tool"
}

$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("gumfall-engine-discovery-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null

function Join-SyntheticPath {
    param(
        [string]$Base,
        [string[]]$Segments
    )

    $Path = $Base
    foreach ($Segment in $Segments) {
        $Path = Join-Path -Path $Path -ChildPath $Segment
    }

    return $Path
}

function New-EmptyFile {
    param([string]$Path)

    $Parent = Split-Path -Parent $Path
    New-Item -ItemType Directory -Path $Parent -Force | Out-Null
    [System.IO.File]::WriteAllBytes($Path, [byte[]]@())
}

try {
    New-EmptyFile -Path (Join-SyntheticPath -Base $TempRoot -Segments @('Unity','Hub','Editor','6000.3.1f1','Editor','Unity.exe'))
    New-EmptyFile -Path (Join-SyntheticPath -Base $TempRoot -Segments @('Epic Games','UE_5.6','Engine','Binaries','Win64','UnrealEditor.exe'))
    New-EmptyFile -Path (Join-SyntheticPath -Base $TempRoot -Segments @('Godot','Godot_v4.5-stable_win64.exe'))
    New-EmptyFile -Path (Join-SyntheticPath -Base $TempRoot -Segments @('O3DE_25.05','bin','profile','Editor.exe'))
    New-EmptyFile -Path (Join-SyntheticPath -Base $TempRoot -Segments @('Unity Hub','Unity Hub.exe'))

    Write-Host 'Synthetic install tree:'
    Get-ChildItem -LiteralPath $TempRoot -Recurse -Force | ForEach-Object { Write-Host $_.FullName }

    $Raw = & $Tool -SearchRoots @($TempRoot)
    Write-Host 'Discovery output:'
    Write-Host $Raw
    $Result = $Raw | ConvertFrom-Json

    if ($Result.privacy.user_profile_scanned -ne $false) {
        throw 'Candidate discovery privacy contract changed unexpectedly.'
    }

    if ($Result.privacy.executables_launched -ne $false) {
        throw 'Candidate discovery must not launch candidate executables.'
    }

    $Names = @($Result.candidates | ForEach-Object { $_.candidate })

    foreach ($Expected in @('unity','unreal','godot','o3de')) {
        if ($Names -notcontains $Expected) {
            throw "Synthetic $Expected installation was not discovered."
        }
    }

    $Unity = @($Result.candidates | Where-Object { $_.candidate -eq 'unity' })[0]
    if ($Unity.inferred_version -ne '6000.3.1f1') {
        throw "Unexpected Unity version inference: $($Unity.inferred_version)"
    }

    $Unreal = @($Result.candidates | Where-Object { $_.candidate -eq 'unreal' })[0]
    if ($Unreal.inferred_version -ne '5.6') {
        throw "Unexpected Unreal version inference: $($Unreal.inferred_version)"
    }

    if (@($Result.launchers | Where-Object { $_.launcher -eq 'unity-hub' }).Count -ne 1) {
        throw 'Synthetic Unity Hub installation was not discovered.'
    }

    Write-Host '[PASSED] Engine candidate discovery self-test passed.'
}
finally {
    if (Test-Path -LiteralPath $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}
