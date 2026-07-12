# Methodology

## Purpose

This repository documents the environmental correlation analyses conducted as part of a Master's research project investigating the large-scale drivers of European glass eel (*Anguilla anguilla*) recruitment.

The objective of these analyses was not to estimate recruitment itself, but rather to investigate whether temporal variability in recruitment could be explained by large-scale environmental processes acting during the oceanic phase of the European eel life cycle.

The analyses build directly upon the regional recruitment estimates produced by the Glass Eel Recruitment Estimation Model (GEREM), which provided robust annual estimates of recruitment at the regional scale.

---

# Scientific Context

The European eel is generally considered a panmictic species, with all individuals belonging to a single breeding population spawning in the Sargasso Sea.

Following spawning, leptocephalus larvae drift across the North Atlantic before recruiting to European and North African continental waters as glass eels.

Throughout this transoceanic migration, larvae are exposed to a wide range of environmental conditions that may influence their transport, survival, growth, and ultimately recruitment success.

Consequently, several large-scale environmental processes have been proposed as potential drivers of the dramatic decline in European eel recruitment observed since the early 1980s.

---

# Rationale

Previous studies often investigated environmental drivers using recruitment observations from individual rivers or monitoring stations.

Although valuable, individual recruitment series may be influenced by:

- local environmental conditions,
- sampling variability,
- differences in monitoring methodology,
- incomplete temporal coverage,
- observation error.

Rather than analysing individual monitoring programs independently, this study first integrated all available recruitment observations within the hierarchical Bayesian framework of GEREM.

GEREM produced annual recruitment estimates at the regional scale by combining multiple observation types while explicitly accounting for observation uncertainty.

These regional recruitment estimates provide more robust indicators of large-scale recruitment dynamics and therefore constitute a stronger basis for investigating environmental drivers.

---

# Research Questions

The analyses presented in this repository addressed two complementary questions.

## Question 1

**Are long-term changes in European eel recruitment associated with long-term environmental variability?**

This question focuses on gradual changes occurring over periods of several years to decades.

Potential mechanisms include long-term changes in:

- ocean circulation,
- sea surface temperature,
- climate variability,
- ecosystem productivity.

---

## Question 2

**Do short-term environmental fluctuations explain year-to-year recruitment variability?**

This question focuses on interannual variability.

Rather than investigating long-term trends, the objective is to determine whether unusual environmental conditions are followed by unusually high or low recruitment after biologically meaningful time lags.

---

# Environmental Variables

Several environmental variables representing different ecological mechanisms were investigated.

## Gulf Stream Index (GSI)

The Gulf Stream Index describes large-scale variability in the position and dynamics of the Gulf Stream.

Changes in ocean circulation may influence larval transport from the Sargasso Sea toward Europe.

---

## North Atlantic Oscillation (NAO)

The North Atlantic Oscillation represents large-scale atmospheric variability influencing:

- wind patterns,
- ocean circulation,
- sea surface temperature,
- climate across the North Atlantic.

---

## Sea Surface Temperature (SST)

Sea surface temperature influences larval development, metabolic processes, and marine ecosystem dynamics.

Long-term changes in SST have frequently been proposed as potential contributors to recruitment decline.

---

## Primary Production (PP)

Primary production in the Sargasso Sea serves as a proxy for food availability during the early larval stage.

Changes in primary productivity may influence larval growth and survival prior to transoceanic transport.

---

# Two Complementary Analytical Approaches

Environmental influences were investigated at two temporal scales.

## Long-Term Analysis

Long-term analyses sought to identify relationships between gradual environmental changes and long-term recruitment trends.

Both recruitment and environmental variables were smoothed using moving averages to remove high-frequency variability and emphasize low-frequency temporal patterns.

Pearson correlation coefficients were then calculated between the smoothed time series.

Because smoothing introduces temporal autocorrelation, statistical significance was evaluated using effective degrees of freedom adjusted for autocorrelation.

---

## Short-Term Analysis

Short-term analyses focused on interannual variability.

The objective was to determine whether annual environmental anomalies preceded annual recruitment anomalies after biologically realistic time lags.

Time series were first modelled using ARIMA methods to remove temporal autocorrelation and long-term structure.

The resulting residuals (pre-whitened series) were then analysed using cross-correlation functions (CCF) to identify statistically significant lagged relationships.

This approach minimizes the risk of identifying spurious correlations arising from shared temporal trends.

---

# Methodological Framework

The overall analytical workflow can be summarized as:

```text
GEREM regional recruitment estimates
                │
                ▼
      Environmental variables
                │
      ┌─────────┴─────────┐
      ▼                   ▼
Long-term analysis   Short-term analysis
      │                   │
Moving averages      ARIMA modelling
Pearson correlation  Pre-whitening
Adjusted significance Cross-correlation
      │                   │
      └─────────┬─────────┘
                ▼
     Ecological interpretation
```

The two analytical approaches address complementary aspects of recruitment dynamics and together provide a more comprehensive assessment of potential environmental drivers.

---

# Relationship to the Overall Research Framework

This repository represents the final stage of the analytical framework developed during the Master's thesis.

The progression of the research can be summarized as:

```text
Recruitment monitoring programs
               │
               ▼
Dynamic Factor Analysis (DFA)
               │
Identification of common recruitment dynamics
               │
               ▼
GEREM
Hierarchical Bayesian recruitment estimation
               │
Regional recruitment estimates
               │
               ▼
Environmental correlation analyses
```

Dynamic Factor Analysis (DFA) characterized the temporal structure of European recruitment.

GEREM integrated heterogeneous monitoring programs to estimate recruitment at regional and continental scales.

The environmental correlation analyses documented here then investigated the ecological processes that may underlie the observed recruitment variability.

Together, these three components constitute an integrated statistical framework linking recruitment observations to large-scale environmental drivers.