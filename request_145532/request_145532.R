year = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")

var = rnorm(11,100, 11)

df = data.frame(year, var)

library(collapse)
df |> fmutate(growth = fgrowth(var))

library(data.table)
df |> fmutate(growth = (var - shift(var))/shift(var) * 100)

library(dplyr)
df |> mutate(growth = (var - dplyr::lag(var))/dplyr::lag(var) * 100)

