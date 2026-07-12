# Data Dictionary

## Purpose

This document describes the dataset used in the Dynamic Factor Analysis (DFA) component of the Master's thesis.

The file `recruitment_series_DFA.csv` contains annual glass eel recruitment time series from monitoring programs distributed across Europe.

The dataset is imported and preprocessed by `DFA_script.R` prior to model fitting.

---

# Dataset

## recruitment_series_DFA.csv

### Description

Annual recruitment observations collected from multiple European monitoring programs.

Each column represents an individual recruitment time series from a specific monitoring location.

Each row represents one year of observations.

The dataset contains the raw recruitment values prior to any transformations applied in the analysis.

---

# Data Structure

| Component | Description |
|-----------|-------------|
| Rows | Years |
| Columns | Recruitment monitoring series |
| Cell values | Annual recruitment observations |
| Missing values | Represented as empty cells |

---

# Variables

## Year

The first column contains the observation year.

During data import, the year is used as the row identifier:

```r
row.names = 1
```

---

## Recruitment Series

The remaining columns correspond to individual recruitment monitoring programs.

The archived implementation retains the following recruitment series:

- Bann
- Nalon
- Rhine
- Ijzer
- Viskan
- Erne
- Ebrodeltalagoons
- Vilaine
- Severn
- Albuferalagoon
- Imsa
- Gironde
- GirondeCP
- Loire
- Shannon
- Minho36
- Minho 35
- Minho total
- Lauwersoog
- Rhingals
- Katwijk
- AdourCP
- Ems
- Tiber
- Stellendam
- GirondeSc
- Adour
- IYFS/IBTS 1
- IYFS/IBTS 2
- Bresle
- Fremur
- Vidaa
- Somme
- Feale
- Inagh
- Maigne
- SevresNiortaise

Each column represents an annual recruitment index from a single monitoring location.

Monitoring methods include commercial catches, scientific surveys, trapping systems, and other recruitment indices.

Additional information on observation types is provided in `documentation/data_sources.md`.

---

# Data Preprocessing

The raw dataset is modified within `DFA_script.R` before model fitting.

The following preprocessing steps are applied:

1. Log transformation:

```r
log(data + 1)
```

to reduce skewness and stabilize variance.

2. Selection of recruitment series considered suitable for analysis.

3. Removal of the first ten observations from the **Minho total** series by replacing them with missing values (`NA`).

4. Transposition of the dataset so that:

- rows represent recruitment series,
- columns represent years.

5. Mean-centering (demeaning) of each recruitment series prior to Dynamic Factor Analysis.

The original CSV file remains unchanged and contains the raw recruitment observations.

---

# Missing Values

Missing observations are retained as `NA` values.

The MARSS package accommodates missing observations during model fitting, allowing recruitment series with incomplete temporal coverage to be included in the analysis.

---

# Data Quality

The archived implementation includes only recruitment series considered sufficiently reliable for Dynamic Factor Analysis.

Series selection was performed prior to model fitting and reflects the dataset used in the Master's thesis.

---

# Relationship to Other Components of the Thesis

The recruitment time series documented here were used to identify common temporal recruitment patterns across Europe using Dynamic Factor Analysis.

The resulting latent trends and recruitment groupings subsequently informed the regional structure used in the Glass Eel Recruitment Estimation Model (GEREM).

---

# Notes

This document describes the raw input dataset archived in this repository.

All preprocessing, transformations, and model preparation are performed within `original_code/DFA_script.R`.