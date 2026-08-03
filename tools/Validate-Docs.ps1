# Validate-Docs.ps1
# GUMFALL repository documentation validation script.
# No external module dependencies. Requires PowerShell 7.4+ (pwsh).
#
# Checks:
#   1. All *.json files parse without error.
#   2. Required canonical Markdown documents exist.
#   3. Relative Markdown links resolve to real files.
#   4. No Markdown files are empty or whitespace-only.
#   5. No files under design-private/ are tracked by git.
#   6. No merge conflict markers are present.
#   7. Every JSON file in content/examples validates against its declared $schema
#      (requires PowerShell 7.4+ for Test-Json -SchemaFile).
#
# Exit code 0 = all checks pass.
# Exit code 1 = one or more failures.

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Continue'

$RepoRoot = $PSScriptRoot | Split-Path -Parent
$Failures = [System.Collections.Generic.List[string]]::new()
$Warnings = [System.Collections.Generic.List[string]]::new()

function Write-Check {
    param([string]$Message)
    Write-Host "  [CHECK] $Message" -ForegroundColor Cyan
}

function Write-Pass {
    param([string]$Message)
    Write-Host "  [PASS]  $Message" -ForegroundColor Green
}

function Write-Fail {
    param([string]$Message)
    Write-Host "  [FAIL]  $Message" -ForegroundColor Red
    $script:Failures.Add($Message)
}

function Write-Warn {
    param([string]$Message)
    Write-Host "  [WARN]  $Message" -ForegroundColor Yellow
    $script:Warnings.Add($Message)
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor White
Write-Host "  GUMFALL Documentation Validation" -ForegroundColor White
Write-Host "  Repository root: $RepoRoot" -ForegroundColor Gray
Write-Host "================================================================" -ForegroundColor White
Write-Host ""

# ── CHECK 1: JSON files parse without error ───────────────────────────────────
Write-Host "CHECK 1: JSON parse validation" -ForegroundColor White

$JsonFiles = Get-ChildItem -Path $RepoRoot -Recurse -Filter "*.json" |
    Where-Object { $_.FullName -notmatch [regex]::Escape("design-private") } |
    Where-Object { $_.FullName -notmatch [regex]::Escape("node_modules") }

if ($JsonFiles.Count -eq 0) {
    Write-Warn "No JSON files found to validate."
} else {
    foreach ($File in $JsonFiles) {
        $RelPath = $File.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
        Write-Check $RelPath
        try {
            $Content = Get-Content -Path $File.FullName -Raw -ErrorAction Stop
            $null = $Content | ConvertFrom-Json -ErrorAction Stop
            Write-Pass $RelPath
        } catch {
            Write-Fail "JSON parse error in '$RelPath': $($_.Exception.Message)"
        }
    }
}

Write-Host ""

# ── CHECK 2: Required canonical Markdown documents exist ──────────────────────
Write-Host "CHECK 2: Required canonical documents exist" -ForegroundColor White

$RequiredDocs = @(
    "AGENTS.md",
    "CHANGELOG.md",
    ".editorconfig",
    ".gitattributes",
    ".github/instructions/docs.instructions.md",
    ".github/prompts/expand-gumfall-design.prompt.md",
    ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/ISSUE_TEMPLATE/design-question.md",
    ".github/ISSUE_TEMPLATE/implementation-task.md",
    ".github/workflows/docs-validation.yml",
    "tools/Validate-Docs.ps1",
    "schemas/ability.schema.json",
    "schemas/weapon.schema.json",
    "schemas/armor.schema.json",
    "schemas/monster.schema.json",
    "schemas/enchantment.schema.json",
    "schemas/lineage.schema.json",
    "schemas/class.schema.json",
    "schemas/quest.schema.json",
    "schemas/loot_source.schema.json",
    "schemas/character.schema.json",
    "content/examples/bearkin-edgebearer-duelist.example.json",
    "content/examples/sugar-wolf.example.json",
    "content/examples/bronze-shortsword.example.json",
    "docs/governance/DESIGN_AUTHORITY.md",
    "docs/governance/PUBLIC_PRIVATE_BOUNDARIES.md",
    "docs/governance/DECISION_LOG.md",
    "docs/governance/ASSUMPTION_REGISTER.md"
)

foreach ($Doc in $RequiredDocs) {
    $FullPath = Join-Path $RepoRoot $Doc
    Write-Check $Doc
    if (Test-Path -Path $FullPath -PathType Leaf) {
        Write-Pass $Doc
    } else {
        Write-Fail "Required document missing: '$Doc'"
    }
}

Write-Host ""

# ── CHECK 3: Relative Markdown links resolve ──────────────────────────────────
Write-Host "CHECK 3: Relative Markdown link resolution" -ForegroundColor White

$MarkdownFiles = Get-ChildItem -Path $RepoRoot -Recurse -Filter "*.md" |
    Where-Object { $_.FullName -notmatch [regex]::Escape("design-private") } |
    Where-Object { $_.FullName -notmatch [regex]::Escape("node_modules") }

# Match [text](./path) or [text](../path) or [text](relative/path) but not http:// or #anchor-only
$LinkPattern = '\[([^\]]+)\]\((?!https?://)(?!#)([^)#]+?)(?:#[^)]*)?\)'

foreach ($File in $MarkdownFiles) {
    $RelFile = $File.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
    $FileDir = $File.DirectoryName
    $Content = Get-Content -Path $File.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($Content)) { continue }

    $Matches = [regex]::Matches($Content, $LinkPattern)
    foreach ($Match in $Matches) {
        $LinkTarget = $Match.Groups[2].Value.Trim()
        # Skip mailto: links
        if ($LinkTarget -match '^mailto:') { continue }
        # Skip pure anchors
        if ($LinkTarget -match '^#') { continue }
        # Resolve relative to file's directory
        $ResolvedPath = Join-Path $FileDir $LinkTarget
        $ResolvedPath = [System.IO.Path]::GetFullPath($ResolvedPath)
        if (-not (Test-Path -Path $ResolvedPath)) {
            Write-Fail "Broken link in '$RelFile': '$LinkTarget' -> '$ResolvedPath' not found."
        }
    }
}

Write-Pass "Relative Markdown link check complete."
Write-Host ""

# ── CHECK 4: No empty Markdown files ─────────────────────────────────────────
Write-Host "CHECK 4: Empty Markdown file detection" -ForegroundColor White

foreach ($File in $MarkdownFiles) {
    $RelFile = $File.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
    if ($File.Length -eq 0) {
        Write-Fail "Empty file (0 bytes): '$RelFile'"
        continue
    }
    $Content = Get-Content -Path $File.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($Content)) {
        Write-Fail "Whitespace-only Markdown file: '$RelFile'"
    }
}

Write-Pass "Empty file check complete."
Write-Host ""

# ── CHECK 5: No design-private/ files tracked by git ─────────────────────────
Write-Host "CHECK 5: design-private/ not tracked by git" -ForegroundColor White

try {
    $TrackedPrivate = & git -C $RepoRoot ls-files "design-private/" 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Warn "git ls-files exited with code $LASTEXITCODE. Skipping design-private check."
    } elseif (-not [string]::IsNullOrWhiteSpace($TrackedPrivate)) {
        foreach ($TrackedFile in ($TrackedPrivate -split "`n" | Where-Object { $_ -ne '' })) {
            Write-Fail "design-private/ file is tracked by git: '$TrackedFile'. Remove it from tracking."
        }
    } else {
        Write-Pass "No design-private/ files are tracked by git."
    }
} catch {
    Write-Warn "Could not run git ls-files: $($_.Exception.Message). Skipping design-private check."
}

Write-Host ""

# ── CHECK 6: No merge conflict markers ───────────────────────────────────────
Write-Host "CHECK 6: Merge conflict marker detection" -ForegroundColor White

$AllTextFiles = Get-ChildItem -Path $RepoRoot -Recurse -Include "*.md", "*.json", "*.yml", "*.yaml", "*.ps1" |
    Where-Object { $_.FullName -notmatch [regex]::Escape("design-private") } |
    Where-Object { $_.FullName -notmatch [regex]::Escape("node_modules") }

# Markers are checked by line prefix — split to avoid self-triggering.
# Actual conflict markers start at the beginning of a line.
$ConflictFound = $false

foreach ($File in $AllTextFiles) {
    $RelFile = $File.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
    $Lines = Get-Content -Path $File.FullName -ErrorAction SilentlyContinue
    if ($null -eq $Lines) { continue }
    $LineNum = 0
    foreach ($Line in $Lines) {
        $LineNum++
        $Trimmed = $Line.TrimStart()
        if ($Trimmed.StartsWith('<<<<<<<') -or $Trimmed.StartsWith('=======') -or $Trimmed.StartsWith('>>>>>>>')) {
            Write-Fail "Merge conflict marker found in '$RelFile' at line $LineNum."
            $ConflictFound = $true
            break
        }
    }
}

if (-not $ConflictFound) {
    Write-Pass "No merge conflict markers found."
}

Write-Host ""

# ── CHECK 7: JSON Schema validation for content/examples ─────────────────────
Write-Host "CHECK 7: JSON Schema validation for content/examples" -ForegroundColor White

# Requires PowerShell 7.4+ for Test-Json -SchemaFile support.
$PsVersion = $PSVersionTable.PSVersion
if ($PsVersion.Major -lt 7 -or ($PsVersion.Major -eq 7 -and $PsVersion.Minor -lt 4)) {
    Write-Warn "PowerShell 7.4+ required for JSON Schema validation (Test-Json -SchemaFile). Current: $($PsVersion.ToString()). Skipping CHECK 7."
} else {
    $ExamplesDir = Join-Path $RepoRoot "content/examples"
    $ExampleFiles = Get-ChildItem -Path $ExamplesDir -Filter "*.json" -ErrorAction SilentlyContinue

    if ($null -eq $ExampleFiles -or $ExampleFiles.Count -eq 0) {
        Write-Warn "No example JSON files found in content/examples. Skipping schema validation."
    } else {
        foreach ($ExFile in $ExampleFiles) {
            $ExRelPath = $ExFile.FullName.Substring($RepoRoot.Length).TrimStart('\', '/')
            Write-Check $ExRelPath

            $ExContent = Get-Content -Path $ExFile.FullName -Raw -ErrorAction Stop
            $ExJson = $null
            try {
                $ExJson = $ExContent | ConvertFrom-Json -ErrorAction Stop
            } catch {
                Write-Fail "Cannot parse JSON for schema validation in '$ExRelPath': $($_.Exception.Message)"
                continue
            }

            $SchemaRef = $ExJson.'$schema'
            if ([string]::IsNullOrWhiteSpace($SchemaRef)) {
                Write-Fail "Missing `$schema field in '$ExRelPath'. Cannot perform schema validation."
                continue
            }

            # Resolve schema path relative to the example file's directory
            $ExFileDir = $ExFile.DirectoryName
            $SchemaPath = Join-Path $ExFileDir $SchemaRef
            $SchemaPath = [System.IO.Path]::GetFullPath($SchemaPath)

            if (-not (Test-Path -Path $SchemaPath -PathType Leaf)) {
                Write-Fail "Schema file not found for '$ExRelPath': '$SchemaRef' -> '$SchemaPath'"
                continue
            }

            $SchemaContent = Get-Content -Path $SchemaPath -Raw -ErrorAction Stop

            # PowerShell's Test-Json does not support the JSON Schema 'examples' keyword.
            # Strip 'examples' arrays from the schema before validation to avoid false failures.
            $SchemaForValidation = $SchemaContent -replace '"examples"\s*:\s*\[(?:[^\[\]]|\[(?:[^\[\]]|\[[^\[\]]*\])*\])*\]\s*,?\s*', ''

            try {
                $IsValid = Test-Json -Json $ExContent -Schema $SchemaForValidation -ErrorAction SilentlyContinue
                if ($IsValid) {
                    Write-Pass "$ExRelPath validates against $SchemaRef"
                } else {
                    Write-Fail "Schema validation failed for '$ExRelPath' against '$SchemaRef'."
                }
            } catch {
                Write-Fail "Schema validation error for '$ExRelPath': $($_.Exception.Message)"
            }
        }
    }
}

Write-Host ""

# ── Summary ───────────────────────────────────────────────────────────────────
Write-Host "================================================================" -ForegroundColor White

if ($Warnings.Count -gt 0) {
    Write-Host "  WARNINGS ($($Warnings.Count)):" -ForegroundColor Yellow
    foreach ($W in $Warnings) {
        Write-Host "    - $W" -ForegroundColor Yellow
    }
    Write-Host ""
}

if ($Failures.Count -eq 0) {
    Write-Host "  RESULT: PASS — All checks passed." -ForegroundColor Green
    if ($Warnings.Count -gt 0) {
        Write-Host "  (Review warnings above.)" -ForegroundColor Yellow
    }
    Write-Host "================================================================" -ForegroundColor White
    Write-Host ""
    exit 0
} else {
    Write-Host "  RESULT: FAIL — $($Failures.Count) failure(s):" -ForegroundColor Red
    foreach ($F in $Failures) {
        Write-Host "    - $F" -ForegroundColor Red
    }
    Write-Host "================================================================" -ForegroundColor White
    Write-Host ""
    exit 1
}
