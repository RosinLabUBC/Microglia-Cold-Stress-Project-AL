#LOADING LIBRARIES AND SETTING WD
#clean
library(MicrogliaMorphologyR)
library(factoextra)
library(ppclust)
set.seed(1233)

frame_7_dataset <- read.csv("/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/Frame_7_ClusteredANDCleaned.csv", stringsAsFactors = FALSE)
frame_7_dataset <- frame_7_dataset[ , !(names(frame_7_dataset) %in% c("PC1","PC2","PC3","Cluster"))]
View(frame_7_dataset)

fraclac_dir_live_subset <- "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Data Processing/Frame_35/FracLac/20251205023446"
skeleton_dir_live_subset <- "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Data Processing/Frame_35/SkeletonResults"
fraclac_live_subset <- fraclac_tidying(fraclac_dir_live_subset) 
skeleton_live_subset <- skeleton_tidying(skeleton_dir_live_subset)
data_livecell_subset <- merge_data(fraclac_live_subset, skeleton_live_subset)
frame_35_dataset <- metadata_columns(data_livecell_subset, c("BrainRegion", "MouseID","Treatment","Sex","SlideNumber"), sep="_")
View(frame_35_dataset)


target_names <- names(frame_7_dataset)
names(frame_35_dataset) <- target_names
View(frame_35_dataset)
live_cell_microglia <- rbind(frame_7_dataset, frame_35_dataset)

View(live_cell_microglia)
live_cell_logtransformed <- transform_log(live_cell_microglia,1, start=8, end=34) 
pca_live_cell <- pcadata(live_cell_logtransformed, featurestart=8, featureend=34,
                             pc.start=1, pc.end=10)
pca_live_cell_normalized <- transform_scale(pca_live_cell, start=1, end=3) # scale pca data as input for k-means clustering
kmeans_input <- pca_live_cell_normalized[1:3]
kmeans_output <- kmeans(kmeans_input, centers=3)
final_microglia_dataset <- cbind(pca_live_cell_normalized[1:3], live_cell_microglia, as.data.frame(kmeans_output$cluster)) %>%
  rename(Cluster=`kmeans_output$cluster`) 
clusterfeatures(final_microglia_dataset, featurestart=11, featureend=37)

final_microglia_dataset <- final_microglia_dataset %>% mutate(Cluster = 
                                                        case_when(Cluster=="1" ~ "Ameboid",
                                                                  Cluster=="2" ~ "Rod-Like",
                                                                  Cluster=="3" ~ "Ramified"))
final_microglia_dataset <- final_microglia_dataset %>% mutate(Cluster = 
                                                                case_when(Cluster=="Ameboid" ~ "1",
                                                                          Cluster=="Rod-Like" ~ "2",
                                                                          Cluster=="Ramified" ~ "3"))

cluster_percentages <- clusterpercentage(final_microglia_dataset, "Cluster", Treatment, Sex, SlideNumber, MouseID)
cluster_percentages2 <- clusterpercentage(final_microglia_dataset, "Cluster", Treatment, Sex, SlideNumber)



write.csv(final_microglia_dataset, "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/final_live_dataset-numberedclusters.csv", row.names = FALSE)


write.csv(cluster_percentages, "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/cluster-percentages-MOUSEID-raw.csv", row.names = FALSE)

cluster_percentages <- clusterpercentage(final_microglia_dataset, "Cluster", Treatment, Sex, SlideNumber, MouseID)


View(cluster_percentages)

coldvcontrol_all <- cluster_percentages %>% 
  ggplot(aes(x = Cluster, y = percentage, group = interaction(Cluster, Treatment))) +
  facet_grid(~ SlideNumber) + 
  geom_boxplot(aes(group = interaction(Cluster, Treatment), fill = Treatment), outlier.shape = NA) +  # Remove outliers
  geom_point(aes(color = Sex, group = interaction(Cluster, Treatment)), 
             position = position_jitterdodge(jitter.width = 0.1, dodge.width = 0.75), 
             size = 2, alpha = 0.9) +  # Points jittered and aligned with boxplots
  scale_fill_manual(values = c("white", "lightgray")) +
  scale_color_manual(values = c("M" = "blue", "F" = "pink")) +  # Colors for Sex
  ggtitle("Cold vs. Control Cluster Percentages Split by Brain Region") +
  labs(x = "Cluster", y = "Percentage", fill = "Treatment") +
  theme_bw(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        strip.text = element_text(face = "bold", size = 12),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"))

coldvcontrol_all


#Cluster 1: #FAA0A0
#Cluster 2: #A7C7E7
#Cluster 3: #FFEE8C


