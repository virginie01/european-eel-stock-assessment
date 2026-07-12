# Code Walkthrough

## Purpose

This document explains the structure of the original R scripts used to investigate relationships between regional European glass eel recruitment and large-scale environmental variability.

The scripts preserved in this repository constitute the original implementation developed during the Master's thesis (2015–2016). They have been archived with minimal modifications to preserve the historical workflow and ensure reproducibility.

Although individual scripts analyze different environmental variables, they follow a common analytical structure.

---

# Overall Organization

The original scripts can be divided into two groups:

- **Long-term analyses**
- **Short-term analyses**

Both groups begin by importing recruitment estimates from GEREM and the corresponding environmental dataset before following different analytical workflows.

```text
Import recruitment estimates
          │
          ▼
Import environmental variable
          │
          ▼
Prepare datasets
          │
      ┌───┴────┐
      ▼        ▼
 Long-term  Short-term
```

---

# Long-Term Analysis Scripts

Representative scripts include:

- `gerem_GSI_long.R`
- `gerem_SST_long.R`

These scripts investigate whether gradual environmental changes correspond to long-term recruitment trends.

## Step 1 — Import Data

The scripts import:

- GEREM regional recruitment estimates;
- one environmental dataset (e.g. GSI or SST).

The datasets are aligned over their common temporal period.

---

## Step 2 — Prepare Recruitment Estimates

Regional recruitment estimates are:

- log-transformed;
- rescaled to facilitate comparison with environmental variables.

The European estimate (`Rglobal`) is generally removed so that analyses focus on the six regional recruitment series.

---

## Step 3 — Prepare Environmental Variables

The environmental variable is imported and rescaled using the same approach as the recruitment estimates.

Some environmental datasets already contain lagged values and moving averages prepared prior to analysis.

---

## Step 4 — Smooth Time Series

Five-year moving averages are calculated to emphasize long-term temporal variability.

The moving averages reduce interannual fluctuations while preserving gradual changes occurring over multiple years.

---

## Step 5 — Correlation Analysis

Pearson correlation coefficients are calculated between the smoothed recruitment and environmental series.

Separate correlations are performed for each recruitment region.

---

## Step 6 — Correct Statistical Significance

Because moving-average smoothing introduces temporal autocorrelation, the scripts estimate effective degrees of freedom before evaluating statistical significance.

This adjustment reduces the likelihood of identifying spurious correlations caused by serial dependence.

---

# Short-Term Analysis Scripts

Representative scripts include:

- `gerem_NAO_short.R`
- `gerem_PP_short.R`
- `gerem_GSI_short.R`

These scripts investigate whether annual environmental anomalies precede annual recruitment variability.

---

## Step 1 — Import Data

GEREM recruitment estimates and the selected environmental variable are imported.

The overlapping period between both datasets is extracted.

---

## Step 2 — Prepare Time Series

Recruitment estimates are:

- log-transformed;
- rescaled.

Environmental variables are similarly rescaled.

---

## Step 3 — Assess Temporal Structure

The scripts evaluate the statistical properties of each time series.

Depending on the variable, this may include:

- graphical inspection;
- trend assessment;
- stationarity tests;
- autocorrelation diagnostics.

---

## Step 4 — Fit ARIMA Models

Each time series is modelled using an appropriate ARIMA model.

The objective is not forecasting but the removal of temporal dependence.

Model selection differs among variables according to their temporal characteristics.

---

## Step 5 — Pre-whitening

Residuals are extracted from the fitted ARIMA models.

These residual series contain the interannual variability that cannot be explained by each series' own temporal structure.

---

## Step 6 — Cross-Correlation Analysis

Cross-correlation functions (CCF) are calculated between recruitment residuals and environmental residuals.

Multiple temporal lags are examined to identify biologically plausible delayed relationships.

---

# Common Features of the Scripts

Despite analysing different environmental variables, most scripts share several characteristics.

## Historical Coding Style

The scripts reflect the programming practices used during the Master's project.

Characteristics include:

- repeated code between scripts;
- manual preprocessing steps;
- variable names inherited from previous analyses;
- limited internal commenting.

The scripts have intentionally been preserved in this historical form.

---

## Analysis-Ready Data

Several datasets already contain:

- lagged environmental variables;
- moving averages;
- derived indices.

Consequently, not every preprocessing step is performed within the R scripts themselves.

---

## Statistical Focus

The primary objective of the scripts is statistical analysis rather than software development.

The repository therefore emphasizes:

- analytical workflow;
- methodological decisions;
- ecological interpretation;

rather than coding style or software engineering practices.

---

# Relationship to the Repository

The original R scripts should be interpreted alongside the accompanying documentation.

The scientific rationale is described in:

- `methodology.md`

The analytical workflow is described in:

- `workflow.md`

The statistical methods are explained in:

- `time_series_methods.md`

The assumptions underlying the analyses are summarized in:

- `assumptions.md`

Together, these documents provide the context necessary to understand and reproduce the historical implementation preserved in this repository.