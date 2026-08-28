# William Jolivet · Resume as Code

[![CI](https://github.com/WilliamJlvt/curriculum-vitae/actions/workflows/ci.yml/badge.svg)](https://github.com/WilliamJlvt/curriculum-vitae/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-0066cc.svg)](LICENSE)

A bilingual, print-first resume built with semantic HTML and CSS. The repository is the source of truth for the French and English web versions and their reproducible one-page A4 PDF exports.

## Versions

- [French web source](web-cv/index.html)
- [English web source](web-cv/index.en.html)
- [Latest PDF release](https://github.com/WilliamJlvt/curriculum-vitae/releases/latest)

## Design principles

- One page, vertical A4, with no browser header or footer.
- Shared design system across French and English versions.
- Semantic, accessible HTML that remains responsive on screen.
- Content driven by concrete delivery, engineering depth and measurable impact.
- Generated PDFs are build artifacts, never hand-edited sources.

## Repository structure

```text
web-cv/
  assets/photo.jpg       Shared portrait
  index.html             French resume
  index.en.html          English resume
  styles.css             Screen and print design system
  app.js                 Print behavior
scripts/
  export-cv.sh           Portable Chrome/Chromium export
  verify-pdfs.sh         One-page A4 validation
  check.sh               Repository quality gate
.github/workflows/       CI and automated releases
output/pdf/              Generated locally; ignored by Git
```

## Local development

Requirements:

- Google Chrome or Chromium
- Poppler (`pdfinfo` and `pdftotext`)
- ShellCheck for shell linting

```bash
make serve    # http://localhost:8000
make build    # generate both PDFs in output/pdf/
make verify   # validate page count, format and text layer
make check    # lint, build and verify everything
make clean    # remove generated artifacts
```

Set `CHROME_BIN` when the browser is installed in a non-standard location.

## CI and releases

Every push and pull request builds and validates both PDFs. Successful runs publish the generated files as a workflow artifact.

Version tags trigger a GitHub release containing the French and English PDFs:

```bash
make release VERSION=v2.0.0
```

## Contributing

Feedback and focused improvements are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) and the [Code of Conduct](CODE_OF_CONDUCT.md) before opening a pull request. Please report security or privacy concerns according to [SECURITY.md](SECURITY.md).

## License

The source code and documentation are available under the [MIT License](LICENSE). Personal information and the portrait remain associated with William Jolivet and must not be used to impersonate him.
