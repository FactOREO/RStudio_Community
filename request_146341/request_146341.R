# fake data
set.seed(1)
z <- data.frame(matrix(ncol = 3, nrow = 2000))

names(z) <- c('can_a', 'can_b', 'can_c')
z$can_a <- sample(x = c(0:10, 88, 99), size = nrow(z), replace = TRUE)
z$can_b <- sample(x = c(0:10, 88, 99), size = nrow(z), replace = TRUE)
z$can_c <- sample(x = c(0:10, 88, 99), size = nrow(z), replace = TRUE)

# corrected the labels, since before they coerced to NAs
z$can_a <- factor(z$can_a, levels = c(0:10, 88, 99),
                  c('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                    'Don´t know', 'No answer'))
z$can_b <- factor(z$can_b, levels = c(0:10, 88, 99),
                  c('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                    'Don´t know', 'No answer'))
z$can_c <- factor(z$can_c, levels = c(0:10, 88, 99),
                  c('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                    'Don´t know', 'No answer'))

####
library(dplyr); library(tidyr)
# calculate frequencies
frequencies <- z |>
  pivot_longer(cols = everything(), names_to = 'can', values_to = 'value') |>
  group_by(can,value) |>
  summarise(
    frequency = n()/nrow(z)
  ) |> ungroup() |>
  pivot_wider(values_from = 'frequency', names_from = 'can')

# get the mean additionally
the_means <- z |>
  pivot_longer(cols = everything(), names_to = 'can', values_to = 'value') |>
  filter(value %in% 0:10) |>
  group_by(can) |>
  summarise(
    mean = mean(as.numeric(value))
  ) |> ungroup() |>
  pivot_wider(values_from = 'mean', names_from = 'can') |>
  # add a column "value" for binding later
  mutate(value = 'mean')

# put together
result <- bind_rows(the_means,frequencies) |> select(value,everything())
result