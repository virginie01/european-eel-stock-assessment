# Script Inventory

## Purpose

This document provides an overview of the original R scripts preserved in this repository.

The scripts correspond to the environmental correlation analyses conducted during the Master's thesis (2015–2016). They have been retained in their historical form to preserve the original analytical workflow.

The scripts are organized into two groups according to the temporal scale investigated:

- **Long-term analyses**
- **Short-term analyses**

---

# Long-Term Analysis Scripts

These scripts investigate relationships between long-term environmental variability and long-term recruitment trends.

The general workflow includes:

- importing GEREM regional recruitment estimates;
- importing an environmental variable;
- log-transforming and rescaling recruitment estimates;
- smoothing both time series using five-year moving averages;
- calculating Pearson correlation coefficients;
- correcting statistical significance for temporal autocorrelation.

| Script | Environmental variable | Purpose |
|---------|------------------------|---------|
| `gerem_GSI_long.R` | Gulf Stream Index (GSI) | Evaluate relationships between long-term Gulf Stream variability and regional recruitment trends |
| `gerem_SST_long.R` | Sea Surface Temperature (SST) | Evaluate relationships between long-term sea surface temperature variability and regional recruitment trends |

---

# Short-Term Analysis Scripts

These scripts investigate relationships between year-to-year environmental variability and recruitment anomalies.

The general workflow includes:

- importing GEREM regional recruitment estimates;
- importing an environmental variable;
- log-transforming and rescaling recruitment estimates;
- evaluating stationarity and temporal dependence;
- fitting ARIMA models;
- pre-whitening the time series;
- calculating cross-correlation functions (CCF).

| Script | Environmental variable | Purpose |
|---------|------------------------|---------|
| `gerem_GSI_short.R` | Gulf Stream Index (GSI) | Investigate lagged relationships between Gulf Stream variability and recruitment anomalies |
| `gerem_NAO_short.R` | North Atlantic Oscillation (NAO) | Investigate lagged relationships between atmospheric variability and recruitment anomalies |
| `gerem_PP_short.R` | Primary Production (PP) | Investigate lagged relationships between primary production and recruitment anomalies |

---

# Historical Notes

The scripts were developed as part of the original Master's research project.

They intentionally preserve the historical implementation, including:

- original variable names;
- original coding style;
- repeated code across scripts;
- manual preprocessing steps.

No attempt has been made to modernize or refactor the implementation in order to preserve reproducibility.

---

# Relationship to Other Repository Documents

The scripts are explained in greater detail in:

- `documentation/code_walkthrough.md`

The statistical techniques implemented in the scripts are described in:

- `documentation/time_series_methods.md`

The scientific rationale for the analyses is described in:

- `documentation/methodology.md`