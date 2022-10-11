library('tidyverse')
# note the class attribute "data.table"
dataframe1 <- structure(
  list(name = c(rep('Anna',4), rep('Ryan',3),rep('Liam',5)),
       country = c("USA","USA","BRA","BRA","USA","USA","USA",
                   "MEX","MEX","MEX","MEX", "MEX"),
       merge_field = c("CA",NA,NA,NA,NA,"PT",NA,NA,"OX",NA,NA,NA),
       merge_field_down = c("CA","CA","CA","CA",NA,"PT","PT",NA,"OX","OX","OX","OX"),
       merge_field_downup = c("CA","CA","CA","CA","PT","PT","PT","OX","OX","OX","OX","OX"),
       merge_field_up = c("CA",NA,NA,NA,"PT","PT",NA,"OX","OX",NA,NA,NA)),
  row.names = c(NA, -12L),class = c("tbl_df","tbl","data.frame"))
dataframe2 <- structure(
  list(name = c('Anna','Ryan','Liam'),
       country = c('USA','USA','MEX'),
       merge_field = c('CA','PT','OX'),
       merge_field_right = c('merge_field_down','merge_field_up','merge_field_downup')
  ),
  row.names = c(NA, -3L),class = c("tbl_df","tbl","data.frame"))

result <- dataframe1 %>%
  # long format
  pivot_longer(cols = 3:6, values_to = 'value', names_to = 'variable') %>%
  # merge
  left_join(dataframe2, by = 'name') %>%
  # keep, if condition is met
  filter(variable == merge_field_right) %>%
  # keep relevant columns
  select(name,'country' = country.x,'merge_field_right_value' = value,merge_field_right)

result
