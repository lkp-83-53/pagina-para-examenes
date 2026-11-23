#!/usr/bin/env bash
# Sube los cambios de esta carpeta a GitHub.
# Uso:  ./scripts/publicar.sh "lo que cambie"
set -e
RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$RAIZ"

if [ ! -d .git ]; then
  echo "Esta carpeta no esta enlazada a git. Ejecuta primero: ./scripts/vincular-git.sh"
  exit 1
fi

git add -A
if git diff --cached --quiet; then
  echo "No hay cambios que subir."
  exit 0
fi

echo "Se van a subir estos archivos:"
git diff --cached --name-only | sed 's/^/  /'

MENSAJE="${1:-Actualiza la pagina - $(date '+%Y-%m-%d %H:%M')}"
git commit -m "$MENSAJE"
git push origin main

echo
echo "Subido. GitHub Pages se actualiza en 1 a 3 minutos:"
echo "https://lkp-83-53.github.io/pagina-para-examenes/"
