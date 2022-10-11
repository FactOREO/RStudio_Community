Data <- data.frame(years_in_love = c(10,45,13,45),
                   years_married = c(8,44,6,8))
# your function
library(magrittr); library(dplyr); library(tidyr)
full_function <- function(data) {
  df1 <- data %>% 
    mutate(new_variable = ifelse(years_in_love > 100, 99, years_in_love)) %>%
    mutate(type = "love") %>%
    count(new_variable, type)
  
  df2 <- data %>% 
    mutate(new_variable = ifelse(years_married > 100, 99, years_married)) %>%
    mutate(type = "married") %>%
    count(new_variable, type)
  
  bind_rows(df1, df2)
  # not necessary
  # return(full_data)
}
# function from @FJCC
full_function2 <- function(DAT) {
  DAT |> 
    mutate(married = ifelse(years_married > 100, 99, years_married),
           love = ifelse(years_in_love > 100, 99, years_in_love)) |> 
    select(married,love) |> 
    pivot_longer(cols = c("married","love"),names_to = "type",values_to = "value") |> 
    count(value,type)
}
# using collapse and data.table instead of dplyr but some logic
library(collapse);library(data.table)
full_function3 <- function(DAT){
  DAT |>
    # convert to data.table
    qDT() |>
    fmutate(
      married = fifelse(years_married > 100, 99, years_married),
      love    = fifelse(years_in_love > 100, 99, years_in_love)
    ) |>
    melt.data.table(
      measure.vars = c('love','married'), variable.name = 'type', value.name = 'value'
    ) |>
    (\(x) x[, .N, by = c('type','value')])()
}
# equal?
full_function(Data)
full_function2(Data)
full_function3(Data)
# I think so

# speed comparison
microbenchmark::microbenchmark(
  original = full_function(Data),
  improved = full_function2(Data),
  improved2= full_function3(Data),
  times = 100
)
