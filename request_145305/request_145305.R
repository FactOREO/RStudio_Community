library(dplyr)

data1 <- letters[1:5]
data2 <- c("a", "c", "e")
for (i in seq_along(data1)){
  for (j in seq_along(data2)){
    data1[[i]] <- if_else(data1[[i]] == data2[[j]],
                          paste0(data1[[i]], "*"),
                          data1[[i]])
  }
}

data1