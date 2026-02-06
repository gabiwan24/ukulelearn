# Loop Master Mobile - Automatisch auf GitHub veroeffentlichen
# Voraussetzung: GitHub CLI (gh) installiert

$ErrorActionPreference = "Stop"
$repoName = (Get-Item -Path . -Force).Name

Write-Host ""
Write-Host "  Loop Master Mobile -> GitHub" -ForegroundColor Cyan
Write-Host "  Repo-Name: $repoName" -ForegroundColor Gray
Write-Host ""

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "  GitHub CLI (gh) ist nicht installiert." -ForegroundColor Yellow
    Write-Host "  Installieren: https://cli.github.com/" -ForegroundColor Gray
    exit 1
}

$authStatus = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "  Du bist noch nicht bei GitHub angemeldet." -ForegroundColor Yellow
    gh auth login
    if ($LASTEXITCODE -ne 0) { exit 1 }
}
Write-Host "  GitHub-Anmeldung: OK" -ForegroundColor Green

if (-not (Test-Path .git)) {
    Write-Host "  Git-Repo wird angelegt ..." -ForegroundColor Gray
    git init
    git add index.html README.md .gitignore
    if (Test-Path publish-to-github.ps1) { git add publish-to-github.ps1 }
    git commit -m "Loop Master Mobile - initial"
    git branch -M main
    Write-Host "  Erster Commit: OK" -ForegroundColor Green
}
else {
    $status = git status --porcelain
    if ($status) {
        Write-Host "  Ungespeicherte Aenderungen. Committen? (j/n)" -ForegroundColor Yellow
        $answer = Read-Host
        if ($answer -match '^[jJyY]') {
            git add -A
            git commit -m "Update Loop Master Mobile"
            Write-Host "  Commit: OK" -ForegroundColor Green
        }
    }
}

Write-Host "  Repo wird auf GitHub erstellt und Code hochgeladen ..." -ForegroundColor Gray
gh repo create $repoName --public --source=. --remote=origin --push --description "Loop Master Mobile - Video/Audio-Loop-Uebung im Browser"

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "  Fehler beim Erstellen/Pushen." -ForegroundColor Red
    Write-Host "  Wenn das Repo bereits existiert: git remote add origin https://github.com/DEIN-USERNAME/$repoName.git" -ForegroundColor Yellow
    Write-Host "  Dann: git push -u origin main" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "  Fertig." -ForegroundColor Green
$login = gh api user -q .login
Write-Host "  Repo:    https://github.com/$login/$repoName" -ForegroundColor Cyan
Write-Host "  Pages:   Settings -> Pages (Source: main, /) aktivieren" -ForegroundColor Gray
Write-Host "           https://${login}.github.io/${repoName}/" -ForegroundColor Cyan
Write-Host ""
