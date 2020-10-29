# Reading necessary packages
library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(lubridate)


#dashboard outline for the app
dashboardPage(
  
  # Dashboard header  
  
  dashboardHeader(
    title = 'WLU Sleep App',
    titleWidth = 300
  ),
  
  # Dashboard sidebar menu

  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Home", tabName = "home", icon = icon("home")
        ),
      menuItem(
        "500 Cities Sleep Health Data", tabName = "cities", icon = icon("map-marked")
        ),
      menuItem(
        "Railroad Dispatchers' Sleep Health", tabName = "railroad", icon = icon("question-circle")
        ),
      menuItem(
        "Fatiguness on Extent of Car Accident", tabName = "eofca", icon = icon("car-crash")
        ),
      menuItem(
        "About", tabName = "about", icon = icon("info-circle")
      )
    ),
    
    #had to fit all of our menu name
    width = 300,
    
    collapsed = FALSE
  ),

  # Outline the individual tabs in our application
  dashboardBody(
    tabItems(
      #"home"
      tabItem(
        tabName = "home",
        h1(
          strong("Home")
        )
      ),
      
      #"cities"
      tabItem(
        tabName = "cities",
        h1(
          strong("500 Cities Sleep Health Data")
        )
      ),
      #"railroad"
      tabItem(
        tabName = "railroad",
        h1(
          strong("Railroad Dispatcher's Sleep Health")
        )
      ),
      #"eofca"
      tabItem(
        tabName = "eofca",
        h1(
          strong("Fatigueness on Extent of Car Accident")
        ),
        br(),
        fluidRow(
          sidebarPanel(
            selectInput(
              "impairment" ,
              label = "Select Driver Impairment Type(s):" ,
              choices = unique(
                finimpdam$IMPAIRMENT_TYPE
              ),
              multiple = TRUE
            )
          ),
          mainPanel(
            plotOutput(
              "eofcaboxplot"
            )
          )
        )
      ),
      #"about"
      tabItem(
        tabName = "about",
        h1(
          strong("About")
        ),
        br(),
        br(),
        p(
          "Paragraph 1 of About",
          style="font-size:24px"
          ),
        br(),
        p(
          "Paragraph 2 of About",
          style="font-size:24px"
          ),
        br(),
        p(
          "Thanks, ",
          style="font-size:24px"
          ),
        br(),
        p(
          "Midha Ahamad, K. Bryan Chung, Andrew Crean",
          style="font-size:24px"
          ),
        br()
      )
    )
  )
)

  