setwd("C:/Users/hdust/OneDrive/Master Finance/R/RStudio_Community/request_145324")

library(readr)
library(dplyr)

result <- read_delim('test_file.txt', delim = '/', col_names = FALSE) |>
  # import the time column as character, then transform using lubridate
  mutate(col1 = lubridate::hm(X1))
result

# inside read_delim
result2 <- read_delim('test_file.txt', delim = '/', col_names = FALSE,
                      col_types = list(X1 = col_time(format = '%H:%M')))
