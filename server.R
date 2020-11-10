
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
source("Midha's data/Railroad data script.R")

#500 Cities

function(input, output, session) {

  output$citiesLeaflet <- renderLeaflet({ 
    Final_Leaflet
  })

  #Railroad Data
  
  #Define a server for the shiny app
  #already done
    
    #fill in the blank page with the graph
    output$sleephealthplot <- renderPlot({
      
      #render a correlation graph

        ggplot(boxplot_variables, aes_string(input$x_axis_input, input$y_axis_input))                            +
        geom_count(color = "blue", alpha = 0.2)
        
    })
    
    
    #add a barplot - NEED TO GET THIS FIXED 
    
 
    
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
        6
      )
  })}
  


    
  
