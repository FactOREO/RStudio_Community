setwd("C:/Users/hdust/OneDrive/Master Finance/R/RStudio_Community/request_148617")
# get all .txt files from directory
files <- list.files(pattern = 'txt$')
files

my_function <- function(dataset_name, filter_condition = 'yes'){
  # extract compound (everything before the first underscore)
  compound <- stringr::str_extract(string = dataset_name, pattern = '^[^_]+')
  # extract concentration (everything in between a minus and an underscore)
  concentration <- gsub(".*-(.+)_.*", "\\1", dataset_name)
  
  read.delim(dataset_name) |>
    dplyr::filter(included == filter_condition) |> 
    dplyr::mutate(
      # as.character() to avoid conflicts of different formats
      compound = as.character(compound),
      concentration = concentration
    )
}

result <- purrr::map(files, my_function) |>
  data.table::rbindlist()
head(result)
