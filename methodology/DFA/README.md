# Dynamic Factor Analysis (DFA)

Dynamic Factor Analysis (DFA) of European glass eel (*Anguilla anguilla*) recruitment time series.

This repository documents the exploratory multivariate analysis conducted as part of a Master's research project investigating large-scale patterns in European eel recruitment.

The analysis was performed using the **MARSS** package in R and aimed to identify common temporal trends among long-term recruitment monitoring programs distributed across Europe.

---

## Background

The European eel is generally considered a panmictic population, with individuals throughout Europe belonging to a single reproductive stock.

Recruitment is monitored by numerous independent programs distributed across Europe. These monitoring programs differ in:

- geographic location,
- monitoring methodology,
- temporal coverage,
- observation units,
- data quality.

An important question is whether these geographically dispersed recruitment series share common temporal dynamics that may reflect large-scale biological or environmental processes.

Dynamic Factor Analysis (DFA) provides a statistical framework for identifying these shared temporal patterns.

---

## Research Question

The principal question addressed by this analysis was:

> **Do European glass eel recruitment time series exhibit common temporal dynamics that can be summarized by a small number of latent trends?**

Identifying such common trends provides insight into the spatial organization of recruitment across Europe and helps determine whether monitoring locations can be grouped into coherent recruitment regions.

---

## Methodological Approach

The analysis consisted of:

- importing long-term recruitment time series,
- applying log transformation,
- selecting reliable recruitment series,
- mean-centering observations,
- fitting Dynamic Factor Analysis models,
- comparing models with one to four latent trends,
- selecting the preferred model using AICc,
- interpreting common recruitment trends and factor loadings.

The analysis was implemented using the **MARSS** package in R.

---

## Repository Structure

```text
DFA/
│
├── data/
│
├── documentation/
│
├── figures_tables/
│
├── original_code/
│
└── README.md
```

---

## Documentation Guide

For readers interested in understanding the analysis:

1. Start with `documentation/methodology.md`
2. Read `documentation/workflow.md`
3. Review `documentation/assumptions.md`

For readers interested in the data:

1. Read `data/data_dictionary.md`
2. Read `documentation/data_sources.md`

For readers interested in the original implementation:

1. Read `documentation/code_walkthrough.md`
2. Explore `original_code/DFA_script.R`

---

## Scientific Context

The Dynamic Factor Analysis represented the exploratory multivariate component of the Master's thesis.

Its objectives were to:

- investigate common temporal recruitment patterns,
- evaluate similarities among European recruitment series,
- provide an empirical basis for grouping recruitment time series into recruitment regions.

The resulting recruitment groupings were subsequently incorporated into the Glass Eel Recruitment Estimation Model (GEREM), where they informed the hierarchical spatial structure of the Bayesian recruitment model.

Together, these analyses formed an integrated framework for understanding large-scale European eel recruitment dynamics.

---

## Research Workflow

The overall analytical framework developed during the Master's thesis can be summarized as:

```text
European recruitment time series
               │
               ▼
      Dynamic Factor Analysis
               │
               ▼
 Identification of common
     recruitment patterns
               │
               ▼
 Support for recruitment
      region definition
               │
               ▼
            GEREM
 (Hierarchical Bayesian Model)
               │
               ▼
 Environmental Correlation
         Analyses
```

This repository documents the **first step** of that analytical framework.

---

## Repository Philosophy

This repository is intended as a documented research archive.

Its objective is to preserve:

- original datasets,
- original analysis scripts,
- methodological documentation,
- figures,
- scientific context.

The original implementation has been preserved without modification and supplemented with modern documentation to improve transparency, understanding, and long-term accessibility.

The repository should therefore be viewed as a historical research implementation rather than a maintained software package.

---

## Associated Research Outputs

This repository accompanies a Master's research project and subsequent scientific publications investigating European eel recruitment dynamics.

The archived materials provide the methodological foundation for the analyses presented in the thesis and associated peer-reviewed publications.

---

## Citation

If using material from this repository, please cite the associated thesis and peer-reviewed publications where appropriate.