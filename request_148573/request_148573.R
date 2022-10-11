pacman::p_load(char = c('collapse','data.table'))
# get some Dummy Data
Data <- data.table(
  ID         = c(200:204),
  Order_Type = factor(c(rep('ordered',4),'received'), levels = c('ordered','received')),
  Quantity   = c(2,3,5,2,15),
  Date       = as.IDate(c('2022-01-10','2022-02-10','2022-02-10','2022-08-10','2022-09-10'))
)

Quantity_Start <- 10L

Data |>
  # sort by ID, just to be on the safe side
  roworder(ID) |>
  fmutate(
    Running_Stock = fifelse(Order_Type == 'ordered', -Quantity, Quantity)
  ) |>
  ftransform(
    Running_Stock = Quantity_Start + fcumsum(Running_Stock)
  )
    