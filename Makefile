ID_MAIN = Laporan_Kalibrasi_Instrumentasi_ID
EN_MAIN = Instrumentation_Calibration_Report_EN
ID_PRES = Presentasi_Kalibrasi_Instrumentasi_ID
EN_PRES = Instrumentation_Calibration_Presentation_EN

.PHONY: all id en pres clean

all: id en pres

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

pres:
	pdflatex -interaction=nonstopmode $(ID_PRES).tex
	pdflatex -interaction=nonstopmode $(ID_PRES).tex
	pdflatex -interaction=nonstopmode $(EN_PRES).tex
	pdflatex -interaction=nonstopmode $(EN_PRES).tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.toc *.lof *.lot *.synctex.gz *.nav *.snm *.vrb
