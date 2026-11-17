# Instrumentation Calibration & Metrological Uncertainty Evaluation — Universitas Airlangga

> **Project-Based Physics Instrumentation & Metrology Engineering Study**  
> End-to-end instrument calibration, **ISO-GUM uncertainty propagation** (`SymPy`), **OLS linear regression & residual diagnostics**, and **optoelectronic response-delay error analysis** developed at the Department of Physics, **Universitas Airlangga**.

[![Report ID](https://img.shields.io/badge/Laporan_PDF-Bahasa_Indonesia-red?logo=adobeacrobatreader)](Laporan_Kalibrasi_Instrumentasi_ID.pdf)
[![Report EN](https://img.shields.io/badge/Technical_Report-English_PDF-blue?logo=adobeacrobatreader)](Instrumentation_Calibration_Report_EN.pdf)
[![Jupyter Notebook](https://img.shields.io/badge/Analysis-Jupyter_Notebook-orange?logo=jupyter)](Instrumentation_Calibration_Analysis.ipynb)
[![Excel Output](https://img.shields.io/badge/Deliverable-Excel_3_Tab-green?logo=microsoftexcel)](Instrumentation_Calibration_Data.xlsx)

---

## Technical Reports (Dual-Language)

| Language | Document | Main LaTeX Source |
| :--- | :--- | :--- |
| **Bahasa Indonesia** | [`Laporan_Kalibrasi_Instrumentasi_ID.pdf`](Laporan_Kalibrasi_Instrumentasi_ID.pdf) | [`Laporan_Kalibrasi_Instrumentasi_ID.tex`](Laporan_Kalibrasi_Instrumentasi_ID.tex) |
| **English** | [`Instrumentation_Calibration_Report_EN.pdf`](Instrumentation_Calibration_Report_EN.pdf) | [`Instrumentation_Calibration_Report_EN.tex`](Instrumentation_Calibration_Report_EN.tex) |

---

## Project Overview

In precision laboratory instrumentation, high $R^2$ values or low random scatter often conceal **systematic measurement flaws** such as load-cell non-linearity, zero-point thermal drift, and dynamic sensor latency.

This project builds a reproducible calibration and metrological evaluation workflow across two paired experimental setups ($n = 8$ repeated measurements per measurand):
1. **Digital Balance Calibration & Linearity Verification:** 8-point Ordinary Least Squares (OLS) calibration across $10\text{--}300\text{ g}$ using Class F2 standard masses, combined with residual pattern analysis and a 30-minute no-load stability test.
2. **Static Density Metrology (Experiment P1):** Indirect density determination of a brass cylinder from mass, diameter, and height measurements, including full Type A/B uncertainty evaluation and variance budgeting under ISO-GUM.
3. **Dynamic Energy & Photogate Latency Diagnosis (Experiment M3):** Mechanical energy conservation analysis on an inclined air track with dual photogates, identifying an apparent energy gain ($\Delta E < 0$) as an uncompensated systematic optoelectronic comparator delay ($\tau \approx 0.8\text{ ms}$).

---

## Key Technical Highlights & Findings

| Domain | Method / Diagnostic | Quantitative Result | Engineering Insight |
| :--- | :--- | :--- | :--- |
| **Static Metrology (P1)** | ISO-GUM propagation ($k=2$) | $\rho = (8.493 \pm 0.035)\ \text{g/cm}^3$ ($0.41\%$ rel.) | Variance budget shows **$85.4\%$** of uncertainty stems from diameter $d$; upgrading vernier caliper ($0.05\text{ mm}$) to micrometer ($0.01\text{ mm}$) is far more impactful than adding repetitions. |
| **Calibration & Linearity** | 8-point OLS + residual curve | $y = 0.999975\,x + 0.0421\ \text{g}$, $R^2 = 0.99999997$ | Despite $R^2 \approx 1$, residuals form a systematic inverted parabolic arc (max $0.032\ \text{g}$), proving $R^2$ alone cannot confirm linearity. |
| **Instrument Stability** | 30-minute no-load drift test | $+0.03\ \text{g}$ zero drift | Equivalent to $3\times$ balance resolution ($0.01\ \text{g}$), requiring periodic *tare* resets before measurement runs. |
| **Dynamic Metrology (M3)** | Correlated ISO-GUM propagation | $E_1 = (0.07798 \pm 0.00022)\ \text{J}$<br>$E_2 = (0.08077 \pm 0.00060)\ \text{J}$<br>$\Delta E = (-2.79 \pm 0.61) \times 10^{-3}\ \text{J}$ | $79.6\%$ of $\Delta E$ variance originates from Gate 2 transit time $\Delta t_2$. |
| **Root-Cause Diagnosis** | Photogate delay sensitivity | Sign reversal ($\Delta E = 0$) at $\tau \approx 0.59\text{ ms}$;<br>$\Delta E_{\text{corr}} \approx +0.97 \times 10^{-3}\ \text{J}$ at $\tau = 0.8\text{ ms}$ | Apparent energy gain is caused by uncalibrated systematic photogate comparator latency ($\tau / \Delta t_2 > \tau / \Delta t_1$), undetectable by $3\sigma$ outlier screening. |

### Calibration Curve & Residual Diagnostics

![Digital Balance OLS Calibration and Residual Pattern](Images/Kalibrasi_Residual.png)

---

## Tech Stack & Pipeline Architecture

- **Computational Analysis ([`Instrumentation_Calibration_Analysis.ipynb`](Instrumentation_Calibration_Analysis.ipynb)):**
  - `SymPy`: Symbolic partial derivatives for correlated & uncorrelated ISO-GUM uncertainty propagation.
  - `NumPy` & `SciPy`: $3\sigma$ outlier screening, Type A/B uncertainty evaluation, OLS regression, and parameter error bounds.
  - `Matplotlib`: Dual-panel calibration and residual diagnostic plots.
  - `OpenPyXL`: Automated generation of a formatted 3-tab Excel workbook ([`Instrumentation_Calibration_Data.xlsx`](Instrumentation_Calibration_Data.xlsx)) using live Excel formulas without hardcoding.
- **Bilingual Technical Reports (`pdflatex` + `biber`):**
  - Modular 2-column scientific paper layout with APA citations (`Pustaka.bib`), vector `TikZ`/`PGFPlots` schematics & plots, compiled into both Indonesian and English PDFs.

---

## Repository Structure

```text
.
├── Laporan_Kalibrasi_Instrumentasi_ID.pdf   # Compiled report (Bahasa Indonesia, 17 pages)
├── Laporan_Kalibrasi_Instrumentasi_ID.tex   # Main LaTeX source (Bahasa Indonesia)
├── Cover_ID.tex / Abstract_ID.tex           # Indonesian cover & abstract modules
├── tabel_data_mentah_ID.tex                 # Indonesian raw dataset tables
├── Instrumentation_Calibration_Report_EN.pdf # Compiled report (English, 17 pages)
├── Instrumentation_Calibration_Report_EN.tex # Main LaTeX source (English)
├── Cover_EN.tex / Abstract_EN.tex           # English cover & abstract modules
├── tabel_data_mentah_EN.tex                 # English raw dataset tables
├── preamble.tex                             # Shared LaTeX layout, siunitx, TikZ/PGFPlots, BibLaTeX
├── Pustaka.bib                              # BibTeX reference database (APA style)
├── Instrumentation_Calibration_Analysis.ipynb # Python analysis, SymPy & Excel export notebook
├── Instrumentation_Calibration_Data.xlsx    # Auto-generated 3-tab Excel metrology workbook
├── Images/
│   ├── Kalibrasi_Residual.png               # Calibration & residual scatter plot
│   └── logo-unair.png                       # Universitas Airlangga emblem
├── requirements.txt                         # Python package dependencies
├── Makefile                                 # Build automation (`make all` / `make id` / `make en` / `make clean`)
└── .gitignore                               # Excludes LaTeX aux files & Python caches
```

---

## Quick Start & Reproducibility

### Run the Python Analysis Locally
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
jupyter notebook Instrumentation_Calibration_Analysis.ipynb
```

### Build Both LaTeX Reports Locally
Requires a TeX distribution with `pdflatex` and `biber` (also compatible with Overleaf using `pdfLaTeX`):
```bash
make all      # Compiles both Indonesian & English PDFs
make clean    # Removes auxiliary build files
```

---

## Contributors & Affiliation

Developed at the **Department of Physics, Faculty of Science and Technology, Universitas Airlangga, Surabaya (2026)** (Group I — FIT310 Sensors and Measurement):
- **Muhammad Abiyu Khansa** (`182241036`)
- **Farras Atha Pandita** (`182241040`)
- **Hendra Maulana** (`182241043`)
- Supervised by **Yhosep Gita Yhun Yhuwana, S.Si., M.T.**
