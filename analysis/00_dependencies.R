# list all packages needed
pkgs <- c("here", 
          "tidyverse",
          "readr",
          "dplyr",
          "janitor",
          "lubridate",
          "stringr",
          "forcats",
          "table1",
          "gtsummary",
          "gt",
          "skimr",
          "ggplot2",
          "patchwork",
          "broom",
          "modelsummary",
          "survival",
          "survminer",
          "htmlwidgets",
          "webshot2",
          "broom.helpers"
   )

# Install any that are missing
install.packages(setdiff(pkgs, rownames(installed.packages())))


# Load them all
lapply(pkgs, library, character.only = TRUE)

