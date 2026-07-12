# GEREM

**Glass Eel Recruitment Estimation Model**

A hierarchical Bayesian framework developed to estimate European eel (*Anguilla anguilla*) recruitment at European, regional, and river basin scales from heterogeneous monitoring data.

---

## Background

The European eel is generally considered a panmictic population, meaning that individuals across Europe belong to a single reproductive stock.

Despite this stock-wide biological structure, recruitment monitoring has historically been conducted at local, regional, or national scales using a variety of methods, including commercial catches, trapping systems, scientific surveys, and expert assessments.

As a result, recruitment information exists across Europe but remains fragmented among regions, river basins, and monitoring programs.

GEREM was developed to reconcile the stock-wide nature of the European eel population with the fragmented structure of European monitoring efforts.

---

## Research Question

How can recruitment be estimated consistently at the scale of the entire European stock when observations:

- originate from multiple countries,
- use different monitoring methods,
- cover different time periods,
- and measure recruitment in different ways?

GEREM addresses this challenge through a hierarchical Bayesian data-fusion framework.

---

## Model Structure

GEREM estimates recruitment at three nested spatial scales:

```text
European Recruitment
        ↓
Regional Recruitment
        ↓
River Basin Recruitment
        ↓
Observed Monitoring Data
```

The model integrates:

- Commercial catches
- Commercial CPUE series
- Scientific surveys
- Trapping systems
- Absolute recruitment estimates
- Expert-derived estimates

within a common statistical framework.

---

## Repository Structure

```text
GEREM/
│
├── data/
├── model/
├── documentation/
├── original_code/
├── outputs/
└── README.md
```

### Data

Input datasets and metadata used by the model.

See:

- `data/data_dictionary.md`

### Model

Model specification and conceptual overview.

See:

- `model/model_overview.md`

### Documentation

Detailed descriptions of:

- Workflow
- Assumptions
- Model structure
- Data sources
- Reproducibility considerations

### Original Code

Historical implementation of GEREM used during the research project.

The original code has been preserved without modification.

### Outputs

Model outputs, figures, and derived products.

---

## Documentation Guide

For readers interested in understanding the model:

1. Start with `model/model_overview.md`
2. Read `documentation/model_structure.md`
3. Review `documentation/workflow.md`

For readers interested in the data:

1. Read `data/data_dictionary.md`
2. Read `documentation/data_sources.md`

For readers interested in reproducibility:

1. Read `documentation/reproducibility_notes.md`

---

## Scientific Context

GEREM was developed as part of a Master's research project investigating European eel recruitment dynamics.

The model constituted one component of a broader analytical framework that also included:

- Dynamic Factor Analysis (DFA)
- Environmental correlation analyses

Together, these analyses were used to investigate recruitment trends, spatial structure, and potential environmental drivers of recruitment variability.

---

## Repository Philosophy

This repository is intended as a documented research archive.

The objective is to preserve:

- Original datasets
- Original model implementation
- Methodological documentation
- Scientific context

while making the project understandable and accessible to future researchers, collaborators, and readers.

The repository should be viewed as a historical research implementation rather than a maintained software package.

---

## Associated Research Outputs

This repository accompanies a Master's research project and subsequent scientific publications related to European eel recruitment dynamics.

The archived materials provide the methodological foundation for the analyses presented in the thesis and associated peer-reviewed publications.

---

## Citation

If using material from this repository, please cite the associated thesis and peer-reviewed publications where appropriate.