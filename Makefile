LATEX=pdflatex

SRC_FR=cv_fr.tex
SRC_EN=cv_en.tex

OUT_FR=cv_fr.pdf
OUT_EN=cv_en.pdf

RENAMED_FR=CV_WILLIAM_JOLIVET_fr.pdf
RENAMED_EN=CV_WILLIAM_JOLIVET_en.pdf

.PHONY: all clean re

all: $(RENAMED_FR) $(RENAMED_EN)

$(RENAMED_FR): $(SRC_FR)
	$(LATEX) -interaction=nonstopmode $(SRC_FR)
	mv $(OUT_FR) $(RENAMED_FR)

$(RENAMED_EN): $(SRC_EN)
	$(LATEX) -interaction=nonstopmode $(SRC_EN)
	mv $(OUT_EN) $(RENAMED_EN)

clean:
	rm -f *.aux *.log *.out *.toc *.nav *.snm $(RENAMED_FR) $(RENAMED_EN) $(OUT_FR) $(OUT_EN)

re: clean all
