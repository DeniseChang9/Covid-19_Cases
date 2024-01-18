#### Preamble ####
# Purpose: Cleans the raw COVID19 cases data downloaded from Open Data Toronto
# Author: Denise Chang
# Date: 17 January 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####

# read in the raw data
raw_covid_data <- 
  read_csv(
    file = "inputs/data/raw_covid_data.csv", 
    show_col_types = FALSE
    )

clean_covid_data <-
  # make the columns readable
  clean_names(raw_covid_data)|>
  # select columns of interest
  select(episode_date, ever_hospitalized, ever_in_icu) |>
  # remove any 2024 data
  filter(episode_date <= "2023-12-31") |>
  # eliminate date data
  mutate(
    episode_date = format(episode_date, "%Y-%m")
  ) |>
  # rename column headings
  rename(
    date = episode_date, 
    hospitalized = ever_hospitalized, 
    icu = ever_in_icu
  )

head(clean_covid_data)
