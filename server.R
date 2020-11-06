# Reading necessary packages
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(lubridate)
library(leaflet)
library(stringr)

#Pull in requried data frames
source("Bryan Chung/Driver Impairment and Extent of Damage final.R")
source("Andrew Crean/500 Cities Cleaning.R")
source("Interactive_Leaflet.R")

#500 Cities

function(input, output, session) {
  
  #heat map of 500 cities sleep health
  output$citiesLeaflet <- renderLeaflet({ 
    Final_Leaflet
  })

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
      ) +
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
        title = "Box Plot",
        x = 'Impairment Type',
        y = "Extent of Damage"
      ) + 
      scale_fill_brewer(
        palette = "Blues"
      ) +
      ylim(
        0, 
        6
      )
  })
  
  output$cardenplot <- renderPlot({
    
    finimpdam %>%
      filter(
        IMPAIRMENT_TYPE %in% input$impairment
      ) %>%
      ggplot(
        aes(
          PVEH_SEV,
          fill = IMPAIRMENT_TYPE
        )
      ) +
      geom_density(
        alpha =.2
        ) +
      labs(
        title = "Density Plot",
        x = "Extent of Car Damage",
        y = "Density"
      ) 
    
  })
  
}
