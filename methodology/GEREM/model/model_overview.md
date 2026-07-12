# GEREM Model Overview

## Introduction

The European eel (*Anguilla anguilla*) is generally considered a panmictic population, meaning that individuals across its distribution range belong to a single reproductive stock. Spawning is believed to occur in the Sargasso Sea, after which larvae drift towards Europe and North Africa before recruiting to continental waters.

Despite this stock-wide biological structure, recruitment monitoring has historically been conducted at local, regional, or national scales. Monitoring programs differ substantially in methodology, spatial coverage, duration, and measurement units. As a result, recruitment information exists across Europe, but remains fragmented among river basins, regions, and countries.

At the time this work was conducted, no assessment framework existed to estimate recruitment consistently at the scale of the entire European stock while simultaneously accounting for regional differences in monitoring systems and observation types.

The Glass Eel Recruitment Estimation Model (GEREM) was developed to address this challenge. The model integrates heterogeneous recruitment indices collected throughout Europe within a hierarchical Bayesian framework and provides recruitment estimates at European, regional, and river basin scales.

The objective of GEREM is therefore to reconcile the panmictic nature of the European eel stock with the fragmented structure of monitoring programs across Europe.

---

# Objectives

GEREM was designed to:

1. Estimate annual recruitment at the scale of the European stock.
2. Estimate recruitment within major European recruitment regions.
3. Estimate recruitment at river basin scale.
4. Integrate heterogeneous monitoring datasets within a common statistical framework.
5. Quantify uncertainty associated with recruitment estimates.
6. Produce biologically coherent recruitment estimates across multiple spatial scales.

---

# Conceptual Structure

GEREM is a hierarchical Bayesian model operating across three nested spatial scales.

```text
European Recruitment
        ↓
Regional Recruitment
        ↓
River Basin Recruitment
        ↓
Observed Monitoring Data
```

The model estimates latent recruitment processes while accounting for observation uncertainty and differences among monitoring systems.

---

# Spatial Hierarchy

## European Scale

The highest level of the model represents total European recruitment.

For each year, GEREM estimates:

- European recruitment abundance
- Temporal changes in recruitment
- Associated uncertainty

This quantity is represented by:

```text
Rglobal
```

---

## Regional Scale

European recruitment is partitioned among six recruitment zones:

- BI (Bay of Biscay)
- ATL_F (French Atlantic Coast)
- NS (North Sea)
- Manche (English Channel)
- ATL_IB (Iberian Atlantic Coast)
- Med (Mediterranean)

For each year, the model estimates the proportion of European recruitment allocated to each region.

These proportions are represented by:

```text
propR
```

Regional recruitment is represented by:

```text
Rzone
```

---

## River Basin Scale

Regional recruitment is distributed among individual river basins.

Each basin receives a proportion of regional recruitment determined by basin surface area and a scaling parameter:

```text
β
```

River basin recruitment is represented by:

```text
Rbv
```

---

# Recruitment Dynamics

European recruitment is modeled as a stochastic temporal process.

The logarithm of European recruitment follows a random walk:

```text
log(Rglobal[t])
```

depends on:

```text
log(Rglobal[t−1])
```

plus a process error term.

This structure assumes that recruitment changes gradually through time while allowing substantial interannual variability.

---

# Regional Allocation

Recruitment is distributed among the six recruitment zones through a time-varying allocation process.

Regional proportions are modeled using a Dirichlet distribution, allowing recruitment patterns to evolve through time while preserving temporal continuity.

This component enables the model to estimate:

- changes in total European recruitment
- changes in the spatial distribution of recruitment across Europe

---

# Basin Allocation

Within each recruitment zone, recruitment is distributed among river basins according to basin surface area and the scaling parameter β.

Recruitment weight is proportional to:

```text
surface^β
```

### β = 1

Recruitment is proportional to basin surface area.

### β < 1

Smaller basins receive relatively more recruitment.

### β > 1

Larger basins receive relatively more recruitment.

The allocation process uses the complete catchment network described in `ccm_bv2.csv`, allowing recruitment estimates to be extrapolated beyond monitored river basins.

---

# Observation Models

GEREM integrates four categories of recruitment observations.

## Relative Indices

Examples include:

- Commercial CPUE series
- Scientific surveys
- Relative abundance indices

These observations inform recruitment trends but not absolute abundance.

A catchability coefficient is estimated for each series.

---

## Trap Data

Examples include:

- Recruitment trapping stations
- Monitoring traps

These observations are linked to recruitment through an estimated trapping efficiency parameter.

---

## Absolute Recruitment Estimates

Examples include:

- GERMA series
- GEMAC series
- Vaccares
- Somme
- Oria

These observations provide information on absolute recruitment magnitude and anchor the scale of the model.

---

## Expert Estimates

Expert-derived recruitment estimates are incorporated through a separate observation model and contribute information on recruitment magnitude.

---

# Bayesian Framework

GEREM is implemented as a hierarchical Bayesian model using JAGS.

The model estimates posterior distributions for:

- European recruitment
- Regional recruitment
- Basin recruitment
- Catchability coefficients
- Trap efficiency parameters
- Observation uncertainties
- Spatial allocation parameters

Inference is performed using Markov Chain Monte Carlo (MCMC) sampling.

The Bayesian framework allows uncertainty to be propagated through all levels of the model hierarchy.

---

# Main Outputs

GEREM produces estimates at multiple spatial scales.

## Recruitment Estimates

- European recruitment
- Regional recruitment
- Basin recruitment

## Observation Parameters

- Catchability coefficients
- Trap efficiency parameters
- Observation uncertainties

## Spatial Parameters

- Regional recruitment proportions
- Basin scaling parameter β

## Uncertainty Estimates

Posterior distributions and credible intervals for all estimated quantities.

---

# Key Assumptions

GEREM relies on several important assumptions.

## 1. European recruitment evolves gradually through time

Recruitment is modeled as a stochastic temporal process in which recruitment in a given year depends on recruitment in the previous year plus process variability.

## 2. Regional recruitment proportions evolve smoothly through time

The geographic distribution of recruitment among European regions may vary through time, but abrupt year-to-year changes are considered unlikely.

## 3. Recruitment scales with catchment size according to β

Within a region, recruitment is distributed among river basins according to basin surface area and the scaling parameter β.

## 4. Observation errors follow log-normal distributions

Observation uncertainty is explicitly modeled for all monitoring series.

## 5. Multiple observation types measure a common latent recruitment process

Commercial catches, scientific surveys, trapping systems, expert estimates, and absolute recruitment estimates are assumed to provide information on the same underlying recruitment process.

## 6. Similar glass eel densities occur within a recruitment zone

GEREM assumes that river basins within the same recruitment zone experience broadly comparable recruitment densities after accounting for basin size and spatial allocation.

This assumption allows recruitment information from monitored basins to be extrapolated to unmonitored basins within the same zone.

## 7. Recruitment indices within a zone share a common temporal signal

Monitoring series belonging to the same recruitment zone are assumed to reflect a common underlying recruitment trend.

This assumption was investigated independently through Dynamic Factor Analysis (DFA), which constituted a separate component of the thesis.

The DFA results provided support for grouping recruitment series into regional recruitment zones prior to implementation of GEREM.

## 8. At least one absolute recruitment indicator is available within each recruitment zone

To estimate recruitment magnitude rather than relative trends alone, GEREM requires at least one observation series capable of informing absolute recruitment levels within each recruitment zone.

Such information may originate from:

- absolute recruitment estimates
- trapping systems
- expert-derived estimates

or any monitoring series from which absolute recruitment can be derived.

Without such information, recruitment magnitude cannot be estimated reliably within a zone and only relative trends can be inferred.

---

# Significance

GEREM was developed to address a fundamental mismatch between biological reality and monitoring practice.

The European eel is generally considered a single panmictic stock distributed across a vast geographic range. However, monitoring programs have historically been implemented independently by regions, river basins, and countries, resulting in fragmented and heterogeneous datasets.

GEREM provides a framework for integrating these scattered observations into a coherent stock-wide assessment while preserving regional and local information.

More broadly, the model represents an example of hierarchical Bayesian data fusion in which multiple observation systems are combined to estimate a common latent process across nested spatial scales.

The framework therefore reconciles the stock-wide biological structure of the European eel population with the fragmented nature of European monitoring efforts.