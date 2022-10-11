library(dplyr)
library(ggplot2)

fWAR_labs <- paste(seq.default(-2,7,1),'to',seq.default(-1,8,1))

WAR21 <- data.frame(
  fWAR = factor(fWAR_labs, levels = fWAR_labs),
  n    = c(10,1343,562,171,86,52,36,15,7,2)
) |>
  mutate(Percent = n / sum(n),
         label = paste0(n, ' (',round(100 * Percent,1),' %)'))

ggplot(WAR21, aes(fWAR,n))+
  geom_histogram(fill='steelblue', col='black', stat = 'identity') +
  geom_text(aes(y = n + 50, label = label), size = 3) +
  labs(title = "2021 MLB fWAR Distribution, No PA/IP Minimums") +
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title = element_text(color="#993333", size=13, face="bold"),
    plot.title = element_text(color="Dark Red", size=14, face="bold.italic"),
    axis.text.x = element_text(color = "dark red", size = 9, face ="bold"))

# labels above
ggplot(WAR21, aes(fWAR,n))+
  geom_histogram(fill='steelblue', col='black', stat = 'identity') +
  geom_text(aes(y = n + 50, label = n), size = 3) +
  geom_text(aes(y = n + 100, label = scales::percent(Percent, accuracy = 0.1)), size = 3) +
  labs(title = "2021 MLB fWAR Distribution, No PA/IP Minimums") +
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title = element_text(color="#993333", size=13, face="bold"),
    plot.title = element_text(color="Dark Red", size=14, face="bold.italic"),
    axis.text.x = element_text(color = "dark red", size = 9, face ="bold"))
