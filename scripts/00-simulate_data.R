#### Preamble ####
# Purpose: Simulate dataset of COVID-19 cases in Toronto
# Author: Denise Chang
# Data: 17 January 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT

#### Data Expectations ####
# Episode date should be a valid date in YYYY-MM-DD format between in 2022
# ever_hospitalized should only take two possible values: 'Yes' or 'No'
# ever_in_icu should only take two possible values: 'Yes' or 'No'
# Columns: episode_date, ever_hospitalized, ever_in_icu

#### Workspace setup ####
library(tidyverse)

#### Start simulation ####

## Create simulated data

set.seed(302) #random seed

# simulate data for 1 year (365 days)
sim_data <-
  tibble(
    date = rep(x = as.Date("2022-01-01") + c(0:364), times = 1),
    hospitalization = sample(x = c("Yes", "No"),
                             size = 365,
                             replace = TRUE,
                             prob = c(0.5, 0.5)),
    icu = sample(x = c("Yes", "No"),
                 size = 365,
                 replace = TRUE,
                 prob = c(0.5, 0.5)
    ))

tail(sim_data)


#### Data testing ####

# check there are only 2 hospitalization possibilities
sim_data$hospitalization |>
  unique() |>
  length() <= 2

# check the 2 hospitalization possibilities
all(sim_data$hospitalization %in% c("Yes", "No"))

# check there are only 2 icu possibilities
sim_data$icu |>
  unique() |>
  length() <= 2

# check the 2 icu possibilities
all(sim_data$icu %in% c("Yes", "No"))

# check the date range
sim_data$date |>
  min() == "2022-01-01"

sim_data$date |>
  max() == "2022-12-31"

