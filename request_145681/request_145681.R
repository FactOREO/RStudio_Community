library(tidyverse)

df <- data.frame(
  stringsAsFactors = FALSE,
  check.names = FALSE,
  Date = c("2022-01-01", "2022-01-01", "2022-01-01"),
  Country = c("Canada", "Canada", "USA"),
  `Product Type` = c("AFC", "FBF", "CBF"),
  `Product ID` = c("M10", "M12", "M12")) |> 
  mutate(Date = lubridate::ymd(Date))

df |>
  group_by(`Product ID`) |>
  summarise(
    different_prodTypes = n_distinct(`Product Type`),
    the_prodTypes = list(unique(`Product Type`))
  ) |>
  ungroup() |>
  filter(different_prodTypes > 1) |>
  unnest(the_prodTypes)
