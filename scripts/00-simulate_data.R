#### Preamble ####
# Purpose: Simulate dataset of COVID-19 cases in Toronto
# Author: Denise Chang
# Data: 17 January 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT

#### Data Expectations ####
# Number of clinics matching population density in the city
# Expect different types of clinics, like city-run, hospital, pharmacy, pop-ups
# Episode date should be a valid date before today
# Columns: episode_date, outcome, ever_hospitalized, ever_in_icu

#### Workspace setup ####
library(tidyverse)

#### Start simulation ####

## Assumptions

