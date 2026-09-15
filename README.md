# Microglia Cold Stress Project

This repository contains analysis workflows, scripts, and processed outputs for the microglia morphology cold stress project done by Alexandra Lawson. It includes analyses performed using the Ciernia Lab and Morphoglia pipelines, along with live-cell analysis files and supporting statistical workflows.

## Repository Overview

This repository is organized into four main analysis sections:

- [CierniaLab](./CierniaLab/)
- [Morphoglia](./Morphoglia/)
- [Protocol](./Protocol/)

---

## CierniaLab

The [CierniaLab](./CierniaLab/) directory contains all data analyses performed using the Ciernia Lab pipeline.

This includes both unedited working files and finalized analysis workflows used to generate the statistics reported in the paper.
### [FunctionalAnalysis](./CierniaLab/FunctionalAnalysis)

Contains the microglia phagocytosis data and the microglia-AVP neuron interaction data. 

### [StaticAnalysis](./CierniaLab/StaticAnalysis)

Contains all files associated with static morphological analysis of the E15.5 hypothalamus and nuclei.

- [DataFrames](./CierniaLab/StaticAnalysis/DataFrames)  
  Final data frames generated from the Ciernia Lab pipeline. `final-dataframe.csv` is the final dataframe output from analysis with first two PCA included and cluster designations. 

- [FinalStatsAnalysis](./CierniaLab/StaticAnalysis/FinalStatsAnalysis)  
  Final cleaned data processing and statistical analysis workflows used for reproducible analysis.

- [WorkingStatsAnalysis](./CierniaLab/StaticAnalysis/WorkingStatsAnalysis)  
  Working statistical analysis files, including intermediate steps and exploratory code outlining process and trials. 

- [AnalysisScripts](./CierniaLab/StaticAnalysis/AnalysisScripts)  
  ImageJ macros used for image processing and analysis (step 1 and 2 from the ciernia lab). 


---

## Morphoglia

The [Morphoglia](./Morphoglia/) directory contains all data analyses performed using the Morphoglia pipeline.

- [Dataframes](./Morphoglia/Dataframes)  
  Contains the final morphology data frame `Morphology.csv` and the final clustering data frame `Morphology_HDBSCAN_30_0.1_150_5`.

- [FeatureSelection](./Morphoglia/FeatureSelection)  
  Contains selected features and correlation matrices generated during random forest feature selection.

- [Statistical Analysis](./Morphoglia/Statistical%20Analysis)  
  Contains the R scripts used for chi-square analysis, as well as scripts testing whether a permutation test would be appropriate for analysis.

- [WorkingScripts](./Morphoglia/WorkingScripts)  
  Contains additional Python scripts used to generate plots and figures.

---
## Protocol

The [Protocol](./Protocol/) directory contains protocol and instructions associated with static and live-cell analysis. This includes an instructional [video](https://www.youtube.com/watch?v=K1yZyGLMJOI) for how we adapted the code originally developed by [Jennifer Kim et al. ](https://pubmed.ncbi.nlm.nih.gov/39029952/).

---

## Notes

This repository contains both finalized and intermediate analysis materials.
