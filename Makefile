.PHONY: build verify check serve clean release

build:
	./scripts/export-cv.sh

verify:
	./scripts/verify-pdfs.sh

check:
	./scripts/check.sh

serve:
	python3 -m http.server 8000 --directory web-cv

clean:
	rm -rf output tmp/pdfs

release:
	@test -n "$(VERSION)" || (echo "Usage: make release VERSION=vX.Y.Z" >&2; exit 1)
	./scripts/release-tag.sh "$(VERSION)"
