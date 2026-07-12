# Data Sources

## Purpose

This document describes the recruitment time series used in the Dynamic Factor Analysis (DFA) presented in this repository.

The analysis was based on long-term glass eel recruitment monitoring programs distributed across Europe.

These monitoring programs differ in geographic location, monitoring methodology, and temporal coverage, but all aim to quantify annual recruitment of juvenile European eel (*Anguilla anguilla*) to continental waters.

---

# Overview

The archived implementation uses a subset of recruitment series considered sufficiently reliable for multivariate analysis.

The objective was not to estimate recruitment directly, but to investigate whether geographically separated recruitment series shared common temporal patterns.

The dataset therefore consists of annual recruitment indices originating from multiple independent monitoring programs.

---

# Recruitment Monitoring Network

The archived implementation retains the following recruitment series:

- Bann
- Nalon
- Rhine
- Ijzer
- Viskan
- Erne
- Ebrodeltalagoons
- Vilaine
- Severn
- Albuferalagoon
- Imsa
- Gironde
- GirondeCP
- Loire
- Shannon
- Minho36
- Minho 35
- Minho total
- Lauwersoog
- Rhingals
- Katwijk
- AdourCP
- Ems
- Tiber
- Stellendam
- GirondeSc
- Adour
- IYFS/IBTS 1
- IYFS/IBTS 2
- Bresle
- Fremur
- Vidaa
- Somme
- Feale
- Inagh
- Maigne
- SevresNiortaise

Each recruitment series represents annual observations collected at a specific monitoring location.

---

# Geographic Coverage

The monitoring network spans much of the European distribution of the species, including:

- Atlantic coast of France
- Bay of Biscay
- Iberian Peninsula
- North Sea
- English Channel
- Scandinavian rivers
- Mediterranean region

This broad spatial coverage allows recruitment dynamics to be investigated at the continental scale.

---

# Observation Types

Although all series describe recruitment, they originate from different monitoring methodologies.

These include:

- Commercial catches
- Commercial catch-per-unit-effort (CPUE)
- Scientific monitoring programs
- Recruitment trapping stations
- Scientific recruitment estimates

Each observation type provides an index of recruitment at a particular location.

The objective of the DFA is to identify common temporal behaviour across these heterogeneous monitoring systems.

---

# Selection of Recruitment Series

Not all available recruitment series were included in the analysis.

The archived implementation explicitly selects a subset of monitoring programs considered suitable for Dynamic Factor Analysis.

Selection was based on the dataset used in the Master's thesis and reflects the quality-controlled input data used for model fitting.

Some recruitment series were excluded because of limited temporal coverage, incomplete records, or other considerations during data preparation.

---

# Temporal Coverage

The recruitment series differ in their duration.

Some monitoring programs extend over several decades, whereas others begin later or contain missing observations.

Rather than requiring complete time series, the analysis retains incomplete records and allows missing observations to be handled directly by the MARSS framework.

---

# Data Harmonization

The raw recruitment observations are imported from:

```text
recruitment_series_DFA.csv
```

Prior to model fitting, the archived implementation applies several preprocessing steps:

- log transformation,
- selection of recruitment series,
- treatment of missing observations,
- removal of early observations from the Minho total series,
- mean-centering,
- matrix transposition.

The original dataset itself is preserved unchanged.

---

# Why These Data Were Used

Dynamic Factor Analysis seeks to identify temporal patterns shared among multiple recruitment time series.

The value of the analysis therefore depends on assembling a monitoring network that:

- spans a broad geographic range,
- contains long-term observations,
- represents multiple independent monitoring programs,
- captures recruitment variability across Europe.

The selected recruitment series provide a representative picture of European glass eel recruitment over the study period.

---

# Relationship to GEREM

The recruitment time series used in this analysis were also used in the broader research programme.

Dynamic Factor Analysis was performed first to investigate whether recruitment series exhibited common temporal behaviour.

The resulting interpretation of recruitment patterns provided empirical support for grouping recruitment series into recruitment regions.

These regional groupings were subsequently incorporated into the Glass Eel Recruitment Estimation Model (GEREM), where they formed part of the hierarchical Bayesian framework used to estimate recruitment at European, regional, and river basin scales.

Thus, the same monitoring network contributed to both the exploratory multivariate analysis (DFA) and the subsequent Bayesian recruitment estimation (GEREM).