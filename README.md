# Microglia Cold Stress Project
Welcome to **Microglia Morphology Analysis**!

Included you can find Alex Lawson Data Analysis process

**In [CierniaLab](./CierniaLab/) you can find all data analysis from the ciernialab pipeline.**

_This includes both the unedited raw files as well as the final analysis/methods to produce stats used in the paper._

[Static Analysis](./CierniaLab/Static%20Analysis/)
- `final-stats-process.csv` is the final stats process that was used (cleaned for readability and reproducability)
- `final-data-processing-steps.csv` is the final data processing that was used (cleaned for readability and reproducability)
- [Working Analysis](./CierniaLab/Static%20Analysis/Working%20Scripts) contains `analysis01-06`which the process and includes the intitial processing of the data, creation of cluster percentages, as well as intital stats and graphing. You will also find `EditedBinaryConversion.ijm` which is the edited binary conversion script adapted from the Ciernia Lab pipline that was used for threshoding. Additionally, you will find `ManualMicrogliaComparison.ijm` which was the script used in the manual comparison of each microglial cell to the original image.
- The file `ManualMicrogliaComparator` is the script that we used to load and compare real with thresholded images for removal/splitting of cells. A few additions/personalizations to ImageJ can also be helpful for your workflow. We implemented shortcuts examples of which were: r (to open up the roi manager), c (to open up the channels tool). These are not essential but can speed up your workflow. The types of things that may be helpful for you will become apparent as you begin working though your images. Ultimately this program was created to speed my own workflow, but changes might be necessary for your own and to make your workflow the most efficient. 
  
- [DataFrames](./CierniaLab/Static%20Analysis/DataFrames) contains the final dataframes from the Ciernia Lab pipeline

[Live Cell Frames](./CierniaLab/LiveCell)
- [Processing Scripts](./CierniaLab/LiveCell/Processing%20Scripts) contains the R scripts assocaited with the clustering of the live cell static frames
- [Data Frames](./CierniaLab/LiveCell/DataFrames) contains the finak output dataframes from the morphological analysis of the live cell single frame snapshots

**In [Morphoglia](./Morphoglia/) you can find all the data analysis from the morphoglia pipeline.**

Within the [Morphoglia](./Morphoglia/) folder you can find:
- `Morphology.csv` which is the output from the Morphoglia Pipeline for the PVN.
- `Morphology_HDBSCAN_30_0.1_150_5.csv` which is the output from the UMAP and HDBSCAN clustering on all data in the PVN.
- [Feature_Selection](./Morphoglia/Feature_Selection) contains the output from the Random Feature Selection of Morphoglia.
- [Scripts](./Morphoglia/Scripts) contains intermediate helper scripts used to generate figures from the Morphoglia pipeline.


**In [Live Cell](./LiveCell) you can find all the data anlaysis from the live cell analysis.**
Within this folder you can find:
- [Data Frames](./LiveCell/DataFrames) you can find the final data frame from analysis.
- [Processing Scripts](./LiveCell/Processing%20Scripts) you can find all processing scripts associated with the intermediate graphing, data organization, and processing of Imaris outputs from the live cell data analysis. 

