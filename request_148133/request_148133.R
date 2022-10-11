Data <- data.frame(
  ID = seq.default(1,1000,1),
  DIST = round(runif(n = 1000, min = 1, max = 100000), digits = 0)
)

# get the quantiles in 1% increase steps
quants <- quantile(Data$DIST, probs = seq.default(0,1,0.01))

# apply to a new column
Data$range <- cut(Data$DIST, breaks = quants)
Data$group <- cut(Data$DIST, breaks = quants, labels = seq.default(1,100,1))

# result
head(Data)
