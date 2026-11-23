# Abre la pagina en un servidor local (http://localhost:8080).
# Util porque algunas funciones del navegador no corren bien con file:///
# Uso:  .\scripts\servir.ps1        (Ctrl+C para detener)
$raiz = Split-Path -Parent $PSScriptRoot
Set-Location $raiz

$python = (Get-Command python -ErrorAction SilentlyContinue)
if (-not $python) { $python = (Get-Command py -ErrorAction SilentlyContinue) }

if (-not $python) {
    Write-Host "No encontre Python. Abriendo el archivo directamente." -ForegroundColor Yellow
    Start-Process (Join-Path $raiz "index.html")
    exit 0
}

Write-Host "Servidor en http://localhost:8080  (Ctrl+C para detener)" -ForegroundColor Green
Start-Process "http://localhost:8080/index.html"
& $python.Source -m http.server 8080
