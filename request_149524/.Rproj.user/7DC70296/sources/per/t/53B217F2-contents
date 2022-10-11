prob_function <- function(D,S){
  # Vector of P(S)
  prob_S <- c(1:6,5:1)/36
  # Check, if the sum is possible
  if ((S - D) %in% 1:6){
    # Conditional probability of D given S
    (1/6 * 1/6) / prob_S[[(S - 1)]]
  } else {
    cat('No valid input.')
  }
}
prob_function(D = 5, S = 5)
prob_function(D = 1, S = 13)
