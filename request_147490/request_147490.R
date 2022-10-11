setwd("C:/Users/hdust/OneDrive/Master Finance/R/RStudio_Community/request_147490")

files_to_read <- list.files(pattern = "*\\.dta")
files_to_read

selected_reading <- function(file,cols = c('year','y'),cond = 1965){
  haven::read_dta(file, col_select = cols) |>
    dplyr::filter(year >= cond)
}

data.table::rbindlist(l = lapply(files_to_read, selected_reading))