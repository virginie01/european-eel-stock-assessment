# Assumptions

## Purpose

This document describes the principal assumptions underlying the environmental correlation analyses presented in this repository.

The analyses combine several statistical techniques designed to investigate relationships between regional European eel recruitment and large-scale environmental variability.

Each method relies on specific assumptions regarding the statistical properties of the time series and the interpretation of the resulting relationships.

Understanding these assumptions is essential for correctly interpreting the results.

---

# General Assumptions

## Recruitment Estimates Represent Regional Recruitment Dynamics

The analyses assume that the regional recruitment estimates produced by GEREM provide robust indicators of annual recruitment dynamics.

Because GEREM integrates multiple monitoring programs while accounting for observation uncertainty, these regional estimates are assumed to better represent large-scale recruitment variability than any individual monitoring station.

---

## Environmental Variables Represent Relevant Ecological Processes

Each environmental variable is assumed to represent a plausible ecological mechanism influencing eel recruitment.

For example:

- Gulf Stream Index represents large-scale ocean circulation.
- North Atlantic Oscillation represents atmospheric variability.
- Sea Surface Temperature represents thermal conditions experienced by larvae.
- Primary Production represents food availability during the oceanic phase.

These variables are considered proxies for broader environmental processes rather than direct causal mechanisms.

---

## Correlation Does Not Demonstrate Causation

The analyses identify statistical associations between recruitment and environmental variability.

Significant correlations alone do not establish causal relationships.

Observed associations should be interpreted in the context of biological knowledge, previous literature, and plausible ecological mechanisms.

---

# Assumptions of the Long-Term Analyses

## Long-Term Trends Are Ecologically Meaningful

Moving-average smoothing assumes that gradual changes over multiple years contain biologically meaningful information regarding long-term recruitment dynamics.

High-frequency annual fluctuations are considered noise relative to these longer-term patterns.

---

## Pearson Correlation Assumes Linear Relationships

Pearson correlation measures the strength of linear associations between two continuous variables.

Non-linear relationships may not be adequately captured using this approach.

---

## Autocorrelation Is Appropriately Accounted For

Smoothed time series exhibit temporal autocorrelation.

The analyses assume that adjusting the effective degrees of freedom adequately compensates for this dependence when evaluating statistical significance.

---

# Assumptions of the Short-Term Analyses

## Stationarity

Cross-correlation analyses assume that the statistical properties of the residual time series remain approximately constant through time.

Where necessary, ARIMA modelling and differencing are used to achieve stationarity before calculating cross-correlations.

---

## ARIMA Models Adequately Describe Temporal Structure

ARIMA models are assumed to capture the principal temporal dependence present within each recruitment and environmental time series.

Residuals are expected to contain little remaining autocorrelation.

---

## Residuals Approximate White Noise

After pre-whitening, residual time series should approximate white noise.

Residuals are expected to:

- have constant variance,
- exhibit no significant temporal autocorrelation,
- contain no remaining long-term trend.

Only under these conditions can cross-correlations be interpreted reliably.

---

## Lagged Relationships Are Biologically Plausible

Cross-correlation analyses assume that environmental variability may influence recruitment after biologically realistic delays.

The lags investigated therefore reflect plausible timescales associated with larval transport, development, and recruitment.

Statistically significant lags without biological justification should be interpreted cautiously.

---

# Data Assumptions

## Time Series Are Temporally Aligned

Recruitment and environmental records are assumed to be correctly synchronized in time.

Where lagged relationships are investigated, temporal shifts are explicitly incorporated into the analyses.

---

## Data Quality

The analyses assume that both recruitment estimates and environmental datasets are of sufficient quality to characterize the temporal processes under investigation.

Remaining measurement uncertainty is assumed to be small relative to the temporal patterns being analysed.

---

# Ecological Assumptions

## Large-Scale Environmental Processes Influence Recruitment

The analyses assume that large-scale climatic and oceanographic variability can influence recruitment success through processes such as:

- larval transport,
- food availability,
- ocean productivity,
- larval growth,
- larval survival.

These mechanisms operate primarily during the oceanic phase of the European eel life cycle.

---

## Multiple Environmental Drivers May Operate Simultaneously

Recruitment variability is unlikely to be explained by a single environmental variable.

Instead, recruitment is assumed to result from the combined influence of multiple interacting environmental processes acting across different spatial and temporal scales.

The correlation analyses therefore investigate individual environmental variables separately while recognizing that recruitment dynamics are inherently multifactorial.

---

# Interpretation

The statistical methods documented in this repository provide evidence of temporal associations between recruitment and environmental variability.

The results should therefore be interpreted as identifying candidate environmental drivers rather than demonstrating direct causal relationships.

Together with the preceding Dynamic Factor Analysis (DFA) and Glass Eel Recruitment Estimation Model (GEREM), these analyses contribute to a broader understanding of the large-scale ecological processes influencing European eel recruitment.