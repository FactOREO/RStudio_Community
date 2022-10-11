setwd("C:/Users/hdust/OneDrive/Master Finance/R/RStudio_Community/request_145042")
data <- haven::read_dta('2021-PPI-Full.dta')

data |>
  dplyr::mutate(country = haven::as_factor(country)) |>
  head()
