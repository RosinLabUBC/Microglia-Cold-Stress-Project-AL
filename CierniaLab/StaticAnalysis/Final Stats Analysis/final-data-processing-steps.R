#LOADING LIBRARIES AND SETTING WD
#clean
library(MicrogliaMorphologyR)
library(factoextra)
library(ppclust)
library(dplyr)
library(ggsignif)
library(ggrepel)
set.seed(1234)

#reading in the data 
raw_data01 <- read.csv("YOUR-FILE", stringsAsFactors = FALSE)
raw_data01_log <- transform_log(raw_data01,1, start=8, end=34) 
pca_data01_log <- pcadata(raw_data01_log, featurestart=8, featureend=34,
                          pc.start=1, pc.end=10)
pca_data01_log_transformed <- transform_scale(pca_data01_log, start=1, end=3) # scale pca data as input for k-means clustering
kmeans_input01_log <- pca_data01_log_transformed[1:3]
data_kmeans03_log <- kmeans(kmeans_input01_log, centers=3)
pca_kmeans03_log <- cbind(pca_data01_log[1:3], raw_data01, as.data.frame(data_kmeans03_log$cluster)) %>%
  rename(Cluster=`data_kmeans03_log$cluster`) 
clusterfeatures(pca_kmeans03_log, featurestart=11, featureend=37)
write.csv(pca_data01_log, "PATH-to-SAVE-FILE", row.names = FALSE)
cp_log_3 <- clusterpercentage(pca_kmeans03_log, "Cluster", Treatment, Sex, BrainRegion, MouseID)
plot <- clusterplots(pca_kmeans03_log, "PC1", "PC2")

#NAME CLUSTERS
cp_log_3 <- cp_log_3 %>% mutate(Cluster = 
                                  case_when(Cluster=="1" ~ "CLUSTER NAME",
                                            Cluster=="2" ~ "CLUSTER NAME",
                                            Cluster=="3" ~ "CLUSTER NAME"))