# dplyyr is inside tidyverse
# base doesn't need to be loaded
# library(dplyr)
# library(base)
# library(dplyr)

# load packages
library(tidyverse)
library(ggplot2)

# random weights for the sampling
weights <- function(){
  rand <- rlnorm(n = length(seq.default(-1.9,8,.1)))
  rand / sum(rand)
}

Sample_Data <- data.frame(
  year = sample(c(2020,2021),5000,TRUE),
  Type = sample(c('Pitcher','Hitter','WAR'),5000,TRUE),
  WAR  = sample(seq.default(-1.9,8,.1),5000,TRUE,weights()),
  PA   = sample(0:1000,5000,TRUE)
)

graphic_function <- function(
    df,filter_var1 = Type, filter_cond1 = 'WAR', filter_cond2 = 2021,
    title = '2021 MLB fWAR Distribution, No PA/IP Minimums'){

  percentages <- df |>
    filter( {{filter_var1}} == filter_cond1 &
            year == filter_cond2) |>
    mutate( fWAR = cut(WAR, breaks = seq.default(-2,8,1), labels = paste(seq.default(-2,7,1),'to',seq.default(-1,8,1)))) |>
    group_by( fWAR ) |>
    summarise(
      count = n()
    ) |>
    mutate(
      Percent = count / sum(count)
    )
  
  plot <- percentages |>
  # Graphic from here
    ggplot( aes( x = fWAR, y = count ) ) +
    
    ## This is not recommended, since it produces wrong results regarding
    ## the bins, e.g. the intervals you created
    # geom_histogram(
    #   fill = 'steelblue', col = 'black', binwidth = 1, center = 0.5
    #   ) +
    # stat_bin(
    #   aes(y = ..count.., label=..count..),
    #   geom = "text", binwidth = 1, center = 0.5, vjust = -.5) +
    # geom_text(data = percentages,
    #   aes( x = seq.default(-1.5,7.5,1), y = count + 3 * var(df |> filter( {{filter_var1}} == filter_cond1 & year == filter_cond2) |> with(WAR)), label = scales::percent(Percent, accuracy = 0.1) )
    #   ) +
    # scale_x_continuous(
    #   breaks = seq.default(-1.5,7.5,1), labels = paste(seq.default(-2,7,1),'to',seq.default(-1,8,1))
    # ) +
  
    geom_bar(
      stat = 'identity', fill = 'steelblue', col = 'black'
      ) +
    geom_label(
      aes( label = count ), label.size = NA, fill = 'transparent',
      # you will have to play with the nudging here
      nudge_y = 10
    ) +
    geom_label(
      aes( label = scales::percent(Percent,accuracy = 0.1) ), label.size = NA, fill = 'transparent',
      # you will have to play with the nudging here
      nudge_y = 20
    ) +
    labs(
      title = title,
      x = 'fWAR'
    ) +
    theme(
      axis.title.y = element_blank(),
      axis.ticks.y = element_blank(),
      axis.title = element_text(color = "#993333", size = 13, face = "bold"),
      plot.title = element_text(color = "Dark Red", size = 14, face = "bold.italic"),
      axis.text.x = element_text(color = "dark red", size = 9, face ="bold"),
      axis.text.y = element_blank()
      )
  
  return(
    list(
      percentage_vals = percentages,
      graphic         = plot
    )
  )
}

graphic_function(Sample_Data)
