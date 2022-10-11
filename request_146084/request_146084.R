setwd("C:/Users/hdust/OneDrive/Master Finance/R/RStudio_Community/request_146084")
library(tidyverse)
data <- read_delim('given_file.txt', col_names = FALSE, n_max = 18) |>
  pivot_wider(names_from = X1, values_from = X2) |>
  mutate(Time_taken = str_extract(string = Time_taken, "[0-9\\.,]+"))
data