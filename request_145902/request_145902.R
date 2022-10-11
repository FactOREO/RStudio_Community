library(dplyr)
library(rstatix)

ctrl_list <- 5
comp_list <- 4
values_val <- "737704.91803, 708661.41732, 1298701.29870, 1215066.82868, 750000.00000, 74074074.07407, 75757575.75758, 74074074.07407, 68965517.24138"

# names_val <- c()
names_val <- vector(length = 0L)
for (i in 1:length(ctrl_list)) {
  for (j in 1:ctrl_list[i]) {
    names_val <- c(names_val, paste("Ctrl", i, sep = ""))
  }
}

for (i in 1:length(comp_list)) {
  for (j in 1:comp_list[i]) {
    names_val <- c(names_val, paste("Comp", i, sep = ""))
  }
}

SSParameter <- data.frame(
  Population = names_val,
  ThresholdVoltage = values_val
)

ctrl_names_ss <- c()

for (i in 1:ctrl_list) {
  ctrl_names_ss <- c(ctrl_names_ss, paste("Ctrl", i, sep = ""))
}

comp_names_ss <- c()

for (i in 1:comp_list) {
  comp_names_ss <- c(comp_names_ss, paste("Comp", i, sep = ""))
}

SSParameter$Population <- factor(SSParameter$Population, levels = c(ctrl_names_ss, comp_names_ss))
SSParameter <- group_by(SSParameter, Population)
# Normality
return_val <- shapiro_test(SSParameter, ThresholdVoltage)
c(return_val$p[1], return_val$p[2])