#### Preamble ####
# Purpose: Downloads and saves the data from https://open.toronto.ca/dataset/covid-19-cases-in-toronto/ 
# Author: Denise Chang
# Date: 17 January 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup #### 
library(tidyverse)
library(opendatatoronto)
library(arrow)

#### Download data ####
raw_covid_data <-
  list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe") |>
  filter(name == 
           "COVID19 cases.csv") |>
  get_resource()

#### Save data ####
write_parquet(
  x = raw_covid_data,
  sink = "inputs/data/raw_covid_data.parquet"
)
