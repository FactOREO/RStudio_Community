library(tibble)

weights <- c(0.0123, 0.1, 0.56)
mydf <- tibble(id = seq(1:50),
               x = runif(50, 1, 99), 
               y = runif(50, 1, 99),
               z = runif(50, 1, 99)) %>% 
  column_to_rownames('id')

as.matrix(mydf)  %*% weights
