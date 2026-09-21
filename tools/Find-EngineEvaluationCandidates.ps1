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

function Get-PathMatches {
    param(
        [Parameter(Mandatory)]
        [string]$Root,
        [Parameter(Mandatory)]
        [string[]]$Segments
    )

    $Pattern = $Root
    foreach ($Segment in $Segments) {
        $Pattern = Join-Path -Path $Pattern -ChildPath $Segment
    }

    return @(
        Get-ChildItem -Path $Pattern -File -ErrorAction SilentlyContinue |
            Sort-Object FullName
    )
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
    foreach ($File in (Get-PathMatches -Root $Root -Segments @('Unity','Hub','Editor','*','Editor','Unity.exe'))) {
        $EditorDir = Split-Path -Parent $File.FullName
        $VersionDir = Split-Path -Parent $EditorDir
        $Version = Split-Path -Leaf $VersionDir
        $Candidates += New-CandidateRecord -Candidate 'unity' -Path $File.FullName -Source 'system-install-location' -InferredVersion $Version
    }

    foreach ($File in (Get-PathMatches -Root $Root -Segments @('Epic Games','UE_*','Engine','Binaries','Win64','UnrealEditor.exe'))) {
        $Version = $null
        if ($File.FullName -match '[\\/]UE_([^\\/]+)[\\/]') {
            $Version = $Matches[1]
        }
        $Candidates += New-CandidateRecord -Candidate 'unreal' -Path $File.FullName -Source 'system-install-location' -InferredVersion $Version
    }

    foreach ($File in (Get-PathMatches -Root $Root -Segments @('Epic Games','UE_*','Engine','Binaries','Win64','UE4Editor.exe'))) {
        $Version = $null
        if ($File.FullName -match '[\\/]UE_([^\\/]+)[\\/]') {
            $Version = $Matches[1]
        }
        $Candidates += New-CandidateRecord -Candidate 'unreal' -Path $File.FullName -Source 'system-install-location' -InferredVersion $Version
    }

    foreach ($File in (Get-PathMatches -Root $Root -Segments @('Godot*','Godot*.exe'))) {
        $Version = $null
        if ($File.Name -match '(?i)Godot[_-]?v?([0-9][A-Za-z0-9.\-]*)') {
            $Version = $Matches[1]
        }
        $Candidates += New-CandidateRecord -Candidate 'godot' -Path $File.FullName -Source 'system-install-location' -InferredVersion $Version
    }

    foreach ($File in (Get-PathMatches -Root $Root -Segments @('O3DE*','bin','profile','Editor.exe'))) {
        $Version = $null
        if ($File.FullName -match '(?i)[\\/]O3DE[_-]?([^\\/]*)[\\/]') {
            $Version = $Matches[1]
        }
        $Candidates += New-CandidateRecord -Candidate 'o3de' -Path $File.FullName -Source 'system-install-location' -InferredVersion $Version
    }

    foreach ($File in (Get-PathMatches -Root $Root -Segments @('Unity Hub','Unity Hub.exe'))) {
        $Launchers += [ordered]@{
            launcher = 'unity-hub'
            path = [System.IO.Path]::GetFullPath($File.FullName)
            product_version = Get-FileProductVersion -Path $File.FullName
        }
    }

    foreach ($File in (Get-PathMatches -Root $Root -Segments @('Epic Games','Launcher','Portal','Binaries','Win64','EpicGamesLauncher.exe'))) {
        $Launchers += [ordered]@{
            launcher = 'epic-games-launcher'
            path = [System.IO.Path]::GetFullPath($File.FullName)
            product_version = Get-FileProductVersion -Path $File.FullName
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
