# Script Inventory

## GEREM_main_script.R

### Purpose

Main execution script for the European implementation of GEREM.

### Inputs

- european_serie2.csv
- french_serie2.csv
- bv2.csv
- zones2.csv
- ccm_bv2.csv

### Outputs

- jags2_1.Rdata

### Main Tasks

- Data import
- Data harmonization
- Observation classification
- Spatial hierarchy construction
- JAGS data preparation
- MCMC initialization
- Model execution
- Convergence diagnostics

### Dependencies

- runjags
- coda
- parallel

## versionBugs2_1.txt

### Purpose

JAGS implementation of the GEREM hierarchical Bayesian model.

### Main Components

- European recruitment dynamics
- Regional allocation
- Basin allocation
- Observation models
- Prior distributions

### Used By

GEREM_main_script.R

## jags2_1.Rdata

### Purpose

Saved R workspace containing fitted model outputs.

### Contents

Include:

- Posterior samples
- Recruitment estimates
- Convergence diagnostics
- Derived quantities