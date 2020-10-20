library(shiny)
library(leaflet)
library(flights)
        
fluidPage(

  sidebarPanel(
    selectInput(
      inputId = "airline" ,
      label = "Select airlines:" ,
      choices = unique(
        flights$carrier
        )
    )
  ),
  mainPanel(
    plotOutput(
      "distancePlot"
    )
  )
    
)
