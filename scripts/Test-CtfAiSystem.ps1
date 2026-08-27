param(
    [string]$ChallengeId,
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Add-Error([string]$Message) { $errors.Add($Message) }
function Add-Warning([string]$Message) { $warnings.Add($Message) }

$requiredCore = @(
    "SKILL.md", "ROUTER.md", "SYSTEM_PROMPT.md", "AGENT_RULES.md",
    "KNOWLEDGE/sources_index.md", "KNOWLEDGE/tools_matrix.md",
    "KNOWLEDGE/card_template.yaml"
)
foreach ($relative in $requiredCore) {
    if (-not (Test-Path -LiteralPath (Join-Path $Root $relative))) { Add-Error "Missing core file: $relative" }
}

Get-ChildItem -LiteralPath (Join-Path $Root "OUTPUT") -Recurse -Filter attempts.json -File -ErrorAction SilentlyContinue | ForEach-Object {
    try {
        $null = Get-Content -Raw -LiteralPath $_.FullName | ConvertFrom-Json
    } catch { Add-Error "Invalid JSON: $($_.FullName): $($_.Exception.Message)" }
}

if ($ChallengeId) {
    $out = Join-Path $Root "OUTPUT/$ChallengeId"
    if (-not (Test-Path -LiteralPath $out)) {
        Add-Error "Missing output directory: OUTPUT/$ChallengeId"
    } else {
        foreach ($name in @("report.md", "timeline.md", "attempts.json", "reusable_patterns.md")) {
            if (-not (Test-Path -LiteralPath (Join-Path $out $name))) { Add-Error "Missing OUTPUT/$ChallengeId/$name" }
        }
        if (-not (Test-Path -LiteralPath (Join-Path $out "raw") -PathType Container)) { Add-Error "Missing OUTPUT/$ChallengeId/raw/" }
        $attemptsPath = Join-Path $out "attempts.json"
        $attempts = $null
        try {
            $attempts = Get-Content -Raw -LiteralPath $attemptsPath | ConvertFrom-Json
            if ($attempts -is [System.Array]) { Add-Error "attempts.json root must be an object, not an array" }
            if (-not $attempts.challenge_id) { Add-Error "attempts.json missing challenge_id" }
            if ($null -eq $attempts.attempts) { Add-Error "attempts.json missing attempts array" }
            if (-not $attempts.flag_status) { Add-Error "attempts.json missing flag_status" }
            foreach ($attempt in @($attempts.attempts)) {
                foreach ($field in @("t", "phase", "hypothesis_id", "action", "result", "evidence_path", "notes")) {
                    if ($null -eq $attempt.$field) { Add-Error "Attempt missing field '$field'" }
                }
            }
        } catch { Add-Error "Cannot validate attempts schema: $($_.Exception.Message)" }
        $flagPath = Join-Path $out "final_flag.txt"
        if (Test-Path -LiteralPath $flagPath) {
            if ($attempts.flag_status -ne "verified") { Add-Error "final_flag.txt exists but flag_status is not verified" }
        }
        $card = Join-Path $Root "KNOWLEDGE/cards/$ChallengeId.yaml"
        if (-not (Test-Path -LiteralPath $card)) {
            Add-Error "Missing knowledge card: KNOWLEDGE/cards/$ChallengeId.yaml"
        } else {
            $cardText = Get-Content -Raw -LiteralPath $card
            foreach ($field in @("id", "event", "category", "challenge_name", "status", "key_idea", "verification", "tools", "writeup", "solver", "time_heuristic")) {
                if ($cardText -notmatch "(?m)^$([regex]::Escape($field))\s*:") { Add-Error "Card missing field '$field': $card" }
            }
        }
    }
}

Get-ChildItem -LiteralPath $Root -Recurse -File | Where-Object { $_.Length -gt 5MB -and $_.FullName -notmatch '[\\/]raw[\\/]' } | ForEach-Object {
    Add-Warning "Large non-raw file: $($_.FullName) ($([math]::Round($_.Length / 1MB, 1)) MiB)"
}

foreach ($warning in $warnings) { Write-Warning $warning }
foreach ($err in $errors) { Write-Host "ERROR: $err" -ForegroundColor Red }
if ($errors.Count -gt 0) { exit 1 }
Write-Host "ctf-ai-system validation passed" -ForegroundColor Green
