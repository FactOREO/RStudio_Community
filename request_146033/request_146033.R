data <- data.frame(
  USUBJID = c(rep(1,3),rep(2,4)),
  PARAMCD = c('A','A','B','A','A','B','B'),
  AVAL = c(4,5,3,2,1,2,3)
)
library(dplyr)
data |> 
  group_by(USUBJID,PARAMCD) |>
  summarise(AVAL=mean(AVAL,na.rm=TRUE))

# your method
combinesub4<-group_by_at(data,vars(USUBJID,PARAMCD))
combinesub5<-summarise(combinesub4,AVAL=mean(AVAL,na.rm=TRUE))
combinesub5
