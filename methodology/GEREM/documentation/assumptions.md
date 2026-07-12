# GEREM Assumptions

## Purpose

This document describes the principal assumptions underlying the Glass Eel Recruitment Estimation Model (GEREM).

These assumptions are necessary to integrate heterogeneous recruitment observations into a coherent assessment framework at European scale.

The assumptions should be considered when interpreting recruitment estimates and model outputs.

---

# Biological Assumptions

## Panmictic Population Structure

GEREM assumes that European eel (*Anguilla anguilla*) constitutes a single panmictic stock.

Under this assumption, recruitment observed across Europe originates from a common spawning population.

This assumption justifies the estimation of recruitment at the European scale and provides the biological basis for linking recruitment observations collected across multiple regions.

---

# Spatial Assumptions

## Similar Recruitment Densities Within Zones

GEREM assumes that river basins belonging to the same recruitment zone experience broadly similar recruitment densities after accounting for basin size and spatial allocation.

This assumption allows recruitment information from monitored basins to be extrapolated to unmonitored basins within the same recruitment zone.

Without this assumption, recruitment estimates could not be extended from monitored catchments to the wider river network.

---

## Recruitment Scales With Catchment Size

Within a recruitment zone, recruitment is assumed to scale with river basin size according to the parameter β.

Recruitment weight is proportional to:

```text
surface^β
```

where:

- β = 1 implies recruitment is proportional to basin area
- β < 1 implies relatively greater recruitment in smaller basins
- β > 1 implies relatively greater recruitment in larger basins

The value of β is estimated by the model.

---

# Temporal Assumptions

## European Recruitment Evolves Gradually Through Time

GEREM assumes that recruitment does not fluctuate independently from one year to the next.

Instead, annual recruitment is modeled as a stochastic process in which recruitment in a given year depends on recruitment in the previous year plus process variability.

This assumption reflects the expectation that recruitment dynamics are temporally structured rather than completely random.

---

## Regional Recruitment Proportions Change Smoothly Through Time

The relative contribution of each recruitment zone to total European recruitment is assumed to evolve gradually through time.

Abrupt year-to-year changes are considered unlikely unless supported by the data.

This assumption stabilizes estimation of regional recruitment trajectories.

---

# Observation Assumptions

## Common Underlying Recruitment Process

All recruitment observations are assumed to measure the same underlying recruitment process.

This includes:

- Commercial catches
- Commercial CPUE
- Scientific surveys
- Trapping systems
- Expert estimates
- Absolute recruitment estimates

Although observation methods differ, each series is assumed to provide information about the same latent recruitment signal.

---

## Observation Errors Follow Log-Normal Distributions

Observation uncertainty is modeled on the logarithmic scale.

This assumption implies that:

- observation errors are multiplicative rather than additive
- uncertainty increases with recruitment magnitude
- recruitment estimates remain positive

---

## Conditional Independence of Observation Series

Given the underlying recruitment process, observation series are assumed to be conditionally independent.

Residual variation in one monitoring series is therefore assumed not to influence residual variation in another series once recruitment has been accounted for.

---

# Data Assumptions

## Presence of Absolute Recruitment Information

GEREM requires at least one source of information capable of informing recruitment magnitude within each recruitment zone.

Examples include:

- Absolute recruitment estimates
- Trapping systems
- Expert estimates
- Monitoring series from which absolute recruitment can be derived

Without such information, the model may estimate relative trends but cannot reliably estimate recruitment magnitude.

This requirement is necessary for model identifiability.

---

## Consistency of Recruitment Trends Within Zones

Monitoring series assigned to the same recruitment zone are assumed to share a common underlying temporal signal.

This assumption was investigated independently using Dynamic Factor Analysis (DFA).

The DFA component of the thesis provided support for grouping recruitment series into recruitment zones prior to implementation of GEREM.

---

# Interpretation

GEREM should be viewed as a model-based framework for integrating fragmented monitoring data into stock-wide recruitment estimates.

The quality of recruitment estimates depends not only on data quality but also on the degree to which these assumptions are satisfied.

Several assumptions were evaluated independently through complementary analyses presented elsewhere in the thesis, particularly Dynamic Factor Analysis (DFA) and environmental correlation analyses.