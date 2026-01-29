#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 vX.Y.Z" >&2
  exit 1
fi

TAG="$1"
if [[ "$TAG" != v* ]]; then
  TAG="v${TAG}"
fi

git tag "$TAG"
git push origin "$TAG"

echo "Tag pushed: $TAG"
