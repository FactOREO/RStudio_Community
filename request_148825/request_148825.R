Data <- data.frame(
  Number_of_Claims = sample(1:4,15,replace = TRUE)
)

a <- c(2.938026, 3.456584)
a1 <- a[[1]]/4
a2 <- a[[2]]/4

b <- c(1/0.8273983, 1/0.4934418)
b1 <- b[[1]]^(1/4)
b2=b[[2]]^(1/4)

# I assume you want to add a new column for a and b, corresponding to your Number_of_Claims value
library(dplyr)
Data |>
  mutate(
    a1_value = a1 * Number_of_Claims,
    a2_value = a2 * Number_of_Claims,
    b1_value = b1 * Number_of_Claims,
    b2_value = b2 * Number_of_Claims
  )

