# Audit Instrumentasi Metrologis — Group I (FIT310)

> **Case-Based Learning (CBL) & Elaborative Project Pengukuran Fisika**  
> *"Ketepatan dan Ketidakpastian dalam Praktikum Nyata"* — Pasangan Eksperimen **P1 (Density)** dan **M3 (Energy)**

[![PDF Report](https://img.shields.io/badge/Report-Laporan_PDF-red?logo=adobeacrobatreader)](Laporan_Audit_Instrumentasi_Group_I.pdf)
[![Jupyter Notebook](https://img.shields.io/badge/Code-Jupyter_Notebook-orange?logo=jupyter)](Audit_Metrologi_Group_I.ipynb)
[![Excel Workbook](https://img.shields.io/badge/Data-Excel_3_Tab-green?logo=microsoftexcel)](Audit_Instrumentasi_Group_I.xlsx)
[![LaTeX](https://img.shields.io/badge/Typeset-LaTeX_(pdflatex%20%2B%20biber)-blue?logo=latex)](Laporan_Audit_Instrumentasi_Group_I.tex)

Repositori ini berisi laporan audit instrumentasi metrologis, kode komputasi analisis data & simbolik (`SymPy` + `SciPy`), serta *workbook* Excel 3-tab untuk mata kuliah **Sensor dan Pengukuran (FIT310 -- 2 SKS)**, Program Studi Fisika, Fakultas Sains dan Teknologi, Universitas Airlangga.

---

## Tim Penyusun & Pembina

| Peran | Nama | Keterangan |
| :--- | :--- | :--- |
| Anggota 1 | **Muhammad Abiyu Khansa** | NIM `182241036` |
| Anggota 2 | **Farras Atha Pandita** | NIM `182241040` |
| Anggota 3 | **Hendra Maulana** | NIM `182241043` |
| Dosen Pembina | **Winarno, S.Si., M.T.** | Pertemuan 1--7 |
| Dosen Pembina | **Yhosep Gita Yhun Yhuwana, S.Si., M.T.** | Pertemuan 8--14 |

---

## Ringkasan Hasil Audit Metrologis ($n = 8$, $k = 2$)

| Eksperimen / Uji | Besaran / Parameter | Hasil Utama | Temuan Kunci |
| :--- | :--- | :--- | :--- |
| **P1 (*Density*)** | Massa jenis kuningan $\rho$ | $(8{,}493 \pm 0{,}035)\ \text{g/cm}^3$ | Konsisten dengan kuningan; $85{,}4\%$ varians berasal dari ketidakpastian diameter $d$ |
| **Kalibrasi Neraca** | Regresi OLS (8 titik, $10\text{--}300\text{ g}$) | $y = 0{,}999975\,x + 0{,}0421\ \text{g}$ ($R^2 = 0{,}99999997$) | Residual berpola lengkung sistematis (maks. $0{,}032\ \text{g}$); $R^2 \approx 1$ saja tidak membuktikan linearitas |
| **Stabilitas Neraca** | *Zero drift* (30 menit) | $+0{,}03\ \text{g}$ | Setara 3 digit resolusi; memerlukan *tare* berkala sebelum pengukuran |
| **M3 (*Energy*)** | Energi awal $E_1$ & akhir $E_2$ | $E_1 = (0{,}07798 \pm 0{,}00022)\ \text{J}$<br>$E_2 = (0{,}08077 \pm 0{,}00060)\ \text{J}$ | Sumber ketidakpastian terbesar berasal dari $\Delta t_2$ ($79{,}6\%$ varians) |
| **M3 (*Energy*)** | Penyusutan energi $\Delta E = E_1 - E_2$ | $(-2{,}79 \pm 0{,}61) \times 10^{-3}\ \text{J}$ | Tanda negatif mengindikasikan galat sistematis dinamis (*response time delay* gerbang cahaya $\tau \approx 0{,}8\ \text{ms}$), bukan pelanggaran kekekalan energi |

### Visualisasi Kalibrasi & Analisis Residual

![Kurva Kalibrasi Neraca Digital dan Sebaran Residual](Images/Kalibrasi_Residual.png)

---

## Struktur Repositori

```text
Laporan_Audit_Instrumentasi_Group_I/
├── Laporan_Audit_Instrumentasi_Group_I.tex   # Dokumen utama LaTeX (layout 2 kolom)
├── Laporan_Audit_Instrumentasi_Group_I.pdf   # Hasil kompilasi PDF siap baca
├── Cover.tex                                 # Halaman sampul laporan
├── Abstract.tex                              # Judul, penulis, afiliasi, dan abstrak
├── preamble.tex                              # Konfigurasi paket, font, spasi, dan sitasi
├── tabel_data_mentah.tex                     # Tabel modular data mentah P1 & M3 (n = 8)
├── Pustaka.bib                               # Basis data referensi BibTeX (gaya APA)
├── Images/
│   ├── logo-unair.png                        # Logo Universitas Airlangga
│   └── Kalibrasi_Residual.png                # Plot kalibrasi & residual dari notebook
├── Audit_Metrologi_Group_I.ipynb             # Notebook Python (ISO-GUM, SymPy, OLS, export Excel)
├── Audit_Instrumentasi_Group_I.xlsx          # Workbook Excel 3-tab hasil analisis otomatis
├── requirements.txt                          # Dependensi Python untuk menjalankan notebook
├── Makefile                                  # Otomatisasi kompilasi LaTeX (`make pdf` / `make clean`)
└── .gitignore                                # Pengecualian berkas bantu LaTeX & cache Python
```

---

## Cara Membaca & Mereproduksi

### 1. Membaca Laporan & Kode di GitHub
- **Laporan Akhir:** Buka langsung [`Laporan_Audit_Instrumentasi_Group_I.pdf`](Laporan_Audit_Instrumentasi_Group_I.pdf).
- **Analisis & Kode Python:** Buka [`Audit_Metrologi_Group_I.ipynb`](Audit_Metrologi_Group_I.ipynb) — seluruh *output* tabel, turunan simbolik `SymPy`, dan grafik sudah tersimpan sehingga langsung tampil di GitHub.
- **Data Tabular:** Unduh [`Audit_Instrumentasi_Group_I.xlsx`](Audit_Instrumentasi_Group_I.xlsx) (berisi Tab Data Mentah, Perhitungan Statistik & ISO-GUM, dan Kalibrasi).

### 2. Menjalankan Notebook Python Secara Lokal
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
jupyter notebook Audit_Metrologi_Group_I.ipynb
```

### 3. Mengompilasi Laporan LaTeX Secara Lokal
Pastikan distribusi TeX (`pdflatex` dan `biber`) telah terpasang (atau unggah seluruh isi folder ke **Overleaf** dengan *compiler* `pdfLaTeX`):
```bash
make pdf
# atau secara manual:
pdflatex Laporan_Audit_Instrumentasi_Group_I.tex
biber Laporan_Audit_Instrumentasi_Group_I
pdflatex Laporan_Audit_Instrumentasi_Group_I.tex
pdflatex Laporan_Audit_Instrumentasi_Group_I.tex
```
Untuk membersihkan berkas sementara hasil kompilasi:
```bash
make clean
```
