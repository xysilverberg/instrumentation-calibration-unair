ID_MAIN = Laporan_Kalibrasi_Instrumentasi_ID
EN_MAIN = Instrumentation_Calibration_Report_EN

.PHONY: all id en clean

all: id en

id:
	pdflatex -interaction=nonstopmode $(ID_MAIN).tex
	biber $(ID_MAIN)
	pdflatex -interaction=nonstopmode $(ID_MAIN).tex
	pdflatex -interaction=nonstopmode $(ID_MAIN).tex

en:
	pdflatex -interaction=nonstopmode $(EN_MAIN).tex
	biber $(EN_MAIN)
	pdflatex -interaction=nonstopmode $(EN_MAIN).tex
	pdflatex -interaction=nonstopmode $(EN_MAIN).tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.toc *.lof *.lot *.synctex.gz
