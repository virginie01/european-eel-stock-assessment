# Data Sources

## Purpose

GEREM was developed to integrate recruitment information originating from multiple monitoring programs distributed throughout Europe.

These monitoring programs differ in:

- Observation method
- Spatial coverage
- Temporal coverage
- Sampling effort
- Measurement units

No single monitoring system provides a complete assessment of recruitment at the scale of the European eel stock.

GEREM therefore combines multiple sources of information within a common statistical framework.

---

# Overview

The recruitment datasets used in GEREM can be grouped into four major categories:

1. Relative recruitment indices
2. Trap-based recruitment estimates
3. Absolute recruitment estimates
4. Expert-derived estimates

Each observation type provides complementary information about the underlying recruitment process.

---

# Relative Recruitment Indices

## Description

Relative recruitment indices provide information on changes in recruitment through time but do not directly estimate recruitment magnitude.

These series are useful for identifying recruitment trends and temporal variability.

However, they cannot be used alone to estimate absolute recruitment.

---

## Examples

### Commercial Catch Series

Examples include:

- Loire commercial catch
- Ebro commercial catch
- Minho commercial catch
- Gironde Estuary commercial catch
- Severn commercial catch

Commercial catches provide long-term information on recruitment dynamics but may be influenced by changes in fishing effort and exploitation patterns.

---

### Commercial CPUE Series

Examples include:

- Adour Estuary commercial CPUE
- Sevre Niortaise Estuary commercial CPUE

Catch per unit effort (CPUE) attempts to standardize recruitment observations by accounting for fishing effort.

---

### Scientific Surveys

Examples include:

- IYFS1
- IYFS2
- Katwijk
- Lauwersoog
- Rhine Den Oever
- Stellendam
- Ringhals
- Ijzer Nieuwpoort

Scientific surveys provide standardized recruitment indices and are generally less influenced by commercial exploitation.

---

## Contribution to GEREM

Relative indices provide information on:

- Recruitment trends
- Temporal variability
- Regional recruitment dynamics

A catchability parameter is estimated for each series to relate observations to underlying recruitment.

---

# Trap-Based Recruitment Estimates

## Description

Trap series are derived from recruitment monitoring stations located in rivers and estuaries.

These observations provide direct measurements of recruiting glass eels entering continental waters.

Trap efficiency may vary among systems and is therefore estimated within the model.

---

## Examples

- Vilaine Arzal
- Bresle
- Imsa
- Fremur
- Erne
- Shannon
- Bann
- River Feale
- River Inagh
- River Maigue
- Viskan

---

## Contribution to GEREM

Trap series provide:

- Recruitment trends
- Information on recruitment magnitude
- Calibration information for recruitment estimates

Trap efficiency parameters are estimated individually for each series.

---

# Absolute Recruitment Estimates

## Description

Absolute recruitment estimates provide direct information on recruitment magnitude.

These observations are critical because they allow recruitment to be estimated in absolute units rather than as relative trends only.

Absolute recruitment estimates anchor the scale of the model.

---

## Examples

- AdGERMA
- GiGEMAC
- SeGEMAC
- ChGEMAC
- LoGERMA
- Vaccares
- Somme
- Oria
- Tiber

---

## Contribution to GEREM

Absolute estimates provide:

- Recruitment magnitude
- Scaling information
- Calibration of relative indices

Without absolute recruitment information, the model could estimate trends but would struggle to estimate recruitment abundance.

---

# Expert-Derived Estimates

## Description

Expert-derived estimates provide recruitment information based on expert knowledge and local assessment.

These observations are incorporated through a dedicated observation model.

---

## Contribution to GEREM

Expert estimates provide:

- Additional information on recruitment magnitude
- Supplemental information in data-poor areas

The model accounts for uncertainty associated with these estimates.

---

# Spatial Coverage

The monitoring network spans multiple European regions including:

- Bay of Biscay
- French Atlantic Coast
- North Sea
- English Channel
- Iberian Atlantic Coast
- Mediterranean

Monitoring systems differ among regions and countries.

This heterogeneity is one of the principal motivations for developing GEREM.

---

# Why Data Fusion Is Necessary

The European eel is generally considered a panmictic stock distributed across a large geographic range.

However, recruitment monitoring has historically been implemented independently by regions, river basins, and countries.

As a result:

- No single dataset provides stock-wide coverage.
- Observation methods differ substantially.
- Monitoring intensity varies among regions.
- Time series differ in duration and quality.

GEREM addresses these limitations by integrating all available sources of information within a hierarchical Bayesian framework.

---

# Relationship With Other Components of the Thesis

The recruitment series documented here were also used in the Dynamic Factor Analysis (DFA) component of the thesis.

DFA was used to investigate common recruitment patterns and evaluate whether recruitment series could be grouped into coherent recruitment zones.

The resulting recruitment zones were subsequently incorporated into GEREM.

The environmental correlation analyses were then used to investigate potential drivers of the recruitment patterns estimated from these datasets.

Together, these analyses provide a comprehensive assessment framework linking recruitment observations, population dynamics, and environmental variability.