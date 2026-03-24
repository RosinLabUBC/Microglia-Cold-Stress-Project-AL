#LOADING LIBRARIES AND SETTING WD
#clean
library(MicrogliaMorphologyR)
library(factoextra)
library(ppclust)
set.seed(1233)


live_cell_dataset <- read.csv("/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Results/livecelldataset_withclustername.csv", stringsAsFactors = FALSE)
live_cell_dataset_noAL80 <- live_cell_dataset[live_cell_dataset$MouseID != "AL80", ]
live_cell_dataset_noAL80 <- live_cell_dataset_noAL80[ , !(names(live_cell_dataset_noAL80) %in% c("PC1","PC2","PC3","Cluster"))]
View(live_cell_dataset_noAL80)
View(live_cell_dataset_noAL80)
fraclac_dir_live_subset <- "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Data/AL80-redone/FracLac/20251204115046"
skeleton_dir_live_subset <- "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Data/AL80-redone/SkeletonResults/"
fraclac_live_subset <- fraclac_tidying(fraclac_dir_live_subset) 
skeleton_live_subset <- skeleton_tidying(skeleton_dir_live_subset)
data_livecell_subset <- merge_data(fraclac_live_subset, skeleton_live_subset)
finaldata_live_subset <- metadata_columns(data_livecell_subset, c("BrainRegion", "MouseID","Treatment","Sex","SlideNumber"), sep="_")
View(finaldata_live_subset)
View(live_cell_dataset)

target_names <- names(live_cell_dataset_noAL80)
names(finaldata_live_subset) <- target_names
merged_cleaned_live_cell <- rbind(live_cell_dataset_noAL80, finaldata_live_subset)

df_merged_log <- transform_log(merged_cleaned_live_cell,1, start=8, end=34) 
pca_df_merged_log <- pcadata(df_merged_log, featurestart=8, featureend=34,
                             pc.start=1, pc.end=10)
pca_df_merged_log_transformed <- transform_scale(pca_df_merged_log, start=1, end=3) # scale pca data as input for k-means clustering
kmeans_pca_df_merged_log_transformed <- pca_df_merged_log_transformed[1:3]
data_kmeans_pca_df_merged_log_transformed <- kmeans(kmeans_pca_df_merged_log_transformed, centers=3)
final_df_live <- cbind(pca_df_merged_log[1:3], merged_cleaned_live_cell, as.data.frame(data_kmeans_pca_df_merged_log_transformed$cluster)) %>%
  rename(Cluster=`data_kmeans_pca_df_merged_log_transformed$cluster`) 
clusterfeatures(final_df_live, featurestart=11, featureend=37)
View(final_df_live)
write.csv(final_df_live, "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/Frame_7_ClusteredANDCleaned.csv", row.names = FALSE)

cluster_percentages <- clusterpercentage(final_df_live, "Cluster", Treatment, Sex, BrainRegion, MouseID)
write.csv(cluster_percentages2, "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/Frame_7_ClusterPercentages.csv", row.names = FALSE)

cluster_percentages2 <- clusterpercentage(final_df_live, "Cluster", Treatment, Sex, BrainRegion)

cluster_percentages <- cluster_percentages %>% mutate(Cluster = 
                                                        case_when(Cluster=="1" ~ "Ameboid",
                                                                  Cluster=="2" ~ "Ramified",
                                                                  Cluster=="3" ~ "Rod-Like"))

cluster_percentages2 <- cluster_percentages2 %>% mutate(Cluster = 
                                                        case_when(Cluster=="1" ~ "Ameboid",
                                                                  Cluster=="2" ~ "Ramified",
                                                                  Cluster=="3" ~ "Rod-Like"))

coldvcontrol_all <- cluster_percentages2 %>% 
  ggplot(aes(x = Cluster, y = percentage, group = interaction(Cluster, Treatment))) +
  facet_grid(~ BrainRegion) + 
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
# 
coldvcontrol_all
