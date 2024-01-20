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
library(arrow)

#### Clean data ####

# read in the raw data
raw_covid_data <- 
  read_parquet(
    file = "inputs/data/raw_covid_data.parquet", 
    )

clean_covid_data <-
  # make the columns readable
  clean_names(raw_covid_data)|>
  # select columns of interest
  select(episode_date, ever_hospitalized, ever_in_icu) |>
  # keeps year and month of cases
  mutate(episode_date = str_sub(episode_date, start = 1, end = 7)) |>
  # remove any 2024 data
  filter(episode_date <= "2023-12") |>
  # rename column headings
  rename(
    date = episode_date, 
    hospitalized = ever_hospitalized, 
    icu = ever_in_icu
  )

#### Save Data ####
write_parquet(
  x = clean_covid_data,
  sink = "outputs/data/clean_covid_data.parquet")
