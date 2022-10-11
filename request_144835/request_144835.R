library(ggplot2)

ggplot()+
  geom_function(fun = dnorm) +
  theme_void() +
  labs(y = 'y') +
  theme(
    axis.title = element_text(),
    axis.text = element_text(),
    rect = element_rect(fill = NA)
  )
