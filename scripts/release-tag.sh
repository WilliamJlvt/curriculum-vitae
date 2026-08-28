#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 vX.Y.Z" >&2
  exit 2
fi

tag="$1"
if [[ ! "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Release tags must use semantic versioning: vX.Y.Z" >&2
  exit 2
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "The working tree must be clean before creating a release tag." >&2
  exit 1
fi

if git rev-parse "$tag" >/dev/null 2>&1; then
  echo "Tag already exists: $tag" >&2
  exit 1
fi

git tag --annotate "$tag" --message "Release $tag"
git push origin "$tag"

printf 'Pushed %s. GitHub Actions will publish both PDFs.\n' "$tag"
