Data <- data.frame(
  trip_id = 1:3
)

library(dplyr)

Data |>
  rename(
    `01-Rental Details Rental ID` = trip_id
  )
