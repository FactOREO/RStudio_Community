#create fictitious datasets
df1 <- data.frame(score_a=1:20,
                  sex_a=rep(c("M", "F"), 10))
df2 <- data.frame(score_b=1:20,
                  sex_b=rep(c("M", "F"), 10))
df3 <- data.frame(score_c=1:20,
                  sex_c=rep(c("M", "F"), 10))
#create a function that returns TRUE/FALSE depending on the presence of the column
is_var_here <- function(data, contains){
  
  data_var_names <- names(data) 
  
  if(contains %in% data_var_names){
    
    TRUE
    
  } else {
    
    FALSE
    
  }
  
}
data_list <- list(df1, df2, df3)

# if the data.frames in your list are named, this could work
names(data_list) <- c('df1','df2','df3')

result <- vector(length = length(data_list))
for(l in seq_along(data_list)){
  if (is_var_here(data_list[[l]],'score_c')){
    result[[l]] <- names(data_list[l])
  } else {
    result[[l]] <- NA_character_
  }
}

result