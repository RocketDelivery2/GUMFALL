# Collect-EngineEvaluationEnvironment.ps1
# Collects non-identifying machine/tool metadata for GUMFALL engine-evaluation evidence.
# This is evaluation tooling only; it does not select an engine or implement runtime game code.

[CmdletBinding()]
param(
    [string]$OutputPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-CommandVersion {
    param(
        [Parameter(Mandatory)]
        [string]$CommandName,
        [string[]]$VersionArgs = @('--version')
    )

    $Command = Get-Command $CommandName -ErrorAction SilentlyContinue
    if ($null -eq $Command) {
        return $null
    }

    try {
        $Text = (& $Command.Source @VersionArgs 2>&1 | Out-String).Trim()
        if ([string]::IsNullOrWhiteSpace($Text)) {
            return [ordered]@{
                path = $Command.Source
                version = $null
            }
        }

        return [ordered]@{
            path = $Command.Source
            version = $Text
        }
    } catch {
        return [ordered]@{
            path = $Command.Source
            version = $null
        }
    }
}

$Os = [ordered]@{
    platform = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription
    architecture = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString()
}

$Cpu = [ordered]@{
    model = $null
    logical_processors = [Environment]::ProcessorCount
}

$MemoryBytes = $null
$GpuNames = @()

if ($IsWindows) {
    try {
        $CpuInfo = Get-CimInstance Win32_Processor | Select-Object -First 1
        if ($null -ne $CpuInfo) {
            $Cpu.model = $CpuInfo.Name.Trim()
        }
    } catch {
        # Fall back to portable processor-count metadata.
    }

    try {
        $ComputerSystem = Get-CimInstance Win32_ComputerSystem
        if ($null -ne $ComputerSystem) {
            $MemoryBytes = [int64]$ComputerSystem.TotalPhysicalMemory
        }
    } catch {
        # RAM remains unknown if CIM is unavailable.
    }

    try {
        $GpuNames = @(
            Get-CimInstance Win32_VideoController |
                ForEach-Object { $_.Name } |
                Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
                Sort-Object -Unique
        )
    } catch {
        $GpuNames = @()
    }
} elseif ($IsLinux) {
    if (Test-Path /proc/cpuinfo) {
        $ModelLine = Get-Content /proc/cpuinfo |
            Where-Object { $_ -match '^model name\s*:' } |
            Select-Object -First 1
        if ($ModelLine) {
            $Cpu.model = ($ModelLine -replace '^model name\s*:\s*', '').Trim()
        }
    }

    if (Test-Path /proc/meminfo) {
        $MemLine = Get-Content /proc/meminfo |
            Where-Object { $_ -match '^MemTotal:\s+' } |
            Select-Object -First 1
        if ($MemLine -match '^MemTotal:\s+(\d+)\s+kB') {
            $MemoryBytes = [int64]$Matches[1] * 1KB
        }
    }
}

$Git = Get-CommandVersion -CommandName 'git'
$Pwsh = [ordered]@{
    path = (Get-Process -Id $PID).Path
    version = $PSVersionTable.PSVersion.ToString()
}

$CandidateTools = [ordered]@{
    unity = $null
    unreal = $null
    godot = Get-CommandVersion -CommandName 'godot'
    o3de = Get-CommandVersion -CommandName 'o3de'
}

# Unity and Unreal do not reliably expose a stable command on PATH across installations.
# Record only environment-provided executable hints; do not scan user folders or emit usernames.
foreach ($Name in @('UNITY_EDITOR_PATH', 'UNITY_PATH')) {
    $Value = [Environment]::GetEnvironmentVariable($Name)
    if (-not [string]::IsNullOrWhiteSpace($Value)) {
        $CandidateTools.unity = [ordered]@{
            source = $Name
            path = $Value
        }
        break
    }
}

foreach ($Name in @('UNREAL_EDITOR_PATH', 'UE_EDITOR_PATH')) {
    $Value = [Environment]::GetEnvironmentVariable($Name)
    if (-not [string]::IsNullOrWhiteSpace($Value)) {
        $CandidateTools.unreal = [ordered]@{
            source = $Name
            path = $Value
        }
        break
    }
}

$Result = [ordered]@{
    schema_version = '1.0.0'
    collected_at_utc = [DateTime]::UtcNow.ToString('o')
    purpose = 'GUMFALL engine-evaluation environment metadata'
    privacy = [ordered]@{
        hostname_collected = $false
        username_collected = $false
        serial_numbers_collected = $false
        network_identifiers_collected = $false
    }
    os = $Os
    cpu = $Cpu
    memory_bytes = $MemoryBytes
    gpu_names = $GpuNames
    powershell = $Pwsh
    git = $Git
    candidate_tools = $CandidateTools
}

$Json = $Result | ConvertTo-Json -Depth 8

if (-not [string]::IsNullOrWhiteSpace($OutputPath)) {
    $Parent = Split-Path -Parent $OutputPath
    if (-not [string]::IsNullOrWhiteSpace($Parent) -and -not (Test-Path $Parent)) {
        New-Item -ItemType Directory -Path $Parent -Force | Out-Null
    }

    [System.IO.File]::WriteAllText(
        [System.IO.Path]::GetFullPath($OutputPath),
        $Json + [Environment]::NewLine,
        [System.Text.UTF8Encoding]::new($false)
    )
}

$Json
