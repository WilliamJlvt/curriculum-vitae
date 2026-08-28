#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
output_dir="${CV_OUTPUT_DIR:-$repo_root/output/pdf}"
requested_language="${1:-all}"

find_chrome() {
  if [[ -n "${CHROME_BIN:-}" && -x "${CHROME_BIN}" ]]; then
    printf '%s\n' "$CHROME_BIN"
    return 0
  fi

  local command_name
  for command_name in google-chrome-stable google-chrome chromium chromium-browser; do
    if command -v "$command_name" >/dev/null 2>&1; then
      command -v "$command_name"
      return 0
    fi
  done

  local mac_candidate
  for mac_candidate in \
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    "/Applications/Chromium.app/Contents/MacOS/Chromium"; do
    if [[ -x "$mac_candidate" ]]; then
      printf '%s\n' "$mac_candidate"
      return 0
    fi
  done

  return 1
}

chrome_bin="$(find_chrome || true)"
if [[ -z "$chrome_bin" ]]; then
  echo "Chrome or Chromium is required. Set CHROME_BIN to its executable path." >&2
  exit 1
fi

mkdir -p "$output_dir"

export_pdf() {
  local language="$1"
  local source_file="$2"
  local output_file="$output_dir/CV_William_Jolivet_${language}.pdf"

  "$chrome_bin" \
    --headless=new \
    --disable-dev-shm-usage \
    --disable-gpu \
    --no-pdf-header-footer \
    --print-to-pdf="$output_file" \
    "file://$source_file"

  printf 'Generated %s\n' "$output_file"
}

case "$requested_language" in
  all)
    export_pdf fr "$repo_root/web-cv/index.html"
    export_pdf en "$repo_root/web-cv/index.en.html"
    ;;
  fr)
    export_pdf fr "$repo_root/web-cv/index.html"
    ;;
  en)
    export_pdf en "$repo_root/web-cv/index.en.html"
    ;;
  *)
    echo "Usage: $0 [all|fr|en]" >&2
    exit 2
    ;;
esac
