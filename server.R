
library(tidyverse)
library(ggplot2)


#Define a server for the shiny app
function(input, output) {
  
  #fill in the blank page with the graph
  output$sleephealthplot <- renderPlot({
    
    #render a barplot
    new_tidy_table                                   %>%
      filter(sleep_loss_stress%in% input$sleephealthvariable,
             alert_rating%in% input$sleephealthvariable)         %>%
      ggplot(aes(sleep_loss_stress, fill = alert_rating))                            +
      scale_fill_manual(values = c("#99CCFF", "#FF9933", "#FF3333", "#FFFFCC")) +
      geom_density(alpha = 0.6)                                                 +
      xlab("Stress about sleep loss")                                                           +
      ylab("Frequency")                                                           +
      labs(fill = "Alert ratings")
  }
    
  )
}



    
  