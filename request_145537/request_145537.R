dates <- c('07312021','08122021','11312021')
# Y-m-d format (standard R Date format)
dates |>
  as.Date(format = '%m%d%Y')
# d-m-Y format
dates |>
  as.Date(format = '%m%d%Y') |>
  format('%d-%m-%Y')
