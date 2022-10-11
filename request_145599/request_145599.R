library("Amelia")
library("tidyverse")
library('wrapr')

my_data <- wrapr::build_frame(
  "ID"   , "1", "2", "3", "4"     , "5" |
    "P1" , 100, 100, 100, 40      , 60  |
    "P2" , 100, 60 , 80 , 80      , 40  |
    "P3" , 100, 100, 100, 100     , 100 |
    "P4" , 40 , 90 , 60 , 40      , 0   |
    "P5" , 60 , 80 , 80 , 80      , 0   |
    "P6" , 100, 100, 100, 100     , 25  |
    "P7" , 90 , 100, 80 , NA_real_, 50  |
    "P8" , 80 , 100, 100, 80      , 75  |
    "P9" , 25 , 90 , 98 , 95      , 90  |
    "P10", 26 , 35 , 40 , 50      , 35  |
    "P11", 100, 100, 100, 80      , 30  )

my_data_im <- amelia(data.frame(my_data), m = 5, idvars = "ID", emburn = c(0, 1000), bound = rbind(c(5, 0, 100)))

list_im_prep_A <- lapply(my_data_im$imputations, function(x) x %>% select('X4')) 
list_im_prep_A
