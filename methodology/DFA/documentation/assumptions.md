# Dynamic Factor Analysis Assumptions

## Purpose

This document describes the principal assumptions underlying the Dynamic Factor Analysis (DFA) conducted in this repository.

Understanding these assumptions is important for interpreting the common temporal trends identified by the analysis and their ecological significance.

---

# Statistical Assumptions

## Recruitment Time Series Share Common Temporal Patterns

The primary assumption of Dynamic Factor Analysis is that multiple observed recruitment time series can be described by a relatively small number of underlying latent temporal trends.

Rather than evolving independently, recruitment series are assumed to exhibit common patterns that reflect large-scale ecological processes.

---

## Observation Errors Are Independent

The archived implementation assumes a diagonal and unequal observation error covariance matrix:

```text
R = "diagonal and unequal"
```

This assumes that:

- each recruitment series has its own observation variance,
- observation errors are independent among recruitment series.

---

## Linear Relationship Between Latent Trends and Observations

Each recruitment series is assumed to be a linear combination of one or more latent temporal trends.

The strength of the relationship is estimated through factor loadings.

---

# Data Assumptions

## Recruitment Series Are Comparable

Although recruitment series originate from different monitoring programs and observation methods, they are assumed to measure the same underlying biological process: glass eel recruitment.

Differences in monitoring methodology are assumed not to prevent the identification of common temporal dynamics.

---

## Log Transformation Is Appropriate

Recruitment observations are transformed using:

```r
log(data + 1)
```

This assumes that recruitment data are approximately log-normally distributed and that the transformation improves statistical properties by reducing skewness and stabilizing variance.

---

## Mean-Centering Removes Differences in Average Recruitment

Prior to model fitting, each recruitment series is centered by subtracting its mean.

This assumes that differences in average recruitment magnitude among monitoring sites are not the primary focus of the analysis.

Instead, the analysis focuses on shared temporal variability.

---

## Missing Values Are Missing at Random

Incomplete recruitment records are retained as missing values (`NA`).

The MARSS framework assumes that missing observations do not introduce systematic bias into estimation and can be accommodated during model fitting.

---

# Model Selection Assumptions

## A Small Number of Latent Trends Is Sufficient

Candidate models containing between one and four latent trends were compared.

The analysis assumes that a relatively small number of common trends can adequately describe the dominant temporal variability present in the recruitment network.

---

## AICc Provides an Appropriate Criterion for Model Selection

Models are compared using the corrected Akaike Information Criterion (AICc).

AICc assumes that the preferred model is the one providing the best compromise between model fit and model complexity.

---

# Ecological Assumptions

## Common Trends Reflect Large-Scale Recruitment Dynamics

The latent trends identified by the DFA are interpreted as representing broad-scale temporal patterns in European glass eel recruitment.

These patterns may reflect shared environmental drivers, large-scale oceanographic processes, or other ecological mechanisms affecting recruitment across multiple monitoring locations.

However, DFA identifies statistical patterns rather than causal relationships.

Additional analyses are required to investigate the environmental processes responsible for the observed trends.

---

# Relationship to GEREM

The DFA was conducted to evaluate whether recruitment series exhibited sufficiently similar temporal dynamics to justify grouping them into broader recruitment regions.

The results supported one of the key assumptions of the Glass Eel Recruitment Estimation Model (GEREM): that recruitment series within a recruitment region share a common underlying temporal signal.

Thus, DFA provided an empirical basis for the regional structure adopted in the subsequent Bayesian recruitment model.

---

# Interpretation

The validity of the DFA results depends on the extent to which these assumptions are satisfied.

The extracted latent trends should therefore be interpreted as statistical summaries of shared temporal variability rather than direct representations of underlying biological or environmental mechanisms.