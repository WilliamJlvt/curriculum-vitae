# Contributing

Thank you for helping improve this resume project. Contributions should stay focused on correctness, accessibility, print quality or the build workflow.

## Before opening a pull request

1. Create a focused branch from `main`.
2. Edit the HTML source, shared CSS or scripts. Do not edit generated PDFs.
3. Keep the French and English versions structurally aligned.
4. Run `make check` and visually inspect both PDFs.
5. Use a concise, conventional commit message such as `fix(print): prevent project clipping`.

## Content rules

- Do not add unverifiable claims or invented metrics.
- Do not expose confidential client information, credentials or private documents.
- Preserve a single vertical A4 page in both languages.
- Prefer clear engineering outcomes over decorative statistics.
- Keep screen interactions keyboard accessible and print-only behavior deterministic.

## Pull requests

Explain the problem, the chosen solution and how the result was verified. Screenshots are useful for layout changes, but generated PDFs should remain CI artifacts rather than committed files.
