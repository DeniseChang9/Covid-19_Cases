#### Preamble ####
# Purpose: Tests the cleaned data of COVID-19 cases in Toronto
# Author: Denise Chang
# Date: 18 January 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R and 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Test Data ####

# read the cleaned data
clean_covid_data <-
  read_parquet(file = "outputs/data/clean_covid_data.parquet")

# check there are only 2 hospitalization possibilities
clean_covid_data$hospitalized |>
  unique() |>
  length() <= 2

# check the 2 hospitalization possibilities
all(clean_covid_data$hospitalized %in% c("Yes", "No"))

# check there are only 2 icu possibilities
clean_covid_data$icu |>
  unique() |>
  length() <= 2

# check the 2 icu possibilities
all(clean_covid_data$icu %in% c("Yes", "No"))

# check the date range
clean_covid_data$date |>
  min() == "2020-01"

clean_covid_data$date |>
  max() == "2023-12"