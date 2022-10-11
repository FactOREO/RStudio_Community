library(tidyverse)

data <- data.frame(
  id = 1:100,
  current_age = sample(11:100,size = 100, replace = TRUE),
  signed_age = sample(11:100, size = 100, replace = TRUE))
# to get a [0,20] category
breaks <- c(0,seq.default(20,100,10))
# define labels
labels <- c('Under 20','20-29','30-39','40-49','50-59','60-69','70-79','80-89','Over 90')
# longer way (but preferable I think if you really need the wide format)
# is faster as well, since no pivot_longer or pivot_wider happens
data |>
  mutate(current_age_bucket = cut(x = current_age,
                                  breaks = breaks,
                                  labels = labels,
                                  right = FALSE,
                                  include.lowest = TRUE),
         signed_age_bucket = cut(x = signed_age,
                                 breaks = breaks,
                                 labels = labels,
                                 right = FALSE,
                                 include.lowest = TRUE)) |>
  head()
# probably better way regarding coding, but transforming into wide format is somewhat bad
data |>
  pivot_longer(cols = c('current_age','signed_age'),
               values_to = 'age', names_to = 'type_age') |>
  mutate(
    bucket = cut(x = age, breaks = breaks, labels = labels, right = FALSE, include.lowest = TRUE)
  ) |>
  select(id, type_age, bucket) |>
  pivot_wider(names_from = 'type_age', values_from = 'bucket') |>
  head()

rbenchmark::benchmark(
  option1 = data |>
    mutate(current_age_bucket = cut(x = current_age,
                                    breaks = breaks,
                                    labels = labels,
                                    right = FALSE,
                                    include.lowest = TRUE),
           signed_age_bucket = cut(x = signed_age,
                                   breaks = breaks,
                                   labels = labels,
                                   right = FALSE,
                                   include.lowest = TRUE)),
  option2 = data |>
    pivot_longer(cols = c('current_age','signed_age'),
                 values_to = 'age', names_to = 'type_age') |>
    mutate(
      bucket = cut(x = age, breaks = breaks, labels = labels, right = FALSE, include.lowest = TRUE)
    ) |>
    select(id, type_age, bucket) |>
    pivot_wider(names_from = 'type_age', values_from = 'bucket')
)
