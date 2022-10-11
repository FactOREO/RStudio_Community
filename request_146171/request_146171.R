data <- data.frame(
  id = 1,
  total_years = 18,
  total_love_years = 282,
  total_years30 = 373,
  total_love_years30 = 1991,
  first_match = 'total_years'
)

library(tidyverse)
data |>
  pivot_longer(cols = total_years:total_love_years30,
               names_to = 'relevant_cols', values_to = 'true_value') |>
  filter(first_match == relevant_cols | first_match == str_remove(relevant_cols,'_love'))
