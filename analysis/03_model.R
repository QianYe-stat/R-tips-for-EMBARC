#---- 1. source the dependencies file ----
library(here)
source(here("analysis","00_dependencies.R"))
rm(list=ls())

#---- 2. import the clean data ----
dat <- read_csv(here("data","clean", "study_clean.csv"), show_col_types = TRUE)

# or run this
dat <- readRDS(here("data","clean","study_clean.rds"))
names(dat)

#---- 3. fit a logistic regression ---
fit_glm <- glm(y ~ treatment + I(age/10) + sex + age_grp, data = dat, family = binomial())
summary(fit_glm)

#---- 4. display the model results
t1 <- fit_glm %>% tbl_regression(exponentiate = TRUE,
                     pvalue_fun = label_style_pvalue(digits = 3),
                     label = list(treatment ~ "Treatment group", 
                                  'I(age/10)' ~ "Age (per 10 years)",
                                  sex ~ "Sex",
                                  age_grp ~ "Age group") ) %>% 
  add_global_p() %>% 
  bold_p(t = 0.05) %>% 
  bold_labels() |>
  italicize_levels()

t1
