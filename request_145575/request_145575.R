# a Look up table for the differing values
# rows are letters, columns are values
LuT <- matrix(
  data = c(3,2,2,
           2,3,1,
           1,1,3),
  ncol = 3, byrow = TRUE, dimnames = list(LETTERS[1:3],paste0('pos',1:3))
)

chr_to_num <- function(chr_vec, LuT){
  # for variable length
  length_LuT <- ncol(LuT)
  # get the positions and corresponding letters
  chr_mat <- strsplit(chr_vec, split = "")[[1]] |> as.matrix() |> `rownames<-`(paste0('pos',1:length_LuT))
  # apply the Look up Table with the wanted numeric values
  res <- vector(length = 1L)
  
  for (i in seq.default(1,ncol(LuT))){
    res <- res + LuT[[which(chr_mat[[i]] == rownames(LuT)),i]]
  }
  return(res)
}
chr_to_num('AAB', LuT = LuT)
chr_to_num('ABC', LuT = LuT)

# expanded LuT
LuT <- matrix(
  data = c(0,2,0,0,0,2,2,0,0,2,0,
           3,0,0,0,0,0,0,0,0,0,0,
           0,1,3,3,0,1,1,3,0,1,0,
           1,0,0,0,2,0,0,0,2,0,2),
  ncol = 11, byrow = TRUE, dimnames = list(LETTERS[1:4],paste0('pos',1:11))
)
chr_vec <- 'AAAAAAAAAAA'

chr_to_num_flex <- function(chr_vec, LuT){
  # determine if the number of cols of LuT is sufficient for the length of chr_vec
  if (nchar(chr_vec) > ncol(LuT)) return('LuT is not sufficiently large')
  # determine if all letters of chr_vec are present inside LuT
  present_letters <- unique(unlist(strsplit(chr_vec, '')))
  if (length(union(rownames(LuT),present_letters)) > length(rownames(LuT))) return('You have undefined letters in your string')
  
  # the relevant part
  chr_len <- nchar(chr_vec)
  LuT_adj <- LuT[,1:chr_len]
  # for variable length
  LuT_len <- ncol(LuT_adj)
  # get the positions and corresponding letters
  chr_mat <- strsplit(chr_vec, split = "")[[1]] |> as.matrix() |> `rownames<-`(paste0('pos',1:LuT_len))
  # apply the Look up Table with the wanted numeric values
  res <- vector(length = 1L)
  
  for (i in seq.default(1,ncol(LuT_adj))){
    # for every entry in chr_mat, check which letter it is by comparing with the rownames of LuT and assign corresponding value
    res <- res + LuT[[which(chr_mat[[i]] == rownames(LuT_adj)),i]]
  }
  
  return(res)
}

ListWords <- c(
  # good "words"
  'AAAAAAAAAAA','ABABABABABB','ACBCADAD',
  # too long word
  'AAAAAAAAAAAA','ABABABABABABAB',
  # out of range words
  'AAAAAAAAAE','ABABBBV')
lapply(ListWords, chr_to_num_flex, LuT)