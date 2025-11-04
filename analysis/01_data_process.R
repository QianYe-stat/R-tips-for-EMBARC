#---- 1. source the dependencies file ----
source(here("analysis","00_dependencies.R"))
rm(list=ls())

#----2. Import the raw data ----
raw <- read_csv(here("data","raw", "study.csv"), show_col_types = TRUE)
names(raw)
glimpse(raw)

#----3. Clean the data ----

clean <- raw %>% 
  clean_names() %>% 
  mutate(
    age_grp = case_when(
      age < 30 ~ "<30",
      age < 50 ~ "30-49",
      TRUE ~ "50+"
    ),
    index_yr = year(index_date),
    y=factor(y, levels=c(0,1), labels=c("No", "Yes"))
  )

#----4. Save the clean data ----
readr::write_csv(clean, here("data","clean","study_clean.csv"))
saveRDS(clean, here("data","clean","study_clean.rds"))
