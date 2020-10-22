)
library(nycflights13)
library(ggplot2)
view()

ggplot(flights, aes(month, dep_delay)) + geom_bar(stat = 'identity')

function(input, output) {
  
  output$distancePlot <- renderPlot(
    {
      flights %>%
        filter(
          carreir %in% input$airline
        ) %>%
        ggplot(
          aes(
            distance,
            air_time
          ) +
            geom_point(
              
            )
        )
    }
  )
  
}

library(tidyverse)

flights %>%
  ggplot(
    aes(distance, airtime)
  ) +
  geom_point()
  