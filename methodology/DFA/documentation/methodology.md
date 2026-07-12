# Dynamic Factor Analysis Methodology

## Purpose

This document describes the methodological framework used to investigate common temporal trends in European glass eel recruitment using Dynamic Factor Analysis (DFA).

The analysis was conducted using the **MARSS** package in R and formed one component of a broader analytical framework investigating large-scale recruitment dynamics of the European eel (*Anguilla anguilla*).

The primary objective was to determine whether recruitment time series collected across Europe shared common temporal trends and whether these trends could be used to identify coherent recruitment regions.

---

# Why Dynamic Factor Analysis?

Recruitment monitoring programs across Europe differ substantially in:

- geographic location,
- monitoring method,
- sampling intensity,
- temporal coverage,
- observation units.

Despite these differences, many recruitment series may respond to common large-scale ecological or climatic processes.

Dynamic Factor Analysis is specifically designed to identify common underlying temporal trends shared among multiple time series while accounting for observation error and missing values.

Rather than analysing each recruitment series independently, DFA extracts a small number of latent trends that explain the dominant patterns of temporal variability across the entire monitoring network.

---

# Research Question

The central question addressed by the DFA was:

> **Do European glass eel recruitment time series exhibit common temporal dynamics that can be interpreted as large-scale recruitment patterns?**

Answering this question was an important step toward evaluating biologically meaningful recruitment regions for subsequent modelling with GEREM.

---

# Data Preparation

The archived implementation performs several preprocessing steps prior to model fitting.

## Log Transformation

Recruitment observations are transformed using:

```r
log(data + 1)
```

Recruitment indices are typically right-skewed and approximately log-normally distributed.

The logarithmic transformation reduces skewness, stabilizes variance, and decreases the influence of exceptionally large recruitment events.

Adding one before transformation ensures that zero observations can be included.

---

## Selection of Recruitment Series

Only recruitment series considered sufficiently reliable for analysis were retained.

The selection was performed manually in the archived implementation and reflects the dataset used in the Master's thesis.

---

## Handling Missing Values

The dataset contains incomplete time series.

Rather than removing partially observed recruitment series, missing observations were retained as `NA`.

The MARSS package accommodates missing observations during model fitting, allowing all available information to contribute to estimation.

---

## Mean-Centering

Each recruitment series was centered by subtracting its mean:

```r
recruit <- data - y.bar
```

Mean-centering removes differences in average recruitment magnitude among monitoring sites and allows the analysis to focus on temporal variability rather than absolute recruitment levels.

---

## Matrix Orientation

Prior to fitting the model, the data matrix is transposed so that:

- rows represent recruitment series,
- columns represent years.

This is the format required by the MARSS implementation of Dynamic Factor Analysis.

---

# Statistical Framework

Dynamic Factor Analysis assumes that the observed recruitment time series can be described by a small number of unobserved (latent) temporal trends.

Each recruitment series is represented as a weighted combination of these common trends plus observation error.

Conceptually, the model can be represented as:

```text
Common Trend 1
        │
Common Trend 2
        │
Common Trend 3
        │
Common Trend 4
        │
   Factor Loadings
        │
Observed Recruitment Series
```

The factor loadings describe how strongly each recruitment series is associated with each latent trend.

Recruitment series exhibiting similar temporal behaviour tend to share similar factor loadings.

---

# Model Fitting

The analysis was performed using the **MARSS** package.

Candidate models containing between one and four latent trends were fitted.

```r
m = 1
m = 2
m = 3
m = 4
```

All candidate models assumed:

- unequal mean recruitment among series (`A = "unequal"`),
- diagonal and unequal observation error covariance (`R = "diagonal and unequal"`).

Model fitting was performed using maximum likelihood estimation.

---

# Model Selection

Candidate models were compared using the corrected Akaike Information Criterion (AICc).

AICc balances:

- model goodness-of-fit,
- model complexity.

The preferred model is the one with the lowest AICc value.

Comparing multiple candidate models allowed the number of common recruitment trends to be determined objectively rather than selected a priori.

---

# Interpretation of Results

The latent trends extracted by the DFA summarize the dominant temporal patterns shared among European recruitment series.

The corresponding factor loadings indicate which monitoring locations are associated with each trend.

Together, these outputs provide insight into the spatial organization of recruitment dynamics across Europe.

Rather than interpreting individual recruitment series independently, DFA identifies large-scale patterns common to multiple monitoring programs.

---

# Relationship to GEREM

The DFA constituted an exploratory component of the overall research framework.

Its primary purpose was to evaluate whether recruitment time series could be grouped according to shared temporal dynamics.

The recruitment groupings identified through DFA subsequently informed the regional structure adopted in the Glass Eel Recruitment Estimation Model (GEREM).

In this way, DFA provided an empirical basis for one of GEREM's key assumptions: that recruitment series grouped within the same region share a common underlying temporal signal.

---

# Limitations

Several considerations should be kept in mind when interpreting the results.

- Recruitment indices originate from different monitoring methods.
- Time series differ in length and completeness.
- Missing observations are common.
- Latent trends describe statistical patterns and do not directly identify causal mechanisms.

Consequently, ecological interpretation of the extracted trends requires additional analyses.

---

# Role Within the Thesis

Dynamic Factor Analysis represented the first quantitative step in the overall analytical framework developed during the Master's thesis.

The workflow can be summarized as:

```text
European recruitment time series
              ↓
Dynamic Factor Analysis
              ↓
Identification of common recruitment patterns
              ↓
Definition of recruitment regions
              ↓
GEREM hierarchical Bayesian model
              ↓
Environmental correlation analyses
```

This sequence allowed exploratory multivariate analysis, hierarchical Bayesian modelling, and environmental interpretation to be integrated into a coherent assessment of European eel recruitment dynamics.