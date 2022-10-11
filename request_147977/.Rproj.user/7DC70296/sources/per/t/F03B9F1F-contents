# create dummy data
Data <- data.frame(
  user_id = LETTERS[1:10],
  books = sample(c(FALSE,TRUE),10,replace = TRUE,prob = c(0.2,0.8)),
  movies = sample(c(FALSE,TRUE),10,replace = TRUE, prob = c(0.2,0.8)),
  discount = sample(x = seq.default(0,50,10), size = 10, replace = TRUE)
)
Data

# in a single line
mean(subset(Data, subset = books & movies)$discount)

# using pipes to create more human readable code
Data |>
  subset(books & movies) |>
  with(discount) |>
  mean()

# operating with subsets inside a data.frame
mean(Data[which(Data$books & Data$movies),]$discount)
