#### Preamble ####
# Purpose: Download dataset of COVID-19 cases in Toronto
# Author: Denise Chang
# Date: 17 January 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Dataset: https://open.toronto.ca/dataset/covid-19-cases-in-toronto/ 

#### Workspace setup #### 
library(tidyverse)
library(opendatatoronto)

#### Download and write COVID-19 cases data ####

# read data
raw_covid_data <-
  list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe") |>
  get_resource()

# write data
write_csv(
  x = raw_covid_data,
  file = "inputs/data/raw_covid_data.csv"
)