Tone <- c("no", "yes", "no", "yes")
One <- c( "correct", "correct", "correct", "incorrect")
Two <- c("correct", "incorrect", "correct", "incorrect")
Three <- c("incorrect", "incorrect", "correct", "correct")

Data <- data.frame(
  Tone = rep(Tone, 3),
  Number = factor(rep(c('One','Two','Three'), each = 4),
                  levels = c('One','Two','Three')),
  Result = c(One,Two,Three)
)

ftable(Data$Result, Data$Tone, Data$Number)

# hacky
Tone <- c("no", "yes", "no", "yes")
One <- c( "correct", "correct", "correct", "incorrect")
Two <- c("correct", "incorrect", "correct", "incorrect")
Three <- c("incorrect", "incorrect", "correct", "correct")
hacky <- data.frame(
  One = vector(length = 3L),
  `One ` = vector(length = 3L),
  Two = vector(length = 3L),
  `Two ` = vector(length = 3L),
  Three = vector(length = 3L),
  `Three ` = vector(length = 3L)
)
hacky[1,] <- rep(c('correct','incorrect'),3)
hacky[c(2,3),c(1,2)] <- table(Tone,One)
hacky[c(2,3),c(3,4)] <- table(Tone,Two)
hacky[c(2,3),c(5,6)] <- table(Tone,Three)
hacky
