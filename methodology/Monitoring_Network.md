# European Monitoring Network

## Purpose

This document provides an overview of the European glass eel (*Anguilla anguilla*) recruitment monitoring network used throughout this research project.

The monitoring network forms the common foundation of analytical components of the Master's thesis:

- Dynamic Factor Analysis (DFA)
- Glass Eel Recruitment Estimation Model (GEREM)
- Environmental Correlation Analysis

Although each component uses the monitoring data differently, they all rely on the same network of long-term recruitment monitoring programs distributed across Europe.

---

# Monitoring Network Overview

The archived implementation contains **41 recruitment indices** originating from multiple European monitoring programs.

These observations differ in:

- monitoring methodology,
- spatial coverage,
- observation units,
- temporal coverage,
- data completeness.

GEREM explicitly accommodates these heterogeneous observation types by linking them to a common latent recruitment process at the river basin level.

---

# Observation Types

The monitoring network contains four observation types.

| Observation type | Number of indices | Description |
|------------------|------------------:|-------------|
| Relative | 21 | Relative recruitment indices (commercial catches, CPUE, scientific surveys) |
| Trap | 11 | Trap-based recruitment observations |
| Absolute | 8 | Absolute recruitment estimates |
| Expertise | 1 | Expert-derived recruitment estimate |

---

# Recruitment Zones

The recruitment network is divided into six geographic zones.

| Zone code | Region |
|-----------|--------|
| NS | North Sea |
| BI | British Isles |
| Manche | English Channel |
| ATL_F | French Atlantic |
| ATL_IB | Iberian Atlantic |
| Med | Mediterranean |

These recruitment zones constitute the regional structure adopted by GEREM.

---

# Monitoring Stations

| Recruitment Series | River Basin | Zone | Observation Type | Surface (km²) | Discharge | Used in DFA | Used in GEREM | Notes |
|--------------------|-------------|------|------------------|--------------:|----------:|:-----------:|:-------------:|------|
| Adour Estuary commercial catch | Adour | ATL_F | Relative | 16,860.0 | 166.2 | ✓ | ✓ | DFA name: `Adour` |
| Adour Estuary (CPUE) commercial CPUE | Adour | ATL_F | Relative | 16,860.0 | 166.2 | ✓ | ✓ | DFA name: `AdourCP` |
| AdGERMA | Adour | ATL_F | Absolute | 16,860.0 | 166.2 | ✗ | ✓ | Absolute recruitment estimate |
| Albufera de Valencia commercial catch | Albufera lagoon | Med | Relative | 917.0 | 3.0 | ✓ | ✓ | DFA name: `Albuferalagoon` |
| Bann trapping partial | Bann | BI | Trap | 4,450.0 | 100.0 | ✓ | ✓ | DFA name: `Bann` |
| Bresle trapping all | Bresle | Manche | Trap | 743.0 | 7.5 | ✓ | ✓ | DFA name: `Bresle` |
| ChGEMAC | Charente | ATL_F | Absolute | 9,526.0 | 76.17 | ✗ | ✓ | Absolute recruitment estimate |
| Ebro commercial catch | Ebro | Med | Relative | 85,924.0 | 425.0 | ✓ | ✓ | DFA name: `Ebrodeltalagoons` |
| Ems commercial catch | Ems | NS | Relative | 12,185.1 | 80.0 | ✓ | ✓ | DFA name: `Ems` |
| Erne trapping all | Erne | BI | Trap | 4,000.0 | 100.0 | ✓ | ✓ | DFA name: `Erne` |
| Fremur trapping all | Fremur | NS | Trap | 60.0 | 0.17 | ✓ | ✓ | DFA name: `Fremur` |
| GiGEMAC | Gironde | ATL_F | Absolute | 79,605.0 | 515.247 | ✗ | ✓ | Absolute recruitment estimate |
| Gironde Estuary commercial catch | Gironde | ATL_F | Relative | 79,605.0 | 515.2 | ✓ | ✓ | DFA name: `Gironde` |
| Ijzer Nieuwpoort scientific estimate | Ijzer | Manche | Relative | 1,101.0 | 5.5 | ✓ | ✓ | DFA name: `Ijzer` |
| Imsa Near Sandnes trapping all | Imsa | NS | Trap | 128.0 | 5.4 | ✓ | ✓ | DFA name: `Imsa` |
| IYFS1 scientific estimate | North Sea | NS | Relative | 2,133,000.0 | — | ✓ | ✓ | DFA name: `IYFS/IBTS 1` |
| IYFS2 scientific estimate | North Sea | NS | Relative | 2,133,000.0 | — | ✓ | ✓ | DFA name: `IYFS/IBTS 2` |
| Katwijk scientific estimate | Rhine | NS | Relative | 170,000.0 | 1,187.0 | ✓ | ✓ | DFA name: `Katwijk` |
| Lauwersoog scientific estimate | Rhine | NS | Relative | 170,000.0 | 1,187.0 | ✓ | ✓ | DFA name: `Lauwersoog` |
| LoGERMA | Loire | ATL_F | Absolute | 116,981.0 | 561.0 | ✗ | ✓ | Absolute recruitment estimate |
| Loire commercial catch | Loire | ATL_F | Relative | 116,981.0 | 561.0 | ✓ | ✓ | DFA name: `Loire` |
| Minho commercial catch | Minho | ATL_IB | Relative | 17,080.0 | 305.0 | ✓ | ✓ | DFA name: `Minho total` |
| Nalon commercial catch | Nalon | ATL_IB | Relative | 4,866.0 | 109.0 | ✓ | ✓ | DFA name: `Nalon` |
| Oria | Oria | ATL_IB | Absolute | 863.4 | 15.0 | ✗ | ✓ | Manually updated in GEREM |
| Rhine DenOever scientific estimate | Rhine | NS | Relative | 170,000.0 | 1,187.0 | ✓ | ✓ | DFA name: `Rhine` |
| Ringhals scientific survey | Swedish west coast | NS | Relative | 2,133,000.0 | — | ✓ | ✓ | DFA name: `Rhingals` |
| River Feale | Feale | BI | Trap | 1,153.0 | 21.0 | ✓ | ✓ | DFA name: `Feale` |
| River Inagh | Inagh | BI | Trap | 4,550.0 | 1.0 | ✓ | ✓ | DFA name: `Inagh` |
| River Maigue | Maigue | BI | Trap | 1,075.0 | — | ✓ | ✓ | DFA name: `Maigne` |
| SeGEMAC | Seudre | ATL_F | Absolute | 754.6 | 7.89 | ✗ | ✓ | Absolute recruitment estimate |
| Severn commercial catch | Severn | BI | Relative | 11,381.0 | 61.0 | ✓ | ✓ | DFA name: `Severn` |
| Sevre Niortaise Estuary commercial CPUE | Sèvre Niortaise | ATL_F | Relative | 3,650.0 | 44.4 | ✓ | ✓ | DFA name: `SevresNiortaise` |
| Shannon trapping all | Shannon | BI | Trap | 11,700.0 | 176.0 | ✓ | ✓ | DFA name: `Shannon` |
| Somme | Somme | Manche | Expertise | 6,223.4 | 33.25 | ✓ | ✓ | DFA name: `Somme` |
| Stellendam scientific estimate | Rhine | NS | Relative | 170,000.0 | 1,187.0 | ✓ | ✓ | DFA name: `Stellendam` |
| Tiber | Tiber | Med | Absolute | 17,861.0 | 125.37 | ✗ | ✓ | Absolute recruitment estimate |
| Tiber commercial catch | Tiber | Med | Relative | 17,861.0 | 125.37 | ✓ | ✓ | DFA name: `Tiber` |
| Vaccares | Vaccarès | Med | Trap | 456.0 | 3.3 | ✗ | ✓ | Trap series |
| Vida commercial catch | Vida | NS | Relative | 1,386.7 | 18.0 | ✓ | ✓ | DFA name: `Vidaa` |
| Vilaine Arzal trapping all | Vilaine | ATL_F | Absolute | 10,490.0 | 68.6 | ✓ | ✓ | DFA name: `Vilaine` |
| Viskan Sluices trapping all | Viskan | NS | Trap | 2,202.0 | 43.28 | ✓ | ✓ | DFA name: `Viskan` |

---

# Relationship to the Thesis

The monitoring network documented here was used throughout the Master's thesis.

## Dynamic Factor Analysis (DFA)

A subset of these recruitment series was used to identify common temporal recruitment patterns and evaluate similarities among monitoring locations.

## Glass Eel Recruitment Estimation Model (GEREM)

All recruitment indices were integrated within a hierarchical Bayesian framework that estimated recruitment at European, regional, and river basin scales while accounting for differences in observation type.

---

# Notes

This document is based directly on the metadata contained in `bv2.csv`, which defines the recruitment indices used by GEREM.

Additional preprocessing, corrections, and data transformations applied during the analyses are documented within the individual project repositories.