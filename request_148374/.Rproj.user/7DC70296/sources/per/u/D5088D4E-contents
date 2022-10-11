#create fictitious datasets
df1 <- data.frame(score_a=1:20,
                  sex_a=rep(c("M", "F"), 10))
df2 <- data.frame(score_b=1:20,
                  sex_b=rep(c("M", "F"), 10))
df3 <- data.frame(score_c=1:20,
                  sex_c=rep(c("M", "F"), 10))

data_list <- list(df1, df2, df3)


get_dataset_name <- function(data,contains){
  data_var_names <- names(data)
  if (contains %in% data_var_names) deparse(substitute(data))
}

# works, because you directly input df3 as argument for data
get_dataset_name(df3, 'score_c')
# your problem, because that is what map() (or lapply()) use to apply the function
get_dataset_name(data_list[[3]], 'score_c')
