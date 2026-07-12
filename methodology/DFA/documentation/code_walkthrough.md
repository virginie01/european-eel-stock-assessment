# DFA Script Walkthrough

## Purpose

This document describes the structure and execution of `DFA_script.R`, the historical R script used to perform the Dynamic Factor Analysis (DFA) presented in the Master's thesis.

The script imports recruitment time series, prepares the data for analysis, fits a series of Dynamic Factor Analysis models using the **MARSS** package, compares candidate models, and saves the complete analysis workspace.

The original R script has been preserved without modification. This document provides a detailed explanation of each section of the code.

---

# Script Overview

The script performs the following major tasks:

1. Initializes the R environment.
2. Imports recruitment time series.
3. Applies data transformations and quality control.
4. Prepares the data matrix for Dynamic Factor Analysis.
5. Specifies and fits candidate DFA models.
6. Compares competing models using AICc.
7. Saves the complete R workspace.

---

# 1. Workspace Initialization

The script begins by setting the working directory and clearing the current R workspace.

```r
setwd("/data1/bornarel/DFA2806")
rm(list=ls())
```

The working directory reflects the original computing environment used during the Master's project and is preserved for historical purposes.

---

# 2. Load Required Package

The analysis uses the **MARSS** package.

```r
library(MARSS)
```

MARSS provides tools for fitting Multivariate Autoregressive State-Space (MARSS) models, including Dynamic Factor Analysis.

---

# 3. Import Recruitment Data

The recruitment dataset is imported from:

```r
recruitment_series_DFA.csv
```

using:

```r
data <- read.table(
    file = "recruitment_series_DFA.csv",
    header = TRUE,
    sep = ";",
    row.names = 1,
    check.names = FALSE
)
```

The first column is used as the row identifier (years).

Each remaining column represents one recruitment monitoring series.

---

# 4. Log Transformation

Recruitment observations are transformed using

```r
data = log(data + 1)
```

The logarithmic transformation:

- reduces skewness,
- stabilizes variance,
- reduces the influence of exceptionally large recruitment events,
- allows zero observations to be retained.

---

# 5. Selection of Recruitment Series

The archived implementation explicitly selects the recruitment series used in the analysis.

```r
data = data[, c(...)]
```

Only monitoring programs considered sufficiently reliable were retained.

The resulting dataset contains 33 recruitment time series distributed across Europe.

---

# 6. Exploratory Data Visualization

The script produces exploratory plots of all recruitment series.

```r
par(mfrow=c(7,5))
```

Each series is plotted individually to allow visual inspection of:

- temporal coverage,
- missing observations,
- long-term trends,
- unusual values.

These plots serve as an initial quality-control step before model fitting.

---

# 7. Data Cleaning

The script replaces the first ten observations of the **Minho total** series with missing values.

```r
data[1:10,"Minho total"] = NA
```

This modification reflects the dataset used in the Master's thesis.

The original dataset remains unchanged.

---

# 8. Matrix Transposition

The recruitment matrix is transposed:

```r
data <- t(data)
```

After transposition:

- rows represent recruitment series,
- columns represent years.

This orientation is required by the MARSS implementation of Dynamic Factor Analysis.

---

# 9. Mean-Centering

The mean of each recruitment series is calculated:

```r
y.bar <- apply(data,1,mean,na.rm=TRUE)
```

Each series is then centered:

```r
recruit <- data - y.bar
```

Mean-centering removes differences in average recruitment among monitoring locations and focuses the analysis on temporal variability.

---

# 10. Exploratory Visualization of Centered Series

The centered recruitment series are plotted again.

These figures allow visual assessment of:

- common temporal behaviour,
- variability among series,
- relative synchrony among monitoring locations.

A final figure overlays all recruitment series to provide a qualitative overview of recruitment dynamics across Europe.

---

# 11. Definition of Candidate Models

The script specifies the optimization settings used by MARSS.

```r
cntl.list <- list(
    minit = 200,
    maxit = 300000,
    allow.degen = FALSE
)
```

Observation error is specified as:

```r
R = "diagonal and unequal"
```

This assumes independent observation errors with different variances for each recruitment series.

---

# 12. Candidate Model Fitting

Candidate Dynamic Factor Analysis models are fitted with between one and four latent trends.

```r
for(m in 1:4)
```

For each value of **m**, the script constructs a MARSS model:

```r
dfa.model = list(
    A = "unequal",
    R = R,
    m = m
)
```

The model is then fitted using:

```r
MARSS(...)
```

The resulting fitted model is stored for later comparison.

---

# 13. Model Comparison

For each candidate model, the script records:

- log-likelihood,
- number of estimated parameters,
- corrected Akaike Information Criterion (AICc).

These statistics are stored in:

```r
model.data
```

The preferred model is identified by comparing AICc values across candidate models.

---

# 14. Saving the Workspace

At the end of the analysis, the complete R workspace is saved.

```r
save.image("dfa2607.RData")
```

This workspace preserves:

- fitted MARSS model objects,
- processed recruitment data,
- model comparison table,
- intermediate analysis objects.

---

# Key Objects Created by the Script

| Object | Description |
|---------|-------------|
| `data` | Recruitment data after import and preprocessing |
| `recruit` | Mean-centered recruitment matrix used for DFA |
| `y.bar` | Mean recruitment for each time series |
| `N.ts` | Number of recruitment time series |
| `TT` | Number of years |
| `cntl.list` | MARSS optimization settings |
| `dfa.model` | Candidate DFA model specification |
| `kemz` | Fitted MARSS model |
| `model.data` | Summary table containing model comparison statistics |
| `kemz.1...` to `kemz.4...` | Stored fitted models with different numbers of latent trends |

---

# Notes on Historical Implementation

This script represents the original implementation used during the Master's research project.

Several features reflect its historical development:

- hard-coded working directory,
- manual selection of recruitment series,
- exploratory plotting for quality control,
- manual treatment of one recruitment series (Minho total),
- storage of multiple candidate models within the R workspace.

The code has been preserved without modification in order to maintain the integrity of the archived research implementation.

For additional information, see:

- `documentation/methodology.md`
- `documentation/workflow.md`
- `documentation/assumptions.md`
- `documentation/data_sources.md`