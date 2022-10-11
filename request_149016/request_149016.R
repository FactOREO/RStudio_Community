### user written functions to calculate min, max and mean
get_minimum <- function(vector){
  minimum <- vector[[1]]
  for (i in seq_along(vector)){
    if (vector[[i]] < minimum) minimum <- vector[[i]]
  }
  minimum
}

get_maximum <- function(vector){
  maximum <- vector[[1]]
  for (i in seq_along(vector)){
    if (vector[[i]] > maximum) maximum <- vector[[i]]
  }
  maximum
}

get_mean <- function(vector){
  sum(vector) / length(vector)
}

### apply it to a data.frame with dummy values for 10 cities
Data <- data.frame(
  city = rep(LETTERS[1:10],each = 10),
  temperature = sample(5:25,100,TRUE)
)
head(Data,11)

tapply(Data$temperature, Data$city, get_minimum)
tapply(Data$temperature, Data$city, get_maximum)
tapply(Data$temperature, Data$city, get_mean)

### use build in functions to return the values
tapply(Data$temperature, Data$city, min)
tapply(Data$temperature, Data$city, max)
tapply(Data$temperature, Data$city, mean)