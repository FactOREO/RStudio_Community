Data <- structure(list(Names = c("Tom", "height", "weight", "age", "run",
                                 "time", "Paul", "height", "weight", "age", "time", "Steven",
                                 "height", "weight", "age", "run", "time"), t0 = c(NA, 171, NA,
                                                                                   55, 2, 15, NA, 150, 70, NA, 15, NA, 171, 60, 55, 7, 15), t1 = c(NA,
                                                                                                                                                   171, NA, 55, 3, 16, NA, 150, 70, 54, 14, NA, NA, NA, NA, NA,
                                                                                                                                                   16), t2 = c(NA, 171, NA, 55, 4, 18, NA, 150, 69, NA, 13, NA,
                                                                                                                                                               171, 60, 55, 8, 17), t3 = c(NA, 171, NA, 55, 5, 17, NA, 150,
                                                                                                                                                                                           68, NA, NA, NA, 171, 60, NA, 8, 18)), class = c("tbl_df", "tbl",
                                                                                                                                                                                                                                           "data.frame"), row.names = c(NA, -17L))
Outcome <- structure(list(Names = c("Tom", "Tom", "Tom", "Tom", "Tom", "Paul",
                                    "Paul", "Paul", "Paul", "Steven", "Steven", "Steven", "Steven",
                                    "Steven"), variables = c("height", "weight", "age", "run", "time",
                                                             "height", "weight", "age", "time", "height", "weight", "age",
                                                             "run", "time"), t0 = c(171, NA, 55, 2, 15, 150, 70, NA, 15, 171,
                                                                                    60, 55, 7, 15), t1 = c(171, NA, 55, 3, 16, 150, 70, 54, 14, NA,
                                                                                                           NA, NA, NA, 16), t2 = c(171, NA, 55, 4, 18, 150, 69, NA, 13,
                                                                                                                                   171, 60, 55, 8, 17), t3 = c(171, NA, 55, 5, 17, 150, 68, NA,
                                                                                                                                                               NA, 171, 60, NA, 8, 18)), class = c("tbl_df", "tbl", "data.frame"
                                                                                                                                                               ), row.names = c(NA, -14L))

library(tidyverse)
# if you have a list of all the relevant names, this will work
names <- c('Tom','Paul','Steven')
Data |>
  mutate(
    Group = if_else(Names %in% names, Names, NA_character_)
  ) |>
  fill(
    Group, .direction = 'down'
  ) |>
  pivot_longer(
    cols = t0:t3, names_to = 'category', values_to = 'value'
  ) |>
  filter(
    Names != Group
  ) |>
  pivot_wider(
    values_from = 'value', names_from = 'category'
  ) |>
  rename(
    'Names' = Group,
    'variables' = Names
  ) |>
  select(Names,variables,everything())

# if all names start with uppercase letter, do this
Data |>
  mutate(
    Group = if_else(str_detect(Names,'^[A-Z]'),Names,NA_character_)
  ) |>
  fill(
    Group, .direction = 'down'
  ) |>
  pivot_longer(
    cols = t0:t3, names_to = 'category', values_to = 'value'
  ) |>
  filter(
    Names != Group
  ) |>
  pivot_wider(
    values_from = 'value', names_from = 'category'
  ) |>
  rename(
    'Names' = Group,
    'variables' = Names
  ) |>
  select(Names,variables,everything())