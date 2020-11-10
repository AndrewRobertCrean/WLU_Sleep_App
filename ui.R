

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
        "Railroad Dispatchers' Sleep Health", tabName = "railroad", icon = icon("train")
        ),
      menuItem(
        "Fatiguness on Extent of Car Damage", tabName = "car", icon = icon("car-crash")
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
        ),
        fluidRow(
          mainPanel(
            leafletOutput(
              "citiesLeaflet"
            )
          )
        )
      ),
      #"railroad"
      tabItem(
        tabName = "railroad",
        h1(
          strong("Railroad Dispatcher's Sleep and Health Data")
        ),
        br(),
        fluidRow(
          
          
          #generate a row aith sidebar
          sidebarLayout(
            
            #define the sidebar with multiple input
            sidebarPanel(
              selectInput("x_axis_input", "Choose Sleep Health variable:",
                          choices = colnames(boxplot_variables)
                          ),
              selectInput("y_axis_input", "Choose outcome variable:", 
                          choices = colnames(boxplot_variables)),
              hr(),
              helpText("Data from Railroad Dispatcher survery year __ courtesy of__"))  
            
            
            ,
            
            #Create a spot for scatterplot and barplot
            mainPanel(
              plotOutput("sleephealthplot"),
              position = c("left"),
              fluid = TRUE
              
            )
          )
        )
      ),
      
      
      
     
      
      #"car"
      tabItem(
        tabName = "car",
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
            ),
            p(
              "The following data has been obtained via National Highway Traffic Safety Administration Crash Data Systems. This application take an in-depth look into the Fatality Analysius Reporting System from 2014 to 2018",
              style="font-size:13px"  
            )
          ),
          mainPanel(
            plotOutput(
              "carboxplot"
            ),
            h4(
              strong("Remarks:")
            ),
            p(
              "0 = No Damage, 2 = Minor Damage, 4 = Functional Damage, 6 = Disabling Damage",
              style="font-size:13px"  
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
          "The creator of this Shiny application consists of Midha Ahmad '21, Bryan Chung '22 and Andrew Crean '22. Midha and Bryan are both Neuroscience major and Andrew is Biology major at Washington and Lee University.",
          style="font-size:24px"
          ),
        br(),
        p(
          "Thank you for vising our website. We hope our work has offered you a deeper insight into the importance of sleep.",
          style="font-size:24px"
          ),
        br(),
        p(
          "Thanks, ",
          style="font-size:24px"
          ),
        br(),
        p(
          "Midha Ahmad, K. Bryan Chung, Andrew Crean",
          style="font-size:24px"
          ),
        br()
      )
    )
  )

)

