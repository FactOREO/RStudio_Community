PN <- c("661_50379",
        "661_50379",
        "661_50379",
        "661_08935",
        "661_10857",
        "661_13261",
        "661_13268",
        "661_13268",
        "661_15672",
        "661_13519"
)

SN <- c("XXXF20J4KXKV",
        "XXXF20J4KXKV",
        "XXXF20J4KXKV",
        "DMXD90ORE72R",
        "DMXD90ORE72R",
        "3PC000305928ZZZZ",
        "3PC000305928ZZZZ",
        "H6RHNB2B1059",
        "F71DP3V00GRD",
        "F2LF908B0D3Y"
        
)

TIME <- c("23:53:36",
          "11:27:31",
          "13:56:34",
          "13:03:15",
          "10:30:59",
          "11:19:47",
          "11:06:22",
          "11:22:17", 
          "11:22:17",
          "21:17:48" 
)


#CREATE DATAFRAME NAMED "dup" 
dup <- data.frame(PN, SN, TIME)

# keep only the row with latest time if duplicate
library(fastverse)

dup |>
  # transform to IDate
  fmutate(TIME = as.ITime(TIME)) |>
  # order by all columns, TIME decreasing
  roworder(PN,SN,-TIME) |>
  # add a counter and keep only if the counter is equal to one
  fmutate(
    counter = 1L
  ) |>
  ftransform(
    counter = fcumsum(counter, list(PN,SN))
  ) |>
  fsubset(counter == 1L) |>
  fselect(-counter)

# the same, but in dplyr and lubridate
dup |>
  dplyr::mutate(TIME = lubridate::hms(TIME)) |>
  dplyr::arrange(PN,SN,-TIME) |>
  dplyr::group_by(PN,SN) |>
  dplyr::mutate(counter = 1:dplyr::n()) |>
  dplyr::filter(counter == 1) |>
  dplyr::select(-counter)

# speed comparison
microbenchmark::microbenchmark(
  dup |>
    # transform to IDate
    fmutate(TIME = as.ITime(TIME)) |>
    # order by all columns, TIME decreasing
    roworder(PN,SN,-TIME) |>
    # add a counter and keep only if the counter is equal to one
    fmutate(
      counter = 1L
    ) |>
    ftransform(
      counter = fcumsum(counter, list(PN,SN))
    ) |>
    fsubset(counter == 1L) |>
    fselect(-counter),
  dup |>
    dplyr::mutate(TIME = lubridate::hms(TIME)) |>
    dplyr::arrange(PN,SN,-TIME) |>
    dplyr::group_by(PN,SN) |>
    dplyr::mutate(counter = 1:dplyr::n()) |>
    dplyr::filter(counter == 1) |>
    dplyr::select(-counter),
  times = 50
)
