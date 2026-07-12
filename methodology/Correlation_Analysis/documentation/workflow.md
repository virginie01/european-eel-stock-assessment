# Workflow

## Purpose

This document describes the analytical workflow used to investigate relationships between regional glass eel recruitment and large-scale environmental variability.

The workflow builds upon the regional recruitment estimates produced by the Glass Eel Recruitment Estimation Model (GEREM) and consists of two complementary analytical pathways:

- **Long-term correlation analysis**, which investigates relationships between gradual environmental changes and long-term recruitment trends.
- **Short-term correlation analysis**, which investigates relationships between year-to-year environmental fluctuations and recruitment variability.

Together, these analyses provide complementary perspectives on the environmental processes potentially influencing European eel recruitment.

---

# Overall Workflow

```text
Regional recruitment estimates (GEREM)
                 │
                 ▼
      Environmental time series
                 │
        Data preparation
                 │
      ┌──────────┴──────────┐
      ▼                     ▼
 Long-term analysis    Short-term analysis
      │                     │
      ▼                     ▼
 Ecological interpretation
```

---

# Step 1 – Import Regional Recruitment Estimates

Annual regional recruitment estimates are imported from the GEREM outputs.

These estimates represent the best available reconstruction of annual recruitment after integrating multiple monitoring programs and observation types.

Rather than relying on individual monitoring stations, all subsequent analyses use these regional estimates as the response variables.

---

# Step 2 – Import Environmental Variables

Environmental time series are imported for each candidate driver.

The analyses include:

- Gulf Stream Index (GSI)
- North Atlantic Oscillation (NAO)
- Sea Surface Temperature (SST)
- Primary Production (PP)

Each variable represents a distinct ecological hypothesis regarding processes that may influence eel recruitment.

---

# Step 3 – Data Preparation

Prior to analysis, recruitment and environmental variables are prepared for comparison.

Typical preprocessing steps include:

- logarithmic transformation of recruitment estimates,
- standardization where appropriate,
- temporal alignment of recruitment and environmental records,
- visual inspection of time series.

The specific preprocessing differs slightly between the long-term and short-term analyses.

---

# Long-Term Correlation Analysis

## Step 4 – Extract Long-Term Variability

Both recruitment and environmental time series are smoothed using moving averages.

The objective is to suppress high-frequency interannual variability while preserving long-term temporal trends.

This allows gradual changes occurring over several years or decades to be compared directly.

---

## Step 5 – Calculate Correlations

Pearson correlation coefficients are calculated between the smoothed recruitment and environmental series.

Separate analyses are performed for each environmental variable and recruitment region.

---

## Step 6 – Correct for Autocorrelation

Moving-average smoothing increases temporal autocorrelation.

To avoid inflated statistical significance, effective degrees of freedom are adjusted to account for autocorrelation before evaluating correlation significance.

---

# Short-Term Correlation Analysis

## Step 4 – Remove Temporal Structure

Recruitment and environmental time series are modelled using ARIMA techniques.

The objective is not forecasting but the removal of long-term trends and temporal autocorrelation.

Residual series (pre-whitened series) are extracted for further analysis.

---

## Step 5 – Evaluate Stationarity

Diagnostic tests and graphical inspection are used to evaluate whether the residual time series satisfy the assumptions required for cross-correlation analysis.

Where necessary, differencing or alternative ARIMA structures are used to obtain stationary residuals.

---

## Step 6 – Cross-Correlation Analysis

Cross-correlation functions (CCF) are calculated between recruitment and environmental residuals.

Multiple temporal lags are examined to determine whether environmental variability precedes recruitment variability by biologically plausible time intervals.

---

# Step 7 – Interpretation

Results from the long-term and short-term analyses are interpreted jointly.

Long-term analyses evaluate whether gradual environmental changes correspond to long-term recruitment decline.

Short-term analyses evaluate whether annual environmental anomalies explain year-to-year recruitment fluctuations.

Together, these complementary analyses provide a more complete assessment of the potential environmental drivers of European eel recruitment.

---

# Workflow Summary

The complete workflow can be summarized as follows.

```text
GEREM regional recruitment estimates
                │
                ▼
Import environmental variables
                │
                ▼
Data preparation
                │
      ┌─────────┴─────────┐
      ▼                   ▼
Long-term analysis   Short-term analysis
      │                   │
Moving averages      ARIMA modelling
Pearson correlation  Pre-whitening
Autocorrelation      Cross-correlation
correction           Lag analysis
      │                   │
      └─────────┬─────────┘
                ▼
Ecological interpretation
```

---

# Relationship to Other Repository Documents

This document describes the sequence of analytical steps.

Additional information is provided in:

- `methodology.md` – scientific rationale and research questions.
- `time_series_methods.md` – explanation of the statistical techniques used.
- `assumptions.md` – assumptions underlying the analyses.
- `data_sources.md` – description of recruitment and environmental datasets.
- `code_walkthrough.md` – explanation of the original R scripts.