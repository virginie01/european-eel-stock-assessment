# Dynamic Factor Analysis Workflow

## Purpose

This document describes the sequence of steps used to perform the Dynamic Factor Analysis (DFA) presented in this repository.

The workflow transforms raw recruitment observations into latent temporal trends that summarize common patterns among European glass eel recruitment time series.

---

# Overview

```text
Raw recruitment data
        ↓
Import into R
        ↓
Selection of reliable recruitment series
        ↓
Log transformation
        ↓
Treatment of missing values
        ↓
Mean-centering
        ↓
Transpose data matrix
        ↓
Fit candidate DFA models
        ↓
Compare models using AICc
        ↓
Interpret latent trends
        ↓
Support definition of recruitment regions
```

---

# Step 1: Import Recruitment Data

The recruitment dataset is loaded from:

```text
recruitment_series_DFA.csv
```

Each column represents a recruitment time series from a monitoring location.

Each row represents one year of observations.

---

# Step 2: Data Transformation

Recruitment observations are transformed using:

```r
log(data + 1)
```

This reduces skewness, stabilizes variance, and allows zero observations to be retained.

---

# Step 3: Selection of Recruitment Series

Only recruitment series considered sufficiently reliable and long enough are retained for analysis.

The archived implementation explicitly selects these series prior to model fitting.

---

# Step 4: Exploratory Data Inspection

Time series are plotted to allow visual inspection of:

- temporal coverage
- missing observations
- unusual patterns
- overall variability

These plots serve as an initial quality-control step.

---

# Step 5: Data Cleaning

The archived implementation applies one manual modification:

- the first ten observations of the **Minho total** series are replaced with `NA`.

This reflects the dataset used in the Master's thesis.

---

# Step 6: Data Preprocessing

The recruitment matrix is:

1. transposed,
2. mean-centered,
3. prepared for MARSS.

Mean-centering removes differences in average recruitment among monitoring locations so that the DFA focuses on shared temporal variability.

---

# Step 7: Candidate Model Construction

Candidate Dynamic Factor Analysis models containing between one and four latent trends are fitted.

Each model assumes:

- unequal mean recruitment among series,
- diagonal and unequal observation covariance.

---

# Step 8: Model Fitting

Models are fitted using the `MARSS` package.

Maximum likelihood estimation is used to estimate:

- latent temporal trends,
- factor loadings,
- observation error variances.

---

# Step 9: Model Selection

Candidate models are compared using the corrected Akaike Information Criterion (AICc).

The model with the lowest AICc provides the preferred balance between goodness-of-fit and model complexity.

---

# Step 10: Interpretation

The selected model produces:

- common temporal recruitment trends,
- factor loadings describing the relationship between recruitment series and latent trends.

These outputs are interpreted to identify groups of recruitment series exhibiting similar temporal behaviour.

---

# Step 11: Output Generation

The complete R workspace is saved as:

```text
dfa2607.RData
```

The saved workspace preserves:

- fitted MARSS models,
- model comparison results,
- processed recruitment data,
- intermediate analysis objects.

---

# Relationship to the Thesis

The DFA constituted the exploratory multivariate component of the Master's thesis.

Its results provided empirical support for grouping recruitment series into coherent recruitment regions, which were subsequently used in the Glass Eel Recruitment Estimation Model (GEREM).

Together with the environmental correlation analyses, the DFA contributed to the interpretation of large-scale recruitment dynamics across Europe.