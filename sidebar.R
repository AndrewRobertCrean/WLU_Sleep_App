library(shiny)

sidebarLayout(
  sidebarPanel(
    sliderInput("bins", "number of bins:",
                min = 1,
                max = 50,
                value = 30)
  ))
