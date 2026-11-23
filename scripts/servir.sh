#!/usr/bin/env bash
# Abre la pagina en un servidor local (http://localhost:8080).
# Uso:  ./scripts/servir.sh        (Ctrl+C para detener)
RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$RAIZ"

PY=""
command -v python  >/dev/null 2>&1 && PY="python"
[ -z "$PY" ] && command -v py >/dev/null 2>&1 && PY="py"

if [ -z "$PY" ]; then
  echo "No encontre Python. Abriendo el archivo directamente."
  start index.html 2>/dev/null || explorer.exe index.html
  exit 0
fi

echo "Servidor en http://localhost:8080  (Ctrl+C para detener)"
start "http://localhost:8080/index.html" 2>/dev/null &
"$PY" -m http.server 8080
