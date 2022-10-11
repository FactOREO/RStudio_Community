# simple AR without any packages

AR_model <- function(coeffs,horizon,start,plot=FALSE){
  ## initizalize the vector of values
  values <- vector(length = 0L)
  
  ## get the values by recursion
  for(i in seq.default(1,horizon)){
    # initialize starting value
    if(length(values) == 0){
      values[[i]] <- start + rnorm(1)
    } else if( length(values) < length(coeffs) ){
      # as long as not all coefficients can be used, use a shorter version
      # to avoid subscript out of bounds error
      current_values <- length(values)
      values[[i]] <- coeffs[1:current_values] %*% values[(i-1):(i-current_values)] + rnorm(1)
    } else {
      values[[i]] <- coeffs %*% values[(i-1):(i-length(coeffs))] + rnorm(1)
    }
  }
  
  if(plot){
    plot(seq.default(1,horizon,1),values,
                    type='l',main = paste0('Trajectory of AR(',length(coeffs),') Process'),
                    xlab = "", ylab = "")
  }
  
  values

}

coeffs_m1 <- c(0.434,0.217,0.145,0.108,0.087)
coeffs_m2 <- c(0.682,0.346,0,0,0)

AR_model(coeffs = coeffs_m1, horizon = 100, start = 5, plot = TRUE)

