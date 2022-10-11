sample_data <- data.frame(
  color = rep(c('Brown','Yelow'), each = 12),
  time = rep(c('Time0','Time1','Time2'), 8),
  lin_ext = sample(1:10, 24, replace = TRUE)
)

# calculate the mean per time and the difference in mean of consecutive periods
library(dplyr)
sample_data |>
  group_by(color, time) |> 
  summarise(
    mean = mean(lin_ext)
  ) |>
  mutate(
    mean - lag(mean)
  )
