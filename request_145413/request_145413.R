# define matrix
mat1 <- matrix(c(rep(1:5,3)), ncol = 3)

# define rowCumSum function
colCumSums2 <- function(x) {
  matrix(cumsum(rbind(x,-colSums(x))), ncol=ncol(x))[1:nrow(x),]
}

rowCumSums2 <- function(x) {
  t(colCumSums2(t(x)))
}

# for the for-loop
mat <- matrix(ncol = 3, nrow = 5)

# comparison
rbenchmark::benchmark(
  forloop = for(i in 2:ncol(mat1)){mat[,1] <- apply(mat1[,1:i],1,sum)},
  cumsum  = t(apply(mat1, 1, cumsum)),
  rowSums = rowCumSums2(mat1),
  replications = 1000
)
