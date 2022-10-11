setwd("C:/Users/hdust/OneDrive/Master Finance/R/RStudio_Community/request_147220")

library(collapse)
library(data.table)

data <- fread('dataframe.csv', select = c(2,3))

# 1st step: subsetting and identifying clusters of 6 or more consecutive hours
the_hours <- data |>
  fmutate(
    diff = Data - shift(Data),
    flag = fcumsum(
      fcase(
        is.na(diff), 0L,
        diff == 1, 0L,
        default = 1L
      )
    ),
    length = GRPN(flag)
  ) |>
  fsubset(length > 5) |>
  # EDIT: add day variables to make IDs by day
  fmutate(day = lubridate::as_date(Data)) |>
  # EDIT: new grouping variable to avoid conflicts intraday (e.g. a one hour gap)
  (\(x)x[ , id := .GRP, by = c('day','flag')])() |>
  fselect(id, Data)

# 2nd step: get only those dates, which are in a group of 3 consecutive days
the_dates <- data |>
  (\(x) x[the_hours, on = 'Data'])() |>
  fmutate(day = lubridate::as_date(Data)) |>
  fsummarise(day = funique(day)) |>
  fmutate(diff = as.numeric(day - shift(day)),
          flag = fcumsum(
            fcase(
              is.na(diff),0L,
              diff == 1, 0L,
              default = 1L
              )
            ),
          length = GRPN(flag)) |>
  fsubset(length > 2) |>
  fselect(day)

# 3rd step: match the relevant days and the relevant hours and apply condition
result <- data[the_hours, on = 'Data'] |>
  fmutate(day = lubridate::as_date(Data)) |>
  (\(x) x[the_dates, on = 'day'])() |>
  # filter for clusters of 6 1s
  fmutate(
    temp_flag = fifelse(Temperatura %inrange% c(21,29), 1L, 0L)
    ) |>
  fgroup_by(day, id) |>
  fsubset(temp_flag == 1) |>
  fungroup() |>
  fgroup_by(id) |>
  fmutate(
    # weird things happen if stated in a single line
    shift_Data = shift(Data),
    diff = Data - shift_Data,
    diff_greater1 = fcumsum(fifelse(diff > 1, 1L, 0L, na = 0L))) |>
  fungroup() |>
  ftransform(
    temp_flag = fcumsum(temp_flag, list(id,diff_greater1))
  ) |>
  fgroup_by(day) |>
  fsummarise(
    consec_hours_inrange = fmax(temp_flag)
  ) |>
  fungroup() |>
  fmutate(more_than_six = fifelse(consec_hours_inrange > 5, 1L, 0L)) |>
  fsubset(more_than_six == 1L) |>
  # filter for groups of 3 or more days again
  fmutate(diff = as.numeric(day - shift(day)),
          flag = fcumsum(
            fcase(
              is.na(diff),0L,
              diff == 1, 0L,
              default = 1L
            )
          ),
          length = GRPN(flag)) |>
  fsubset(length > 2) |>
  fselect(day, consec_hours_inrange, flag) |>
  fgroup_by(flag) |>
  fsummarise(
    total_days = lubridate::interval(start = fmin(day), end = fmax(day))
  ) |>
  fungroup()

# 4th step: Split the interval into chunks of length 3 days
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

result |>
  # if there were more than 1 interval
  rsplit(~ flag) |>
  rapply2d(intervall_splitting, period = 3) |>
  unlist2d() |>
  # apply points
  fmutate(points = 20L) |>
  ftransform(points = fcumsum(points))
