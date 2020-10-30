# Reading necessary packages
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(lubridate)

#Pull in requried data frames
source("Bryan Chung/Driver Impairment and Extent of Damage final.R")


function(input, output) {
  
  #500 Cities
  #output$citiesmap <- renderPlot({
   # leaflet(data = Sleep_and_Geolocation_Clean)%>%
    #  addProviderTiles(providers$Stamen.Toner)%>%
     # addCircles(label = Sleep_and_Geolocation_Clean$CityName, 
      #           popup = as.character(Sleep_and_Geolocation$Data_Value,
       #                               color = ~pal(RiskLevel),
        #                              radius = (Sleep_and_Geolocation_Clean$Data_Value*100))
      #)
#  })
  
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
