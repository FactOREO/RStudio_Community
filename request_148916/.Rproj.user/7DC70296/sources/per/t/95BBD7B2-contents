library(dplyr)

Data <- data.frame(animal = sample(c('cat','dog','horse'),1000,TRUE,c(.6,.2,.2)),
                   color = sample(c('black','brown','white'),1000,TRUE),
                   location = sample(c('east','north','west'),1000,TRUE))

filter_group_count <- function(df,filter_var,filter_cond,...){
  df |>
    filter( {{filter_var}} %in% filter_cond ) |>
    group_by( ... ) |>
    summarise(
      count = n()
    )
}

filter_group_count(df = Data, filter_var = animal, filter_cond = 'cat', color)
filter_group_count(df = Data, filter_var = animal, filter_cond = 'cat', color, location)

filter_group_count(Data, animal, 'meow', color)
