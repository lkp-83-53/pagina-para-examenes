#!/usr/bin/env bash
# Enlaza esta carpeta con el repositorio de GitHub. Se ejecuta UNA sola vez.
# Uso:  ./scripts/vincular-git.sh
set -e
REPO="https://github.com/lkp-83-53/pagina-para-examenes.git"
RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$RAIZ"
echo "Carpeta: $RAIZ"

if [ -d .git ]; then
  echo "Esta carpeta ya es un repositorio git. No hay nada que hacer."
  git remote -v
  exit 0
fi

git init -b main 2>/dev/null || { git init; git branch -M main; }
git remote add origin "$REPO"
git fetch --depth=1 origin main:refs/remotes/origin/main
git reset refs/remotes/origin/main
git branch --set-upstream-to=origin/main main

echo
echo "Listo. Estado actual:"
git status --short --branch
echo
echo "Si no aparece ningun archivo modificado, tu copia local es identica a GitHub."
