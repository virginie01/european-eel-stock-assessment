# GEREM Model Structure

## Purpose

This document describes the hierarchical structure of the Glass Eel Recruitment Estimation Model (GEREM) and the relationships among its principal components.

The objective is to explain how recruitment observations collected throughout Europe are linked to latent recruitment estimates at European, regional, and river basin scales.

---

# General Structure

GEREM is a hierarchical Bayesian model composed of four interconnected layers:

```text
European Recruitment
        ↓
Regional Recruitment
        ↓
River Basin Recruitment
        ↓
Observed Monitoring Data
```

Recruitment is estimated as a latent process and observations are treated as imperfect measurements of that process.

---

# Level 1: European Recruitment

The highest level of the hierarchy represents recruitment at the scale of the European stock.

```text
Rglobal
```

represents total annual recruitment across Europe.

The model estimates:

- annual recruitment magnitude
- temporal changes in recruitment
- associated uncertainty

Recruitment is modeled as a stochastic process evolving through time.

```text
log(Rglobal[t])
        ↓
log(Rglobal[t+1])
```

The temporal component is implemented as a random walk.

This allows recruitment to vary through time while preserving temporal continuity.

---

# Level 2: Regional Recruitment

European recruitment is partitioned among six recruitment zones.

```text
Rglobal
      ↓
   propR
      ↓
   Rzone
```

where:

- `propR` = proportion of recruitment allocated to a zone
- `Rzone` = recruitment within a zone

The six recruitment zones are:

- BI
- ATL_F
- NS
- Manche
- ATL_IB
- Med

For each year:

```text
sum(propR) = 1
```

Regional recruitment is calculated as:

```text
Rzone = Rglobal × propR
```

The proportions evolve through time using a Dirichlet allocation process.

This allows the geographic distribution of recruitment to change while maintaining consistency across years.

---

# Level 3: River Basin Recruitment

Within each recruitment zone, recruitment is distributed among river basins.

```text
Rzone
    ↓
  weight
    ↓
  Rbv
```

where:

- `Rbv` = recruitment in a river basin
- `weight` = recruitment weight assigned to the basin

Recruitment weights are derived from catchment area.

For each basin:

```text
weight ∝ surface^β
```

where:

- `surface` = basin area
- `β` = scaling parameter estimated by the model

The denominator is calculated using all catchments present in the corresponding recruitment zone.

This step allows recruitment to be extrapolated beyond monitored basins to the broader European river network.

---

# Level 4: Observation Models

Observed recruitment indices are linked to river basin recruitment.

GEREM integrates four categories of observations.

```text
Rbv
 ↓
Observations
```

Each observation type has its own observation model.

---

## Relative Indices

Examples:

- Scientific surveys
- Commercial CPUE

Observation equation:

```text
Observation
      =
Recruitment × Catchability
```

Catchability is estimated separately for each series.

Parameter:

```text
q
```

---

## Trap Series

Examples:

- Recruitment trapping stations

Observation equation:

```text
Observation
      =
Recruitment × Trap Efficiency
```

Trap efficiency is estimated separately for each series.

Parameter:

```text
a
```

---

## Absolute Recruitment Estimates

Examples:

- GERMA
- GEMAC
- Somme
- Oria
- Vaccares

These observations directly inform recruitment magnitude.

They provide the information necessary to estimate absolute recruitment levels rather than relative trends alone.

---

## Expert Estimates

Expert-derived recruitment estimates are linked to recruitment through a dedicated observation model.

Parameter:

```text
p
```

---

# Observation Error Structure

All observation types include an observation error component.

Observation uncertainty is modeled on the logarithmic scale.

Separate variance parameters are estimated for:

- Relative indices
- Trap series
- Absolute estimates
- Expert estimates

This allows each observation type to contribute according to its uncertainty.

---

# Data Flow Through the Model

The complete hierarchy can be summarized as:

```text
European Recruitment (Rglobal)
                ↓
Regional Allocation (propR)
                ↓
Regional Recruitment (Rzone)
                ↓
Basin Allocation (β)
                ↓
River Basin Recruitment (Rbv)
                ↓
Observation Models
                ↓
Observed Data
```

Inference proceeds in the reverse direction.

Observed recruitment series provide information about river basin recruitment, which informs regional recruitment estimates and ultimately European recruitment.

---

# Estimated Parameters

GEREM estimates several classes of parameters.

## Recruitment Parameters

- European recruitment (`Rglobal`)
- Regional recruitment (`Rzone`)
- Basin recruitment (`Rbv`)

## Spatial Parameters

- Regional recruitment proportions (`propR`)
- Basin scaling parameter (`β`)

## Observation Parameters

- Catchability coefficients (`q`)
- Trap efficiency coefficients (`a`)
- Expert calibration parameters (`p`)

## Variance Parameters

- Observation variances
- Process variances
- Temporal variability parameters

---

# Model Outputs

The model produces posterior distributions for:

- European recruitment
- Regional recruitment
- Basin recruitment
- Observation parameters
- Spatial allocation parameters

Posterior distributions are summarized through:

- Means
- Medians
- Credible intervals
- Derived statistics

These outputs provide recruitment estimates together with explicit measures of uncertainty.

---

# Relationship With DFA

GEREM assumes that recruitment series grouped within a recruitment zone share a common temporal signal.

This assumption was investigated independently using Dynamic Factor Analysis (DFA).

The DFA results provided support for the regional grouping structure used in GEREM.

The two analyses should therefore be considered complementary components of the overall assessment framework.