# Data Dictionary

This document describes the datasets used by the Glass Eel Recruitment Estimation Model (GEREM).

## Overview

GEREM combines heterogeneous recruitment monitoring datasets from across Europe and integrates them within a hierarchical Bayesian framework.

The datasets fall into three categories:

1. Recruitment observations
2. Spatial metadata
3. Catchment reference data

---

# european_serie2.csv

## Description

Master database containing recruitment observations collected throughout Europe.

The dataset contains annual recruitment time series originating from multiple monitoring programs and observation methods.

## Main Fields

| Field | Description |
|---------|---------|
| loc_name | Name of monitoring site or recruitment series |
| dat_year | Observation year |
| dat_value | Observed recruitment value |
| rec_samplingtype | Observation method |
| loc_area | Broad geographic region |
| rec_unit | Original measurement unit |

## Purpose in GEREM

Provides the majority of recruitment observations used in the model.

The series include:

- Commercial catches
- Commercial CPUE
- Scientific surveys
- Trap counts

---

# french_serie2.csv

## Description

Dataset containing absolute recruitment estimates.

These estimates provide information on the absolute magnitude of recruitment and are used to calibrate recruitment levels estimated from relative indices.

## Included Series

- AdGERMA
- GiGEMAC
- SeGEMAC
- ChGEMAC
- LoGERMA
- Vaccares
- Somme
- Oria
- Tiber

## Purpose in GEREM

Provides direct estimates of recruitment abundance and anchors the scale of the model.

---

# bv2.csv

## Description

Metadata table linking each recruitment series to its associated river basin and European zone.

## Fields

| Field | Description |
|---------|---------|
| index | Recruitment series name |
| type | Observation type |
| zone | European recruitment zone |
| bv | Basin identifier |
| surface | Catchment area |
| debit | Mean discharge |

## Observation Types

### relative

Relative abundance indicators requiring estimation of catchability.

### trap

Recruitment estimates derived from trapping systems.

### absolute

Absolute recruitment estimates.

### expertise

Expert-derived recruitment estimate.

## Purpose in GEREM

Defines the relationship between recruitment observations and the spatial hierarchy of the model.

---

# zones2.csv

## Description

Definition of the major recruitment zones used by GEREM.

## Zones

- BI (Bay of Biscay)
- ATL_F (French Atlantic Coast)
- NS (North Sea)
- Manche (English Channel)
- ATL_IB (Iberian Atlantic Coast)
- Med (Mediterranean)

## Fields

| Field | Description |
|---------|---------|
| zone | Zone identifier |
| surface | Total area of the zone (km2) |

## Purpose in GEREM

Provides the intermediate spatial level between Europe and river basins.

---

# ccm_bv2.csv

## Description

Catchment reference dataset containing river basins used for spatial extrapolation.

## Fields

| Field | Description |
|---------|---------|
| wso_id | Catchment identifier |
| area_km2 | Catchment area |
| zone | GEREM zone |
| sea_cd | Coastal basin classification |
| name_short | Basin name when available |

## Purpose in GEREM

Used to calculate basin weighting and recruitment allocation among catchments.

The parameter β determines how recruitment scales with catchment area.

This dataset allows GEREM to extrapolate recruitment estimates beyond monitored basins to the broader European catchment network.

---