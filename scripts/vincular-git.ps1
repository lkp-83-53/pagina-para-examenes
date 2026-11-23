# Enlaza esta carpeta con el repositorio de GitHub. Se ejecuta UNA sola vez.
# Uso:  .\scripts\vincular-git.ps1
$ErrorActionPreference = "Stop"
$repo = "https://github.com/lkp-83-53/pagina-para-examenes.git"
$raiz = Split-Path -Parent $PSScriptRoot

Set-Location $raiz
Write-Host "Carpeta: $raiz" -ForegroundColor Cyan

if (Test-Path ".git") {
    Write-Host "Esta carpeta ya es un repositorio git. No hay nada que hacer." -ForegroundColor Yellow
    git remote -v
    exit 0
}

git init -b main
if ($LASTEXITCODE -ne 0) { git init; git branch -M main }

git remote add origin $repo
git fetch --depth=1 origin main:refs/remotes/origin/main
git reset refs/remotes/origin/main
git branch --set-upstream-to=origin/main main

Write-Host ""
Write-Host "Listo. Estado actual:" -ForegroundColor Green
git status --short --branch
Write-Host ""
Write-Host "Si no aparece ningun archivo modificado, tu copia local es identica a GitHub." -ForegroundColor Gray
