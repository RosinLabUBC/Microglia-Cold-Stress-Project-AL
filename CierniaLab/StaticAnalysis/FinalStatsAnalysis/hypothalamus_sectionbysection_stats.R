library(MicrogliaMorphologyR)
library(factoextra)
library(ppclust)
library(dplyr)
library(ggsignif)
library(ggrepel)
library(performance)  # for model checks
library(lme4)
library(lmerTest) # For p-values
library(MASS)
library(readxl)
library(emmeans)


#Loading in the data
#Cluster Percentage Data (not separated by section)
cluster_data <- read.csv("/Users/alexlawson/Desktop/Masters-Work/data-frames/cluster-percentage-data.csv", stringsAsFactors = FALSE)
#Cluster Percentage Data (separated by section - sections only used for the hypothalamus stats)
cluster_data_sections <- read.csv("/Users/alexlawson/Desktop/Masters-Work/data-frames/cluster-percentage-data-w-sections.csv", stringsAsFactors = FALSE)
#Loading in the raw data frame (contains all individual morphological features as well as cluster data and first 2 PCAs)
data_frame_final <- read.csv("/Users/alexlawson/Desktop/Masters-Work/data-frames/final-dataframe.csv")


#Preparing data separated by section for downstream processing, filtering out the hypothalamus
stats_input_with_sections <- cluster_data_sections %>% filter(BrainRegion=="HYPO")
stats_input_with_sections$MouseID <- factor(stats_input_with_sections$MouseID)
stats_input_with_sections$Cluster <- factor(stats_input_with_sections$Cluster)
stats_input_with_sections$Treatment <- factor(stats_input_with_sections$Treatment)
stats_input_with_sections$Sex <- factor(stats_input_with_sections$Sex)

library(dplyr)
library(openxlsx)

# --- Stats ---

# s01 Males
stats_testing_hypothalamus_s01_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s01", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s01 Females
stats_testing_hypothalamus_s01_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s01", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s02 Males
stats_testing_hypothalamus_s02_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s02", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s02 Females
stats_testing_hypothalamus_s02_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s02", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s03 Males
stats_testing_hypothalamus_s03_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s03", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s03 Females
stats_testing_hypothalamus_s03_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s03", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s04 Males
stats_testing_hypothalamus_s04_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s04", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s04 Females
stats_testing_hypothalamus_s04_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s04", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s05 Males
stats_testing_hypothalamus_s05_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s05", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s05 Females
stats_testing_hypothalamus_s05_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s05", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s06 Males
stats_testing_hypothalamus_s06_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s06", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s06 Females
stats_testing_hypothalamus_s06_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s06", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s07 Males
stats_testing_hypothalamus_s07_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s07", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s07 Females
stats_testing_hypothalamus_s07_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s07", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s08 Males
stats_testing_hypothalamus_s08_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s08", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s08 Females
stats_testing_hypothalamus_s08_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s08", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s09 Males
stats_testing_hypothalamus_s09_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s09", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s09 Females
stats_testing_hypothalamus_s09_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s09", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s10 Males
stats_testing_hypothalamus_s10_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s10", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s10 Females
stats_testing_hypothalamus_s10_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s10", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s11 Males
stats_testing_hypothalamus_s11_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s11", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s11 Females
stats_testing_hypothalamus_s11_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s11", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s12 Males
stats_testing_hypothalamus_s12_M <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s12", Sex == "M"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)

# s12 Females
stats_testing_hypothalamus_s12_F <- stats_cluster.animal(
  data     = stats_input_with_sections %>% filter(SlideNumber == "s12", Sex == "F"),
  model    = "percentage ~ Cluster*Treatment + (1|MouseID)",
  posthoc1 = "~Treatment|Cluster",
  posthoc2 = "~Treatment|Cluster",
  adjust   = "sidak"
)


# --- Extract and combine all results ---

extract_results <- function(result, slide, sex) {
  
  # Chi-square — includes Chisq and Df
  chisq_df <- as.data.frame(result[[1]])
  chisq_df$Term <- rownames(chisq_df)
  chisq_df <- chisq_df %>%
    dplyr::rename(P.value = `Pr(>Chisq)`) %>%
    dplyr::mutate(
      Summary = case_when(
        P.value < 0.001 ~ "***",
        P.value < 0.01  ~ "**",
        P.value < 0.05  ~ "*",
        P.value < 0.1   ~ ".",
        TRUE            ~ "ns"
      ),
      Section = "Type II Wald chi-square tests",
      Slide   = slide,
      Sex     = sex
    ) %>%
    dplyr::select(Slide, Sex, Section, Term, Chisq, Df, P.value, Summary)
  
  # Posthoc — no Chisq/Df so fill with NA
  posthoc_df <- as.data.frame(result[[2]]) %>%
    dplyr::mutate(
      contrast = as.character(contrast) %>%
        gsub("COLD", "Cold Stress", .) %>%
        gsub("CON",  "Control", .),
      Term = paste0(Cluster, ": ", contrast),
      Summary = case_when(
        p.value < 0.001 ~ "***",
        p.value < 0.01  ~ "**",
        p.value < 0.05  ~ "*",
        p.value < 0.1   ~ ".",
        TRUE            ~ "ns"
      ),
      Section = "Sidak-adjusted post hoc comparisons",
      Slide   = slide,
      Sex     = sex,
      Chisq   = NA,
      Df      = NA
    ) %>%
    dplyr::select(Slide, Sex, Section, Term, Chisq, Df, p.value, Summary) %>%
    dplyr::rename(P.value = p.value)
  
  dplyr::bind_rows(posthoc_df, chisq_df)
}

# Combine all
all_results <- dplyr::bind_rows(
  extract_results(stats_testing_hypothalamus_s01_M, "s01", "M"),
  extract_results(stats_testing_hypothalamus_s01_F, "s01", "F"),
  extract_results(stats_testing_hypothalamus_s02_M, "s02", "M"),
  extract_results(stats_testing_hypothalamus_s02_F, "s02", "F"),
  extract_results(stats_testing_hypothalamus_s03_M, "s03", "M"),
  extract_results(stats_testing_hypothalamus_s03_F, "s03", "F"),
  extract_results(stats_testing_hypothalamus_s04_M, "s04", "M"),
  extract_results(stats_testing_hypothalamus_s04_F, "s04", "F"),
  extract_results(stats_testing_hypothalamus_s05_M, "s05", "M"),
  extract_results(stats_testing_hypothalamus_s05_F, "s05", "F"),
  extract_results(stats_testing_hypothalamus_s06_M, "s06", "M"),
  extract_results(stats_testing_hypothalamus_s06_F, "s06", "F"),
  extract_results(stats_testing_hypothalamus_s07_M, "s07", "M"),
  extract_results(stats_testing_hypothalamus_s07_F, "s07", "F"),
  extract_results(stats_testing_hypothalamus_s08_M, "s08", "M"),
  extract_results(stats_testing_hypothalamus_s08_F, "s08", "F"),
  extract_results(stats_testing_hypothalamus_s09_M, "s09", "M"),
  extract_results(stats_testing_hypothalamus_s09_F, "s09", "F"),
  extract_results(stats_testing_hypothalamus_s10_M, "s10", "M"),
  extract_results(stats_testing_hypothalamus_s10_F, "s10", "F"),
  extract_results(stats_testing_hypothalamus_s11_M, "s11", "M"),
  extract_results(stats_testing_hypothalamus_s11_F, "s11", "F"),
  extract_results(stats_testing_hypothalamus_s12_M, "s12", "M"),
  extract_results(stats_testing_hypothalamus_s12_F, "s12", "F")
)

# Save
write.csv(all_results,
          file = "/Users/alexlawson/Masters-Data-Final/Thesis-writing/section by section/all_sections_results.csv",
          row.names = FALSE)

message("Saved: all_sections_results.csv")