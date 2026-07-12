# Time-Series Methods

## Purpose

This document describes the principal time-series techniques used in the environmental correlation analyses.

The objective of these analyses was to investigate relationships between regional European eel recruitment and large-scale environmental variability while accounting for the unique statistical properties of ecological time series.

Ecological time series often exhibit:

- long-term trends,
- temporal autocorrelation,
- delayed responses,
- non-stationarity.

Ignoring these characteristics can lead to misleading or spurious statistical relationships.

Different statistical techniques were therefore applied depending on the temporal scale of interest.

---

# Two Temporal Scales

The environmental analyses addressed two complementary questions.

## Long-Term Variability

**Question**

Do gradual environmental changes explain long-term recruitment decline?

Examples include:

- long-term warming,
- persistent changes in ocean circulation,
- gradual changes in ecosystem productivity.

The objective is to compare long-term trends while ignoring short-term fluctuations.

---

## Short-Term Variability

**Question**

Do annual environmental anomalies influence annual recruitment variability?

Examples include:

- unusually warm years,
- anomalous atmospheric conditions,
- unusually high primary production.

The objective is to compare year-to-year fluctuations after removing long-term trends.

---

# Long-Term Analyses

## Moving Average Smoothing

Moving averages were applied to both recruitment and environmental time series.

The moving average acts as a **low-pass filter**, reducing short-term variability while preserving long-term temporal structure.

Conceptually:

```text
Original signal
/\_/\__/\/\_/\/\_

↓

Moving average

~~~~~~~~~~~~~~~
```

The resulting smoothed series emphasize gradual temporal changes occurring over several years.

---

## Pearson Correlation

Pearson correlation coefficients were calculated between the smoothed recruitment and environmental series.

The Pearson correlation coefficient measures the strength and direction of a linear relationship between two continuous variables.

Values range from:

- +1 : perfect positive relationship
- 0 : no linear relationship
- -1 : perfect negative relationship

Separate correlations were calculated for each recruitment region and environmental variable.

---

## Correction for Autocorrelation

A standard Pearson correlation assumes independent observations.

However, moving-average smoothing increases temporal autocorrelation.

Because neighbouring years are no longer statistically independent, the effective sample size becomes smaller than the number of observations.

To avoid inflated statistical significance, effective degrees of freedom were adjusted prior to hypothesis testing.

---

# Short-Term Analyses

## Stationarity

Cross-correlation analysis assumes that the statistical properties of a time series remain approximately constant through time.

This property is known as **stationarity**.

A stationary series has:

- constant mean,
- constant variance,
- no systematic long-term trend.

Environmental and recruitment time series often violate these assumptions.

Stationarity was therefore evaluated before conducting cross-correlation analyses.

---

## ARIMA Models

Autoregressive Integrated Moving Average (ARIMA) models were used to remove temporal dependence from both recruitment and environmental time series.

The objective was **not forecasting**, but rather the removal of predictable temporal structure.

An ARIMA model combines three components:

### Autoregressive (AR)

Current observations depend on previous observations.

### Integrated (I)

Differencing removes long-term trends to achieve stationarity.

### Moving Average (MA)

Current observations depend on previous random errors.

Different variables required different ARIMA structures depending on their temporal characteristics.

---

## Pre-whitening

After fitting ARIMA models, residuals were extracted.

These residuals represent the component of the time series that cannot be explained by its own temporal structure.

This process is known as **pre-whitening**.

Pre-whitening removes:

- long-term trends,
- temporal persistence,
- serial autocorrelation.

The remaining residuals are more appropriate for investigating relationships between independent time series.

---

## Cross-Correlation Function (CCF)

Relationships between recruitment and environmental residuals were investigated using the Cross-Correlation Function (CCF).

Unlike a simple correlation coefficient, the CCF evaluates relationships across multiple temporal lags.

For example:

```text
Lag = 0

Environment(t)
        ↓
Recruitment(t)
```

```text
Lag = 1

Environment(t)
        ↓
Recruitment(t + 1)
```

```text
Lag = 2

Environment(t)
        ↓
Recruitment(t + 2)
```

Lagged relationships are biologically meaningful because environmental conditions experienced during the larval stage may influence recruitment several years later.

---

# Why Two Different Approaches?

Long-term and short-term analyses answer different ecological questions.

Long-term analyses investigate whether gradual environmental change accompanies long-term recruitment decline.

Short-term analyses investigate whether annual environmental anomalies explain annual recruitment variability.

Neither approach alone provides a complete understanding of recruitment dynamics.

Together they provide complementary evidence regarding potential environmental drivers.

---

# Summary of Methods

| Method | Purpose |
|---------|---------|
| Log transformation | Stabilize variance of recruitment estimates |
| Standardization | Compare variables measured in different units |
| Moving averages | Extract long-term variability |
| Pearson correlation | Quantify long-term linear relationships |
| Effective degrees of freedom | Correct significance tests for autocorrelation |
| Stationarity assessment | Verify assumptions for time-series analyses |
| ARIMA modelling | Remove temporal dependence |
| Pre-whitening | Produce independent residuals |
| Cross-Correlation Function (CCF) | Identify lagged relationships |
| Lag analysis | Evaluate biologically meaningful delays |

---

# Relationship to the Repository

The methods described here provide the statistical foundation for the environmental correlation analyses presented in this repository.

Their application is described in:

- `workflow.md`
- `code_walkthrough.md`

The scientific rationale for their use is described in:

- `methodology.md`

The assumptions underlying each technique are discussed in:

- `assumptions.md`