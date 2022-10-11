Data <- data.frame(
  vals = rgamma(10000,2,3)
)

library('ggplot2')

quantiles <- quantile(Data$vals, probs = c(.25, .5, .75))

Data |>
  ggplot(aes(vals)) +
  geom_histogram(bins =35) +
  stat_summary(
    aes(y = 1, xintercept = stat(x)),
    fun.data = function(x) {
      data.frame(
        y = quantile(x, probs = c(0.25, 0.5, 0.75)) ) },
    geom = "text",
    orientation = "y")
