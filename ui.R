#####MIDHA'S VERY bad attempts at a basic page

library(shiny)
library(ggplot2)

fluidPage(
  
  #title for the page
  titlePanel("Railroad Dispatcher's Sleep and Health Data"),
  
  #generate a row aith sidebar
  sidebarLayout(
  
    #define the sidebar with one input
    sidebarPanel(
      selectInput("sleephealthvariable", "Choose Sleep Health variable:",
                  choices = colnames(new_tidy_table)),
      checkboxGroupInput("demographic", "Choose demographic:",
                  choices = colnames(Age),
                  selected = NULL,
                  inline = FALSE),
      hr(),
      helpText("Data from Railroad Dispatcher survery year __ courtesy of__")
    ),
  
  #Create a spot for barplot
  mainPanel(
    plotOutput("sleephealthplot"),
    position = c("left"),
    fluid = TRUE
    
  )
)
)