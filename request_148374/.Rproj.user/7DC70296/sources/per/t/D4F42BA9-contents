library('tidyverse')

# added grouping var for flexibility
percentiles <- function(data, group_var, pick_var){
  # added c() call
  quantile <- c(.25, .5, .75)
  # indentation
  data |>
    group_by(!!sym(group_var)) |>
    summarise(
      quant25 = quantile(!!sym(pick_var), probs = quantile[1]),
      quant50 = quantile(!!sym(pick_var), probs = quantile[2]),
      quant75 = quantile(!!sym(pick_var), probs = quantile[3])
    )
  
  # return is not necessary if the last item you evaluate is the output
  # return(quantiles)
}

pick_var_list <- c('disp','wt','qsec')

output_one <- purrr::map(.x = pick_var_list,
                         .f = percentiles,
                         data = mtcars,
                         group_var = 'cyl')
output_one
