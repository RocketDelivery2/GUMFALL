# Find-EngineEvaluationCandidates.ps1
# Discovers system-installed game-engine candidates without launching them.
# Default discovery is limited to system Program Files roots to avoid collecting user-profile paths.

[CmdletBinding()]
param(
    [string[]]$SearchRoots,
    [string]$OutputPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$IsWindowsPlatform = $env:OS -eq 'Windows_NT'

function Get-UniqueExistingRoots {
    param([string[]]$Roots)

    $Seen = @{}
    $Result = @()

    foreach ($Root in @($Roots)) {
        if ([string]::IsNullOrWhiteSpace($Root)) {
            continue
        }

        $Full = [System.IO.Path]::GetFullPath($Root)
        if (-not (Test-Path -LiteralPath $Full -PathType Container)) {
            continue
        }

        $Key = $Full.ToLowerInvariant()
        if (-not $Seen.ContainsKey($Key)) {
            $Seen[$Key] = $true
            $Result += $Full
        }
    }

    return $Result
}

if ($null -eq $SearchRoots -or $SearchRoots.Count -eq 0) {
    $DefaultRoots = @()

    if ($IsWindowsPlatform) {
        $DefaultRoots += $env:ProgramFiles

        $ProgramFilesX86 = [Environment]::GetEnvironmentVariable('ProgramFiles(x86)')
        if (-not [string]::IsNullOrWhiteSpace($ProgramFilesX86)) {
            $DefaultRoots += $ProgramFilesX86
        }
    }

    $SearchRoots = Get-UniqueExistingRoots -Roots $DefaultRoots
} else {
    $SearchRoots = Get-UniqueExistingRoots -Roots $SearchRoots
}

function Get-FileProductVersion {
    param([string]$Path)

    try {
        $Version = (Get-Item -LiteralPath $Path -ErrorAction Stop).VersionInfo.ProductVersion
        if (-not [string]::IsNullOrWhiteSpace($Version)) {
            return $Version
        }
    } catch {
    }

    return $null
}

function New-CandidateRecord {
    param(
        [Parameter(Mandatory)]
        [string]$Candidate,
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Source,
        [string]$InferredVersion
    )

    $ProductVersion = Get-FileProductVersion -Path $Path

    return [ordered]@{
        candidate = $Candidate
        path = [System.IO.Path]::GetFullPath($Path)
        source = $Source
        inferred_version = $InferredVersion
        product_version = $ProductVersion
    }
}

$Candidates = @()
$Launchers = @()

foreach ($Root in $SearchRoots) {
    $UnityEditorRoot = Join-Path (Join-Path (Join-Path $Root 'Unity') 'Hub') 'Editor'
    if (Test-Path -LiteralPath $UnityEditorRoot -PathType Container) {
        foreach ($VersionDir in @(Get-ChildItem -LiteralPath $UnityEditorRoot -Directory -ErrorAction SilentlyContinue)) {
            $UnityExe = Join-Path (Join-Path $VersionDir.FullName 'Editor') 'Unity.exe'
            if (Test-Path -LiteralPath $UnityExe -PathType Leaf) {
                $Candidates += New-CandidateRecord -Candidate 'unity' -Path $UnityExe -Source 'system-install-location' -InferredVersion $VersionDir.Name
            }
        }
    }

    $EpicRoot = Join-Path $Root 'Epic Games'
    if (Test-Path -LiteralPath $EpicRoot -PathType Container) {
        foreach ($EngineDir in @(Get-ChildItem -LiteralPath $EpicRoot -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'UE_*' })) {
            $UnrealExe = Join-Path (Join-Path (Join-Path (Join-Path $EngineDir.FullName 'Engine') 'Binaries') 'Win64') 'UnrealEditor.exe'
            $Unreal4Exe = Join-Path (Join-Path (Join-Path (Join-Path $EngineDir.FullName 'Engine') 'Binaries') 'Win64') 'UE4Editor.exe'
            $Version = $EngineDir.Name -replace '^UE_', ''

            if (Test-Path -LiteralPath $UnrealExe -PathType Leaf) {
                $Candidates += New-CandidateRecord -Candidate 'unreal' -Path $UnrealExe -Source 'system-install-location' -InferredVersion $Version
            } elseif (Test-Path -LiteralPath $Unreal4Exe -PathType Leaf) {
                $Candidates += New-CandidateRecord -Candidate 'unreal' -Path $Unreal4Exe -Source 'system-install-location' -InferredVersion $Version
            }
        }

        $EpicLauncher = Join-Path (Join-Path (Join-Path (Join-Path $EpicRoot 'Launcher') 'Portal') 'Binaries') 'Win64'
        $EpicLauncher = Join-Path $EpicLauncher 'EpicGamesLauncher.exe'
        if (Test-Path -LiteralPath $EpicLauncher -PathType Leaf) {
            $Launchers += [ordered]@{
                launcher = 'epic-games-launcher'
                path = [System.IO.Path]::GetFullPath($EpicLauncher)
                product_version = Get-FileProductVersion -Path $EpicLauncher
            }
        }
    }

    foreach ($GodotDir in @(Get-ChildItem -LiteralPath $Root -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'Godot*' })) {
        foreach ($GodotExe in @(Get-ChildItem -LiteralPath $GodotDir.FullName -File -Filter 'Godot*.exe' -ErrorAction SilentlyContinue)) {
            $Version = $null
            if ($GodotExe.Name -match '(?i)Godot[_-]?v?([0-9][A-Za-z0-9.\-]*)') {
                $Version = $Matches[1]
            }
            $Candidates += New-CandidateRecord -Candidate 'godot' -Path $GodotExe.FullName -Source 'system-install-location' -InferredVersion $Version
        }
    }

    foreach ($O3deDir in @(Get-ChildItem -LiteralPath $Root -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'O3DE*' })) {
        $O3deExe = Join-Path (Join-Path (Join-Path $O3deDir.FullName 'bin') 'profile') 'Editor.exe'
        if (Test-Path -LiteralPath $O3deExe -PathType Leaf) {
            $Version = $O3deDir.Name -replace '^(?i)O3DE[_-]?', ''
            $Candidates += New-CandidateRecord -Candidate 'o3de' -Path $O3deExe -Source 'system-install-location' -InferredVersion $Version
        }
    }

    $UnityHub = Join-Path (Join-Path $Root 'Unity Hub') 'Unity Hub.exe'
    if (Test-Path -LiteralPath $UnityHub -PathType Leaf) {
        $Launchers += [ordered]@{
            launcher = 'unity-hub'
            path = [System.IO.Path]::GetFullPath($UnityHub)
            product_version = Get-FileProductVersion -Path $UnityHub
        }
    }
}

$Candidates = @($Candidates | Sort-Object candidate,path -Unique)
$Launchers = @($Launchers | Sort-Object launcher,path -Unique)

$Result = [ordered]@{
    schema_version = '1.0.0'
    purpose = 'GUMFALL engine-evaluation candidate discovery'
    privacy = [ordered]@{
        default_scan_scope = 'system-install-locations-only'
        user_profile_scanned = $false
        executables_launched = $false
    }
    search_roots = @($SearchRoots)
    candidates = $Candidates
    launchers = $Launchers
}

$Json = $Result | ConvertTo-Json -Depth 8

if (-not [string]::IsNullOrWhiteSpace($OutputPath)) {
    $Parent = Split-Path -Parent $OutputPath
    if (-not [string]::IsNullOrWhiteSpace($Parent) -and -not (Test-Path -LiteralPath $Parent)) {
        New-Item -ItemType Directory -Path $Parent -Force | Out-Null
    }

    [System.IO.File]::WriteAllText(
        [System.IO.Path]::GetFullPath($OutputPath),
        $Json + [Environment]::NewLine,
        [System.Text.UTF8Encoding]::new($false)
    )
}

$Json
