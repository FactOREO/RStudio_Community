intervall_splitting <- function(interval,period = 3){
  # get start and end date
  beginning <- lubridate::as_date(lubridate::int_start(interval))
  ending <- lubridate::as_date(lubridate::int_end(interval))
  # get the difference as a number of days
  difference <- as.numeric(ending - beginning)
  # number of duplicates to create the intervalls within
  data.table::data.table(
    start = beginning
    ) |>
    tidyr::uncount((difference - period + 1)) |>
    collapse::ftransform(
      start = start + 0:(period - 1)
    ) |>
    collapse::fmutate(
      end = start + period
    )
}
