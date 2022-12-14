data <- data.frame(Id = c(1L,	1L,	1L,	1L,	1L,	2L,	2L,	2L,	2L,	3L,	3L,	3L,	3L,	3L,	4L,	4L,	4L,	4L,	4L),
                   Startdate = c("2020-01-20",	"2020-02-20",	"2020-03-20",	"2020-04-20",	"2020-05-10",	"2020-01-20",	"2020-02-15",	"2020-03-20",	"2020-04-15",	"2020-05-10",	"2020-07-15",	"2020-08-15",	"2020-10-25",	"2020-11-10",	"2020-04-10",	"2020-04-10",	"2020-08-15",	"2020-10-25",	"2020-10-27"),
                   Enddate = c("2020-02-20",	"2020-03-25",	"2020-04-22",	"2020-05-15",	"2020-06-12",	"2020-02-20",	"2020-03-20",	"2020-04-22",	"2020-05-15",	"2020-06-12",	"2020-08-20",	"2020-09-22",	"2020-11-15",	"2021-01-12",	"2020-05-12",	"2020-08-20",	"2020-09-22",	"2020-11-15",	"2021-01-12"),
                   Trt = factor(c("A",	"B",	"C",	"A",	"D",	"A",	"B",	"C",	"D",	"D",	"B",	"C",	"C",	"D",	"D",	"B",	"C",	"C",	"D")),
                   stringsAsFactors = FALSE)

library(data.table)
library(dplyr)
data |>
  group_by(Id) |>
  mutate(
    combined_treat = fcase(
      Startdate < shift(Enddate), paste(shift(Trt),Trt, sep = ' + '),
      default = NA_character_
      )
    )