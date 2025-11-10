#---- 1. source the dependencies file ----
library(here)
source(here("analysis","00_dependencies.R"))
rm(list=ls())

#---- 2. import the clean data ----
dat <- read_csv(here("data","clean", "study_clean.csv"), show_col_types = TRUE)

# or run this
dat <- readRDS(here("data","clean","study_clean.rds"))
names(dat)

#---- 3. assign labels/units ----
label(dat$age) <- "Age (years)"
label(dat$bmi) <- "BMI (kg/m2)"
label(dat$sex) <- "Sex"
label(dat$age_grp) <- "Age group"
label(dat$index_yr) <- "Index year"
label(dat$treatment) <- "Treatment group"
label(dat$y) <- "Outcome"



#---- 4. pre-define the format ----
render.cont <- function(x){
  with(stats.default(x),
       c("","Median (Q1, Q3)"=sprintf("%s (%s, %s)", round_pad(MEDIAN,0), 
                                      round_pad(Q1,0),
                                      round_pad(Q3,0))))
}


#---- 5. make the descriptive table ---- 

#==== 5.1 using table1 ====
table1 <- table1(~ y + age + sex + bmi + age_grp + index_yr
                 |treatment,
                 overall=c(left='Total'),
                 render.continuous=render.cont,
                 data=dat)
table1
table1 <- as.data.frame(table1)
#write.csv(table1 , here("results","temp","summary_table1.csv"))

 
#==== 5.2 using gtsummary ====
sum_tab <- dat %>% 
  tbl_summary(
    include = c(y, age, sex, bmi, age_grp, index_yr, treatment),
    by = treatment,
    type=list(index_yr ~ "continuous",
              y ~ "categorical"),
    digits    = all_continuous() ~ 0) %>%
  add_p(pvalue_fun = label_style_pvalue(digits = 3)) %>% 
  add_overall() %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Treatment group**") %>% 
  bold_labels() %>% 
  as_gt()

sum_tab 
gt::gtsave(sum_tab, here("figures","table.png"))
 

