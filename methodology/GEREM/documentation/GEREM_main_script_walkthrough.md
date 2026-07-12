# GEREM Main Script Walkthrough

## Purpose

This document explains the structure and logic of `GEREM_main_script.R`.

The script is the historical R implementation used to prepare input data, construct the GEREM model data object, run the JAGS model, check convergence, and save the fitted workspace.

The original R script has been preserved for archival purposes. This walkthrough documents the script without modifying the code.

---

# Script Overview

`GEREM_main_script.R` performs the following major tasks:

1. Clears the R workspace and loads input files.
2. Reshapes and merges recruitment datasets.
3. Applies manual updates and unit conversions.
4. Builds the catchment surface matrix used for spatial extrapolation.
5. Classifies recruitment series by observation type.
6. Constructs basin and zone index mappings.
7. Builds the JAGS data object.
8. Generates initial values for MCMC chains.
9. Runs the GEREM JAGS model using `runjags`.
10. Computes convergence diagnostics.
11. Saves the full R workspace to `jags2_1.Rdata`.

---

# 1. Workspace Initialization and File Loading

The script begins by clearing the R environment:

```r
rm(list=ls())
```

It then sets the working directory:

```r
setwd("~/version_jags/version_2.1/essai7fit")
```

This path reflects the original local working environment. It would need to be adapted if the code were rerun elsewhere.

The script loads the main metadata files:

```r
bv=read.table("bv2.csv",header=TRUE,sep=",")
zone=read.table("zones2.csv",header=TRUE,sep=";")
```

These files define:

- recruitment series metadata,
- observation type,
- river basin assignment,
- recruitment zone assignment,
- surface area,
- discharge.

---

# 2. European Recruitment Data Import and Reshaping

The European recruitment series are loaded from:

```r
data_1=read.table("european_serie2.csv",header=TRUE,sep=";")
```

The original dataset is in long format, with one row per observation.

The script reshapes it into wide format:

```r
data_1_wide=reshape(
  data_1[,1:3],
  direction="wide",
  v.names="dat_value",
  timevar="loc_name",
  idvar="dat_year"
)
```

After reshaping:

- rows correspond to years,
- columns correspond to recruitment series,
- cells contain observed recruitment values.

Column names are then simplified:

```r
names(data_1_wide)=sub("dat_value.","",names(data_1_wide))
```

The dataset is sorted by year:

```r
data_1_wide=data_1_wide[order(data_1_wide$dat_year),]
```

---

# 3. French and Absolute Recruitment Series

Additional recruitment series are loaded from:

```r
french_serie=read.table("french_serie2.csv",header=TRUE,sep="\t")
```

This file includes absolute recruitment estimates used to anchor the scale of the model.

---

# 4. Manual Update of Oria Recruitment Values

The script manually updates values for the `Oria` series:

```r
french_serie[which(french_serie$dat_year==2004),"Oria"]=814
french_serie[which(french_serie$dat_year==2005),"Oria"]=1261
...
french_serie[which(french_serie$dat_year==2014),"Oria"]=1593
```

These values are expressed in kilograms.

This is a historical correction embedded directly in the original script.

One year, 2009, is commented out:

```r
#french_serie[which(french_serie$dat_year==2009),"Oria"]
```

This suggests that the value for 2009 was checked or considered but not manually replaced in this version.

---

# 5. Merge European and French Series

The French/absolute series are merged with the reshaped European recruitment series:

```r
data_1_wide=merge(
  french_serie,
  data_1_wide,
  by.x="dat_year",
  by.y="dat_year",
  all=TRUE
)
```

The resulting object, `data_1_wide`, contains all recruitment series used by GEREM, aligned by year.

---

# 6. Catchment Reference Data and Spatial Extrapolation Matrix

The script loads the catchment reference dataset:

```r
surfaceallbv=read.table("ccm_bv2.csv",header=TRUE,sep=";")
```

It filters the dataset to retain catchments with:

- a non-empty zone,
- positive catchment area.

```r
surfaceallbv=surfaceallbv[
  surfaceallbv$zone!="" & surfaceallbv$area_km2>0,
]
```

The script then builds a matrix of catchment areas by recruitment zone.

This matrix is later passed to JAGS as:

```r
surfaceallbv
```

In the JAGS model, this object is used to calculate the denominator of basin recruitment weights within each zone.

This is important because recruitment allocation is based on all catchments in a zone, not only monitored catchments.

---

# 7. Unit Conversion and Series Harmonization

A large section of the script converts recruitment series to consistent numerical units.

Examples include:

```r
data_1_wide[,"Vilaine Arzal trapping all"] =
  as.numeric(paste(data_1_wide[,"Vilaine Arzal trapping all"])) * 1000
```

```r
data_1_wide$Vaccares =
  (data_1_wide$Vaccares * 0.3) / 1000
```

```r
data_1_wide[,"Bresle trapping all"] =
  (as.numeric(paste(data_1_wide[,"Bresle trapping all"])) * 0.3) / 1000
```

These operations perform tasks such as:

- converting tonnes to kilograms,
- converting grams to kilograms,
- applying efficiency or conversion factors,
- coercing character/factor columns to numeric values.

This section is essential because GEREM combines series originating from different monitoring systems and measurement units.

---

# 8. Conversion of Relative and Scientific Series to Numeric Format

The script also converts commercial catch, CPUE, and scientific survey series to numeric values.

Examples include:

```r
data_1_wide[,"Tiber commercial catch"] =
  as.numeric(paste(data_1_wide[,"Tiber commercial catch"])) * 1000
```

```r
data_1_wide[,"Adour Estuary (CPUE) commercial CPUE"] =
  as.numeric(paste(data_1_wide[,"Adour Estuary (CPUE) commercial CPUE"]))
```

```r
data_1_wide[,"IYFS1 scientific estimate"] =
  as.numeric(paste(data_1_wide[,"IYFS1 scientific estimate"]))
```

The repeated pattern:

```r
as.numeric(paste(...))
```

likely reflects the original need to convert factor-like columns into numeric values safely in older versions of R.

---

# 9. Row Names and Optional Series Exclusion

Years are assigned as row names:

```r
row.names(data_1_wide)=data_1_wide$dat_year
```

The script includes commented-out lines for excluding problematic series:

```r
#data_1_wide=data_1_wide[,!names(data_1_wide) %in% c("IYFS2 scientific estimate","Tiber commercial catch","River Maigue")]
```

and:

```r
#bv=bv[!bv$index%in%c("IYFS2 scientific estimate","Tiber commercial catch","River Maigue"),]
```

These lines are not active in the archived version but indicate that sensitivity tests or alternative model versions may have excluded specific time series.

---

# 10. Metadata Consistency Checks

The script runs two matching checks:

```r
match(names(data_1_wide),bv$index)
match(bv$zone,zone$zone)
```

These commands check whether:

- time-series column names correspond to entries in `bv2.csv`,
- recruitment zones in `bv2.csv` correspond to entries in `zones2.csv`.

The outputs are not explicitly stored or tested, but these lines likely served as interactive checks during model development.

---

# 11. Temporal Filtering

The dataset is restricted to years from 1960 onward:

```r
data_1_wide=data_1_wide[data_1_wide$dat_year>=1960,]
```

This defines the temporal scope of the GEREM model fit in this implementation.

---

# 12. Package Loading

The script loads:

```r
library(parallel)
library(coda)
```

Later, it loads:

```r
library(runjags)
```

The packages are used for:

- parallel model execution,
- MCMC diagnostics,
- running JAGS from R.

---

# 13. Choice of Spatial Scaling Method

The script defines:

```r
method="surface"
```

with an alternative option commented out:

```r
#method="debit"
```

This means that basin allocation is based on catchment surface area in this version.

The alternative would have used discharge.

---

# 14. Observation Classification

The script classifies recruitment series according to the `type` field in `bv2.csv`.

```r
comptage=subset(data_1_wide,select=as.character(unique(bv$index[bv$type=="absolute"])))
serie=subset(data_1_wide,select=as.character(unique(bv$index[bv$type=="relative"])))
piege=subset(data_1_wide,select=as.character(unique(bv$index[bv$type=="trap"])))
expert=subset(data_1_wide,select=as.character(unique(bv$index[bv$type=="expertise"])))
```

The four observation categories are:

| Object | Observation type | Meaning |
|---|---|---|
| `comptage` | absolute | Absolute recruitment estimates |
| `serie` | relative | Relative recruitment indices |
| `piege` | trap | Trap-based series |
| `expert` | expertise | Expert-derived estimates |

---

# 15. Standardization and Log-Transformation

Relative series are standardized by dividing each series by its mean:

```r
serie=sweep(serie,2, colMeans(serie,na.rm=TRUE),"/")
```

The standardized relative series are then log-transformed:

```r
logIAObs=log(serie)
```

Other observation types are also log-transformed:

```r
logUObs=log(comptage)
logIPObs=log(piege)
logIEObs=log(expert)
```

The resulting objects are passed to JAGS as observation matrices.

---

# 16. Observation Counts

The script records the number of series in each observation category:

```r
nbsurvey=ncol(serie)
nbcomptage=ncol(comptage)
nbpiege=ncol(piege)
nbexpert=ncol(expert)
```

These values define loop dimensions in the JAGS model.

---

# 17. Basin and Zone Structure

The script extracts unique river basins:

```r
bv2=unique(bv[,c("bv","surface","zone","debit")])
```

It then records:

```r
nbbv=nrow(bv2)
```

The basin-level spatial variable is selected based on the chosen method:

```r
surface=bv2$debit
if(method=="surface") surface=bv2$surface
```

Since `method="surface"`, basin surface area is used.

Zone identifiers are converted into numeric indices:

```r
zonebv=match(bv2$zone,zone$zone)
```

Zone-level surface or discharge values are similarly selected:

```r
surfaceZone=zone$debit
if(method=="surface") surfaceZone=zone$area_km2
```

---

# 18. Mapping Observations to River Basins

The script creates index vectors linking each observation series to its corresponding basin.

```r
bvsurvey=match(bv$bv[match(names(serie),bv$index)],bv2$bv)
bvcomptage=match(bv$bv[match(names(comptage),bv$index)],bv2$bv)
bvpiege=match(bv$bv[match(names(piege),bv$index)],bv2$bv)
bvexpert=match(bv$bv[match(names(expert),bv$index)],bv2$bv)
```

These mappings allow the JAGS model to connect each observation series to the correct latent basin recruitment estimate.

---

# 19. Initial Recruitment and Regional Proportions

The script computes an initial rough estimate of global recruitment:

```r
mulogRglobal1 =
  log(sum(colMeans(comptage,na.rm=TRUE))) +
  log(sum(surfaceZone)/sum(surface[bvcomptage]))
```

This object is computed but not passed directly in the final `mydata` list.

The script also defines equal initial regional recruitment proportions:

```r
initpropR=rep(1/nbzone,nbzone)
```

These are passed to JAGS and used to initialize the Dirichlet distribution for regional recruitment proportions.

---

# 20. Construction of the JAGS Data Object

The script constructs the list passed to JAGS:

```r
mydata=list(
  initpropR=initpropR,
  nbzone=nbzone,
  nbsurvey=nbsurvey,
  nbpiege=nbpiege,
  nbbv=nbbv,
  nbcomptage=nbcomptage,
  nbexpert=nbexpert,
  bvsurvey=bvsurvey,
  bvpiege=bvpiege,
  bvcomptage=bvcomptage,
  bvexpert=bvexpert,
  zonebv=zonebv,
  surface=surface,
  nbyear=nbyear,
  logIAObs=as.matrix(logIAObs),
  logIPObs=as.matrix(logIPObs),
  logUObs=as.matrix(logUObs),
  logIEObs=as.matrix(logIEObs),
  surfaceallbv=surfaceallbv
)
```

This object contains:

- model dimensions,
- observation matrices,
- basin mappings,
- zone mappings,
- spatial information.

It is the main bridge between the R preprocessing code and the JAGS model.

---

# 21. MCMC Initial Value Generator

The function:

```r
generate_init=function(){ ... }
```

creates randomized initial values for each MCMC chain.

It initializes:

- missing observation values,
- regional recruitment proportions,
- precision parameters,
- process error terms,
- basin error terms,
- catchability parameters,
- trap efficiency parameters,
- expert calibration parameters,
- initial recruitment,
- basin scaling parameter β.

The function is passed to `run.jags()` through:

```r
inits=generate_init
```

This ensures that each MCMC chain starts from different initial values.

---

# 22. Missing Observation Initialization

Inside `generate_init()`, missing values in observation matrices are initialized with random values.

For example:

```r
logIAObs=apply(mydata$logIAObs,2,function(x){
  d=which(!is.na(x))
  x[which(is.na(x))]=runif(length(which(is.na(x))),min(x,na.rm = TRUE)*2,max(x,na.rm = TRUE)*2)
  x[d]=NA
  x
})
```

Observed values are set back to `NA`, while missing values receive randomized initial values.

This provides starting values for missing observations treated within the JAGS model.

---

# 23. MCMC Parameter Initialization

The function initializes precision parameters such as:

```r
tauIA
tauIP
tauU
tauIE
tauRwalk
```

It also initializes model parameters such as:

```r
beta
logR1
logq
loga
logp
propR
```

These correspond to:

- basin scaling,
- initial recruitment,
- catchability,
- trap efficiency,
- expert calibration,
- regional recruitment proportions.

---

# 24. Running the JAGS Model

The JAGS model is run using:

```r
jags_res=run.jags(
  "versionBugs2_1.txt",
  monitor=c("beta","tauIA","tauU","tauIP","tauIE",
            "logq","loga","logp","logRglobal",
            "Rbv","Rzone","propR"),
  data=mydata,
  n.chains=3,
  inits=generate_init,
  burnin=40000,
  sample=40000,
  method="parallel",
  thin=1,
  tempdir=FALSE,
  summarise=FALSE,
  adapt=50000,
  keep.jags.files=TRUE
)
```

The model specification is stored in:

```text
versionBugs2_1.txt
```

The monitored parameters include:

- `beta`
- observation precision parameters
- catchability and efficiency parameters
- European recruitment
- basin recruitment
- regional recruitment
- regional recruitment proportions

---

# 25. Error Handling

The model fitting call is wrapped in:

```r
tryCatch(..., err=function(err) {print(err); failed.jags()})
```

If the model fails, the error is printed and `failed.jags()` is called.

This can help recover or inspect failed JAGS runs.

---

# 26. Convergence Diagnostics

After fitting the model, the script computes Gelman-Rubin diagnostics:

```r
gelman.diag(jags_res)
```

These diagnostics are used to assess convergence across MCMC chains.

The result is printed but not explicitly saved as a separate object in the script.

---

# 27. Timing

The script records start and end time:

```r
debut=Sys.time()
fin=Sys.time()
```

These objects are saved in the final workspace and can be used to estimate runtime.

---

# 28. Saving the Workspace

Finally, the script saves the complete R workspace:

```r
save.image("jags2_1.Rdata")
```

This file may contain:

- input data objects,
- transformed datasets,
- JAGS data list,
- fitted model object,
- timing information,
- intermediate objects created during preprocessing.

The main fitted model object is:

```r
jags_res
```

---

# Key Objects Created by the Script

| Object | Description |
|---|---|
| `bv` | Metadata linking series to basins, zones, and observation types |
| `zone` | Recruitment zone metadata |
| `data_1` | European recruitment observations in long format |
| `data_1_wide` | Combined recruitment dataset in wide format |
| `french_serie` | Absolute recruitment series |
| `surfaceallbv` | Catchment-area matrix used for spatial allocation |
| `comptage` | Absolute recruitment observations |
| `serie` | Relative recruitment observations |
| `piege` | Trap-based observations |
| `expert` | Expert-derived observations |
| `logIAObs` | Log-transformed relative observations |
| `logUObs` | Log-transformed absolute observations |
| `logIPObs` | Log-transformed trap observations |
| `logIEObs` | Log-transformed expert observations |
| `bv2` | Unique basin metadata |
| `mydata` | Data list passed to JAGS |
| `generate_init` | Function generating MCMC initial values |
| `jags_res` | Fitted JAGS model object |
| `debut` | Model run start time |
| `fin` | Model run end time |

---

# Notes on Historical Implementation

This script reflects the original research workflow.

Several features are characteristic of a historical research script:

- hard-coded working directory,
- manual data corrections,
- column-specific unit conversions,
- commented-out alternative model versions,
- interactive consistency checks,
- full workspace saving.

These elements have been preserved to maintain the integrity of the archived implementation.

For interpretation of the model itself, see:

- `model/model_overview.md`
- `documentation/model_structure.md`
- `documentation/assumptions.md`