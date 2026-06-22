#!/bin/bash
# push_all.sh — Pousse toutes les branches de feature vers GitHub
# Usage : ./push_all.sh

set -e

BRANCHES=(
  "develop"
  "feature/s1-matrices"
  "feature/s2-statistiques"
  "feature/s3-stats-mysql"
  "feature/s4-csv-mysql"
  "feature/s5-c-python"
)

echo "=== Push de toutes les branches ==="
for branch in "${BRANCHES[@]}"; do
  echo "[→] Pushing $branch..."
  git push origin "$branch" --set-upstream
  echo "[✓] $branch poussé"
done

echo ""
echo "=== Toutes les branches sont sur GitHub ==="
echo "Ouvre ces URLs pour créer les Pull Requests :"
REPO="https://github.com/lns-stack/flask-services-kanban"
echo "  PR s1 : $REPO/compare/develop...feature/s1-matrices"
echo "  PR s2 : $REPO/compare/develop...feature/s2-statistiques"
echo "  PR s3 : $REPO/compare/develop...feature/s3-stats-mysql"
echo "  PR s4 : $REPO/compare/develop...feature/s4-csv-mysql"
echo "  PR s5 : $REPO/compare/develop...feature/s5-c-python"
