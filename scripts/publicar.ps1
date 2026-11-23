# Sube los cambios de esta carpeta a GitHub.
# Uso:  .\scripts\publicar.ps1 "lo que cambie"
param([string]$Mensaje = "")
$ErrorActionPreference = "Stop"
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz

if (-not (Test-Path ".git")) {
    Write-Host "Esta carpeta no esta enlazada a git. Ejecuta primero: .\scripts\vincular-git.ps1" -ForegroundColor Red
    exit 1
}

git add -A
$pendientes = git diff --cached --name-only
if (-not $pendientes) {
    Write-Host "No hay cambios que subir." -ForegroundColor Yellow
    exit 0
}

Write-Host "Se van a subir estos archivos:" -ForegroundColor Cyan
$pendientes | ForEach-Object { Write-Host "  $_" }

if (-not $Mensaje) { $Mensaje = "Actualiza la pagina - " + (Get-Date -Format "yyyy-MM-dd HH:mm") }

git commit -m $Mensaje
git push origin main

Write-Host ""
Write-Host "Subido. GitHub Pages se actualiza en 1 a 3 minutos:" -ForegroundColor Green
Write-Host "https://lkp-83-53.github.io/pagina-para-examenes/" -ForegroundColor Cyan
