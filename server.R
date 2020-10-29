# Reading necessary packages
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(lubridate)

function(input, output) {
  
  #reactive boxplot for Extent of Car Damage Boxplot
  
  output$carboxplot <- renderPlot({
      finimpdam %>%
        filter(
          IMPAIRMENT_TYPE %in% input$impairment
        ) %>%
        ggplot(
          aes(
            IMPAIRMENT_TYPE,
            PVEH_SEV,
            fill = IMPAIRMENT_TYPE
          )
        )+
        geom_boxplot(
          alpha = 0.9
        ) +
        theme(
          axis.text.x = element_text(
            angle = 60, 
            hjust = 1
          )
        ) +
        labs(
          title = "Driver Impairment and Extent of Car Damage",
          x = 'Impairment Type',
          y = "Extent of Damage"
        ) + 
        scale_fill_brewer(
          palette = "Blues"
        ) +
        ylim(
          0, 
          8
        )
    })
  
}
