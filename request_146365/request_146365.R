library(data.table)
library(collapse)
data <- data.table(
  person = LETTERS[1:4],
  start = c(as.ITime('2:50'),as.ITime('2:55'),as.ITime('3:00'),as.ITime('3:25')),
  end = c(as.ITime('3:10'),as.ITime('3:05'),as.ITime('3:20'),as.ITime('3:30'))
)

data |>
  roworder(start,end) |>
  fmutate(
    # interval starts before the one beforehand ends
    intersect_start_lag  = start < shift(end),
    # interval ends before the one beforehand ends
    intersect_end_lag    = end < shift(end),
    # interval starts 
    intersect_start_lead = start > shift(end, type = 'lead'),
    intersect_end_lead   = end > shift(start, type = 'lead') 
    ) |>
  fsubset(intersect_start_lag | intersect_end_lag | intersect_start_lead | intersect_end_lead) |>
  fmutate(
    intersection_length = fcase(
      # intersection is complete inside another interval
      intersect_start_lag & !intersect_end_lead, (end - start) |> as.numeric()/60,
      # interval which is complete arround another interval
      (is.na(intersect_start_lag) | !intersect_start_lag) & intersect_end_lead, (shift(end,type='lead') - shift(start,type='lead')) |> as.numeric()/60,
      default = 0
    )
  )
  
  
  # long format
  melt.data.table(measure.vars = c('start','end')) |>
  # sort rows
  roworder(value, variable) |>
  # drop persons that are consecutive, but only if there are no uncompleted persons before
  fsubset(
    # incomplete intersection
    
  )
