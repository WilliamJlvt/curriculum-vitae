#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

required_files=(
  "web-cv/index.html"
  "web-cv/index.en.html"
  "web-cv/styles.css"
  "web-cv/app.js"
  "web-cv/assets/photo.jpg"
  "LICENSE"
  "README.md"
)

for required_file in "${required_files[@]}"; do
  if [[ ! -s "$required_file" ]]; then
    echo "Required file is missing or empty: $required_file" >&2
    exit 1
  fi
done

if ! grep -q '<html lang="fr">' web-cv/index.html; then
  echo "The French source must declare lang=fr." >&2
  exit 1
fi

if ! grep -q '<html lang="en">' web-cv/index.en.html; then
  echo "The English source must declare lang=en." >&2
  exit 1
fi

if grep -R -n -E 'Taker Academy|HAND-E / ALSTOM|CV_WILLIAM_JOLIVET' web-cv README.md; then
  echo "Obsolete CV content or naming detected." >&2
  exit 1
fi

git diff --check

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck scripts/*.sh
else
  echo "shellcheck not found; shell lint skipped." >&2
fi

./scripts/export-cv.sh
./scripts/verify-pdfs.sh
