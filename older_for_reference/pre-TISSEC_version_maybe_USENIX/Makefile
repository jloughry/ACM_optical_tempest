target = optical_tempest

all:: $(target).pdf

figures_directory = figures
figures = \
	$(figures_directory)/Figure_1.eps \
	$(figures_directory)/Figure_2.eps \
	$(figures_directory)/Figure_3.eps \
	$(figures_directory)/Figure_4.eps \
	$(figures_directory)/Figure_5.eps \
	$(figures_directory)/Figure_6.eps

$(target).pdf: $(target).tex $(target).bib $(figures)
	pdflatex $(target).tex
	bibtex $(target)
	@if (grep "Warning" $(target).blg > /dev/null ) then false; fi
	@while grep "Rerun to get cross-references right." $(target).log ; do \
		pdflatex $(target) ; \
	done

clean:
	rm -fv $(target).log $(target).bbl $(target).aux $(target).blg

allclean: clean
	rm -fv $(target).pdf

vi:
	vi $(target).tex

bib:
	vi $(target).bib

