# Microglia Cold Stress Project

This repository contains analysis workflows, scripts, and processed outputs for the microglia morphology cold stress project done by Alexandra Lawson. It includes analyses performed using the Ciernia Lab and Morphoglia pipelines, along with live-cell analysis files and supporting statistical workflows.

---

## Repository Structure

    Microglia-Cold-Stress-Project/
    ├── CierniaLab/
    │   ├── LiveCellFrames/
    │   └── StaticAnalysis/
    ├── LiveCell/
    ├── Morphoglia/
    │   ├── Dataframes/
    │   ├── FeatureSelection/
    │   ├── Statistical Analysis/
    │   └── WorkingScripts/
    └── Protocol/
        └── Static Microglial Morphology/
            └── Scripts/
---

## Repository Overview

This repository is organized into three main analysis sections:

- [CierniaLab](./CierniaLab/)
- [Morphoglia](./Morphoglia/)
- [LiveCell](./LiveCell/)

---

## CierniaLab

The [CierniaLab](./CierniaLab/) directory contains all data analyses performed using the Ciernia Lab pipeline.

This includes both unedited working files and finalized analysis workflows used to generate the statistics reported in the paper.

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

### [LiveCellFrames](./CierniaLab/LiveCellFrames)

Contains the final data frames and processing files for live-cell frames analyzed using the Ciernia Lab protocol.
- [DataFrames](./CierniaLab/LiveCellFrames/DataFrames) contains the final output dataframes.
- [ProcessingScripts](./CierniaLab/LiveCellFrames/ProcessingScripts) contains the R. processing scripts used to cluster the microglial cells, including intermediate steps. Same process was used as in the static analysis. See [FinalStatsAnalysis](./CierniaLab/StaticAnalysis/FinalStatsAnalysis) for cleaned process. 

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

## LiveCell

The [LiveCell](./LiveCell/) directory contains the data and analysis files associated with the live-cell imaging component of the project.

---

## Notes

This repository contains both finalized and intermediate analysis materials.

- **Final** folders contain cleaned scripts and outputs intended for reproducible analysis.
- **Working** folders contain exploratory code, intermediate outputs, and development versions.
- Raw or unedited files are retained where relevant for transparency and record-keeping.
