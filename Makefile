target = optical_tempest

all:: $(target).pdf

figures = Figure_1.eps Figure_2.eps Figure_3.eps Figure_5.eps \
	Figure_6.eps Figure_7.eps Figure_8.eps Figure_8.5.eps \
	Figure_8.75.eps Figure_9.eps Figure_10.eps

# PDFLaTeX like to create temporary files:
temporary_figures = Figure_1-eps-converted-to.pdf \
	Figure_2-eps-converted-to.pdf Figure_3-eps-converted-to.pdf \
	Figure_5-eps-converted-to.pdf Figure_6-eps-converted-to.pdf \
	Figure_7-eps-converted-to.pdf Figure_8-eps-converted-to.pdf \
	Figure_8.5-eps-converted-to.pdf Figure_8.75-eps-converted-to.pdf \
	Figure_9-eps-converted-to.pdf Figure_10-eps-converted-to.pdf \

$(target).pdf: $(target).tex $(target).bbl $(figures) Makefile
	pdflatex $(target).tex
	# bibtex $(target)
	@if (grep "Warning" $(target).blg > /dev/null ) then false; fi
	@while grep "Rerun to get cross-references right." $(target).log ; do \
		pdflatex $(target) ; \
	done

clean:
	rm -fv $(target).log $(target).aux $(target).blg \
		$(temporary_figures)

allclean: clean
	rm -fv $(target).pdf

vi:
	vi $(target).tex

bib:
	vi $(target).bib

