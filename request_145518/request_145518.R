library(dplyr)
mtcars |>
  filter(mpg > 30) |>
  arrange(-mpg)
