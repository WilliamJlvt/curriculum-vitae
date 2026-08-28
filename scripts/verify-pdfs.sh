#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
output_dir="${CV_OUTPUT_DIR:-$repo_root/output/pdf}"

for dependency in pdfinfo pdftotext; do
  if ! command -v "$dependency" >/dev/null 2>&1; then
    echo "$dependency is required to verify generated PDFs." >&2
    exit 1
  fi
done

verify_pdf() {
  local language="$1"
  local pdf_file="$output_dir/CV_William_Jolivet_${language}.pdf"

  if [[ ! -s "$pdf_file" ]]; then
    echo "Missing or empty PDF: $pdf_file" >&2
    exit 1
  fi

  local metadata
  metadata="$(pdfinfo "$pdf_file")"

  if ! grep -Eq '^Pages:[[:space:]]+1$' <<<"$metadata"; then
    echo "$pdf_file must contain exactly one page." >&2
    exit 1
  fi

  if ! grep -Eq '^Page size:.*A4' <<<"$metadata"; then
    echo "$pdf_file must use the A4 page size." >&2
    exit 1
  fi

  if ! pdftotext "$pdf_file" - | grep -q 'William Jolivet'; then
    echo "$pdf_file does not contain the expected identity text." >&2
    exit 1
  fi

  printf 'Verified %s: one-page A4 PDF\n' "$pdf_file"
}

verify_pdf fr
verify_pdf en
