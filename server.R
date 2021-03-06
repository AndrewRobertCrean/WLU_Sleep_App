
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
source("Interactive_Leaflet.R")
source("Midha's data/Railroad data script.R")

#500 Cities

function(session, input, output) {
  
  #heat map of 500 cities sleep health
  output$citiesLeaflet <- renderLeaflet({ 
    Final_Leaflet
  })

  #Railroad Data
  
  #Define a server for the shiny app
  #already done
    
    #fill in the blank page with the graph
    output$sleephealthplot <- renderPlot({
      
      #render a correlation graph

        ggplot(scatterplot_variables, aes_string(input$x_axis_input, input$y_axis_input))                            +
        geom_count(color = "blue", alpha = 0.2) +  scale_size_continuous(range = c(6, 12)) + 
        labs(
          x = "Sleep health variable",
          y = "Outcome"
        )
        
    })
    
    #upadte drop down list in case of event 

    
    #add a geom-tile graph
    output$tilegraph <- renderPlot({
     
       ggplot(boxplot_variables, aes_string(input$x_axis_tile, input$y_axis_tile)) + geom_tile(aes(fill = sleep_loss_stress), alpha = 0.4)+ 
        labs(
          x = "Sleep health variable",
          y = "Outcome"
        )
      
    })
    
    
    #add a barplot
    output$bargraph <- renderPlot({
      
      ggplot(boxplot_variables, aes_string(input$x_axis_bargraph, fill = input$checkbox_var)) + geom_bar(alpha = 0.6) + labs(
        x = "Sleep health variable",
        y = "Frequency"
      )
      
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
  
  output$summary <- renderPrint({
    
    fit   <- aov(PVEH_SEV ~ IMPAIRMENT_TYPE, data = finimpdam)
    summary(fit)
    
  })
  
}


