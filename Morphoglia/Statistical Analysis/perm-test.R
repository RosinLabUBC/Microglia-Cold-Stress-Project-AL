library(dplyr)
library(tidyverse)

# --- Load & prep ---
df <- read_csv("/Users/alexlawson/GitHub/MorphologyFinalAnalysis/Morphoglia/Data/Morphology_HDBSCAN_30_0.1_150_5.csv")

sex_from_tissue <- function(x){
  x <- tolower(x)
  case_when(
    grepl("\\bf(emale)?\\b", x) ~ "F",
    grepl("\\bm(ale)?\\b", x)   ~ "M",
    TRUE                        ~ NA_character_
  )
}

dat <- df %>%
  mutate(
    sex = sex_from_tissue(tissue),
    treatment = as.factor(treatment),
    group = as.factor(group),
    Clusters = as.factor(Clusters),
    sex = as.factor(sex)
  ) %>%
  filter(!is.na(sex), !is.na(treatment), !is.na(group), !is.na(Clusters))
# Optional: drop noise cluster if present
# dat <- dat %>% filter(Clusters != "-1")

# --- test statistic ---
get_chisq <- function(data) {
  tab <- table(data$treatment, data$Clusters)
  suppressWarnings(chisq.test(tab)$statistic)
}

# --- A) Mouse-level permutation within a sex ---
perm_test_mouselevel_one_sex <- function(data, n_perm = 10000, seed = 42) {
  set.seed(seed)
  obs <- get_chisq(data)
  unique_mice <- data %>% distinct(group, treatment)
  perm_stats <- numeric(n_perm)
  for (i in seq_len(n_perm)) {
    shuffled_mice <- unique_mice %>% mutate(treatment = sample(treatment))
    dat_shuf <- data %>% select(-treatment) %>% left_join(shuffled_mice, by = "group")
    perm_stats[i] <- get_chisq(dat_shuf)
  }
  list(stat_obs = obs, p = mean(perm_stats >= obs))
}

# --- B) Cell-level permutation within a sex (exploratory; ignores clustering by mouse) ---
perm_test_celllevel_one_sex <- function(data, n_perm = 10000, seed = 777) {
  set.seed(seed)
  obs <- get_chisq(data)
  perm_stats <- numeric(n_perm)
  for (i in seq_len(n_perm)) {
    dat_shuf <- data
    # shuffle treatment labels across rows, preserving treatment counts within this sex
    dat_shuf$treatment <- sample(dat_shuf$treatment)
    perm_stats[i] <- get_chisq(dat_shuf)
  }
  list(stat_obs = obs, p = mean(perm_stats >= obs))
}

# ===== Run sex-specific tests =====
dat_M <- dat %>% filter(sex == "M")
dat_F <- dat %>% filter(sex == "F")

# Mouse-level (proper)
res_M <- perm_test_mouselevel_one_sex(dat_M)
res_F <- perm_test_mouselevel_one_sex(dat_F)

cat("Mouse-level p-values:\n")
cat("  Males   :", res_M$p, "\n")
cat("  Females :", res_F$p, "\n")

# Cell-level (exploratory)
res_M_cells <- perm_test_celllevel_one_sex(dat_M)
res_F_cells <- perm_test_celllevel_one_sex(dat_F)

cat("\nCell-level (exploratory) p-values:\n")
cat("  Males   :", res_M_cells$p, "\n")
cat("  Females :", res_F_cells$p, "\n")

