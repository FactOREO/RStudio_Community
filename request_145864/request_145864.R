data <- data.frame(
  time_factor = rep('Time2',15),
  colour = rep('Yellow',15),
  lin_ext_mm = c(121.524, 103.82, 99.026, 114.38, 109.053,
                 103.55, 96.09, 123.45, 110.53, 163.88,
                 136.013, 95.275, 122.13,126.66,155.195)
)
sum <- FSA::Summarize(object = data$lin_ext_mm ~ data$time_factor + data$colour)
sum$se <- sum$sd / sqrt(sum$n)

sum