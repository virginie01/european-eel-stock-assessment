# GEREM Workflow

## Purpose

This document describes the workflow used to estimate European eel recruitment using the Glass Eel Recruitment Estimation Model (GEREM).

The workflow transforms heterogeneous recruitment observations collected throughout Europe into recruitment estimates at European, regional, and river basin scales.

---

# Overview

GEREM combines multiple data sources within a hierarchical Bayesian framework.

```text
Recruitment observations
        +
Spatial metadata
        +
Catchment reference data
        ↓
Data preparation
        ↓
Observation classification
        ↓
Spatial hierarchy construction
        ↓
Bayesian model fitting
        ↓
Posterior inference
        ↓
Recruitment estimates
```

---

# Step 1: Load Input Data

The model uses five primary datasets.

## Recruitment observations

### european_serie2.csv

Contains recruitment observations from:

- Commercial catches
- Commercial CPUE
- Scientific surveys
- Trapping systems

### french_serie2.csv

Contains absolute recruitment estimates used to anchor recruitment magnitude.

## Spatial metadata

### bv2.csv

Links each recruitment series to:

- River basin
- Recruitment zone
- Observation type

### zones2.csv

Defines the six recruitment zones used by GEREM.

## Catchment reference data

### ccm_bv2.csv

Provides catchment areas used to distribute recruitment among river basins.

---

# Step 2: Data Preparation

The recruitment datasets are imported and transformed into a common format.

Operations include:

- Reshaping observations
- Merging datasets
- Unit standardization
- Data corrections
- Time-series alignment

Examples include:

- Conversion to common biomass units
- Correction of updated recruitment estimates
- Harmonization of monitoring series

The resulting dataset contains annual recruitment observations for all available monitoring programs.

---

# Step 3: Observation Classification

Recruitment series are classified according to observation type.

## Relative indices

Examples:

- Scientific surveys
- Commercial CPUE

These observations provide information on recruitment trends.

## Trap series

Examples:

- Recruitment trapping stations

These observations provide information on recruitment after accounting for trapping efficiency.

## Absolute estimates

Examples:

- GERMA
- GEMAC
- Vaccares
- Somme
- Oria

These observations provide information on recruitment magnitude.

## Expert estimates

Expert-derived recruitment estimates incorporated through a dedicated observation model.

---

# Step 4: Construction of Spatial Hierarchy

GEREM operates across three nested spatial scales.

```text
Europe
   ↓
Recruitment Zones
   ↓
River Basins
   ↓
Monitoring Stations
```

Each observation is assigned to:

- a river basin
- a recruitment zone

using the metadata contained in `bv2.csv`.

---

# Step 5: Basin Weight Calculation

Recruitment is distributed among river basins according to basin surface area.

Catchment areas are extracted from:

```text
ccm_bv2.csv
```

For each basin, a recruitment weight is calculated using:

```text
surface^β
```

where β is estimated by the model.

This step allows recruitment estimates to be extrapolated from monitored basins to the broader catchment network.

---

# Step 6: Bayesian Model Construction

The statistical model is implemented in:

```text
model/versionBugs2_1.txt
```

The model combines:

- European recruitment dynamics
- Regional recruitment allocation
- Basin recruitment allocation
- Observation models
- Prior distributions

The resulting structure links all observations to a common latent recruitment process.

---

# Step 7: Initialization

Prior to model fitting, initial values are generated for all major parameters.

Initialization includes:

- Recruitment trajectories
- Regional recruitment proportions
- Catchability coefficients
- Trap efficiencies
- Observation variances
- Process variances

Randomized initial values are used for each MCMC chain.

---

# Step 8: Model Fitting

Inference is performed using JAGS through the R package:

```text
runjags
```

The fitting procedure consists of:

1. Model adaptation
2. Burn-in period
3. Posterior sampling
4. Convergence assessment

Multiple MCMC chains are run in parallel.

---

# Step 9: Convergence Diagnostics

Model convergence is assessed using standard MCMC diagnostics.

Examples include:

- Gelman-Rubin diagnostics
- Chain comparison
- Posterior inspection

Only converged posterior distributions are used for inference.

---

# Step 10: Posterior Inference

Posterior samples are used to estimate:

## European recruitment

Annual recruitment at stock scale.

## Regional recruitment

Annual recruitment for each recruitment zone.

## Basin recruitment

Annual recruitment for individual river basins.

## Observation parameters

- Catchability coefficients
- Trap efficiencies
- Observation variances

---

# Step 11: Output Generation

The fitted model produces:

- Recruitment trajectories
- Recruitment distributions
- Credible intervals
- Spatial allocation estimates
- Observation parameter estimates

The complete fitted workspace is saved as:

```text
jags2_1.Rdata
```

to preserve reproducibility.

---

# Relationship with Other Thesis Components

GEREM represents the recruitment estimation component of the thesis.

The workflow relies on assumptions evaluated through complementary analyses.

## Dynamic Factor Analysis (DFA)

Used to investigate common recruitment patterns and support the regional grouping of recruitment series.

The assumption that recruitment indices within a zone share a common temporal signal was evaluated through DFA prior to implementation of GEREM.

## Environmental Correlation Analysis

Used to investigate potential environmental drivers of recruitment variability and to provide ecological interpretation of the recruitment patterns estimated by GEREM.

Together, these analyses provide the basis for interpreting recruitment dynamics estimated by GEREM.

---

# Final Products

The final outputs of GEREM are:

- European recruitment estimates
- Regional recruitment estimates
- River basin recruitment estimates
- Associated uncertainty estimates

These outputs provide a coherent assessment framework linking fragmented monitoring data to the stock-wide scale of the European eel population.