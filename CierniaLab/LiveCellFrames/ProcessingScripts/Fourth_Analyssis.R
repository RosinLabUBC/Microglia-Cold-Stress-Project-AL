#LOADING LIBRARIES AND SETTING WD
#clean
library(MicrogliaMorphologyR)
library(factoextra)
library(ppclust)
library(ggplot2)
library(dplyr)
library(glmmTMB)
library(emmeans)
set.seed(12)


cluster_data <- read.csv("/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/final_live_dataset-numberedclusters.csv", stringsAsFactors = FALSE)
cluster_data2 <- read.csv("/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/cluster-percentages.csv", stringsAsFactors = FALSE)
raw_data <- read.csv("/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Cleaned Data Frames/final_live_dataset-numberedclusters.csv", stringsAsFactors = FALSE)

View(cluster_data)



clusterfeatures(raw_data, featurestart=11, featureend=37)

plot_clusters <- clusterplots(raw_data, "PC1", "PC2")

plot_clusters$layers[[2]] <- NULL
plot_clusters +
  geom_point(size = 2) +
  scale_color_manual(values = c(
    "1" = "#FF6B6B",
    "2" = "#4A90E2",
    "3" = "#FFC300"
  ))





# ----- 1. Prep factors -----------------------------------------------------

library(dplyr)
library(ggplot2)

# ---- 1. Prepare factors -----------------------------------------
View(cluster_data2)
df <- cluster_data2 %>%
  mutate(
    Treatment   = factor(Treatment, levels = c("CON", "COLD")),
    Cluster     = factor(Cluster),
    SlideNumber = factor(SlideNumber),
    Sex         = factor(Sex, levels = c("M", "F"))
  )

# ---- 2. Split by sex --------------------------------------------

df_M <- df %>% filter(Sex == "M")
df_F <- df %>% filter(Sex == "F")

# ---- 3. Bar Graphs ----------------------------------------------
# If you have replicates per group, stat="summary" will calculate mean ± SE.

# ----- Male bar graph -----
p_M <- ggplot(df_M, aes(x = Cluster, y = n, fill = Treatment)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = position_dodge(width = 0.7),
    color = "darkblue",        # outline of the bar
    width = 0.7
  ) +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    position = position_dodge(width = 0.7),
    width = 0.25,
    color = "darkblue"
  ) +
  facet_wrap(~ SlideNumber) +
  scale_fill_manual(values = c(
    CON  = "white",
    COLD = "lightblue"
  )) +
  theme_classic() +
  labs(
    title = "Microglia Cluster Percentages – Males",
    x = "Cluster",
    y = "Percentage of microglia"
  )

# ----- Female bar graph -----
p_F <- ggplot(df_F, aes(x = Cluster, y = n, fill = Treatment)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = position_dodge(width = 0.7),
    color = "deeppink3",
    width = 0.7
  ) +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    position = position_dodge(width = 0.7),
    width = 0.25,
    color = "deeppink3"
  ) +
  facet_wrap(~ SlideNumber) +
  scale_fill_manual(values = c(
    CON  = "white",
    COLD = "lightpink"
  )) +
  theme_classic() +
  labs(
    title = "Microglia Cluster Percentages – Females",
    x = "Cluster",
    y = "Percentage of microglia"
  )


# ----- Male bar graph -----
p_all <- ggplot(df, aes(x = Cluster, y = percentage, fill = Treatment)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = position_dodge(width = 0.7),
    color = "darkblue",        # outline of the bar
    width = 0.7
  ) +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    position = position_dodge(width = 0.7),
    width = 0.25,
    color = "darkblue"
  ) +
  facet_wrap(~ SlideNumber) +
  scale_fill_manual(values = c(
    CON  = "white",
    COLD = "lightblue"
  )) +
  theme_classic() +
  labs(
    title = "Microglia Cluster Percentages – Males",
    x = "Cluster",
    y = "Percentage of microglia"
  )

# ---- 4. Print ----------------------------------------------------
p_M
p_F
p_all


color_bycluster <- cluster_data %>% 
  filter(MouseID=="AL83", SlideNumber=="s35") %>% select(c(Cluster, ID))
write.csv(color_bycluster, "/Users/alexlawson/Masters-Data-Final/Live-imaging/Ciernia-Lab-Morphometrics/Data Processing/Color_by_Cluster/cbcv2/csv/PVN_AL83_COLD_M_s35.csv", row.names = FALSE)
