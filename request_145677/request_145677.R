data <- mtcars
library(psych)
describeBy(data, group = data$cyl) |> str()
# The result is a list of 3
# each entry is a data.frame with additinal 'describe' and 'psych' classes
my_descriptions <- describeBy(data, group = data$cyl)
library(tidyverse)
write_excel_csv2(my_descriptions[[1]], file = 'my_descriptions.csv')
# if you want separate files, just use another filename
write_excel_csv2(my_descriptions[[2]], file = 'my_descriptions.csv', append = TRUE)
write_excel_csv2(my_descriptions[[3]], file = 'my_descriptions.csv', append = TRUE)

# you can write the descriptions to excel with lapply
# (but won't have the group as separate column and no header since you need append = TRUE)
lapply(my_descriptions, write_excel_csv2, file = 'my_descriptions.csv', append = TRUE)

# you could combine the results and add an id
library(data.table)
write_excel_csv2(rbindlist(my_descriptions, idcol = 'group'), file = 'my_descriptions.csv')
