library(collapse)
library(bestNormalize)

data <- data.frame(
  year = c(2012,2012,2013,2013,2014,2014),
  score_1 = c(34,41,31,44,35,42),
  score_2 = c(45,46,44,33,56,21)
)

data |>
  fgroup_by(year) |>
  fsummarise(
    score_1 = bestNormalize(score_1, out_of_sample = FALSE, quiet = TRUE)$x.t,
    score_2 = bestNormalize(score_2, out_of_sample = FALSE, quiet = TRUE)$x.t) |>
  rsplit(~ year)
