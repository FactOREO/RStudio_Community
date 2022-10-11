# create the data
myData <- iris[,1:5]
myData$meanSplit <- myData[,1] # these are replicates of column 1, not 2 (indexing starts at 1)
myData$Quantiles <- myData[,1]

mean_val <- mean(myData[,1])

# insert values in meanSplit with if - else
for (i in seq.default(1,nrow(myData))){
  if (myData[[i,1]] > mean_val){
    # mean is less then value
    myData$meanSplit[[i]] <- 'Less'
  } else {
    # mean is greater then value
    myData$meanSplit[[i]] <- 'More'
  }
}

# alternative
myData$meanSplit <- ifelse(myData[,1] > mean_val, 'Less', 'More')

# quantiles
myData$Quantiles <- cut(
  myData[,1],
  breaks = quantile(myData[,1])[c(1,2,4,5)],
  labels = c('Low','middle','High'))

head(myData, n = 10)
