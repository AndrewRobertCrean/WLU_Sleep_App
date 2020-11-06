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
      , img(src='CDC Sleep Requirement.png', align = "center")
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
            ), br(),
            p("The 500 Cities dataset was established by the United States Center for Disease Control and Prevention in 2015, collaborating with The Robert Wood Johnson Foundation. This dataset was created to track 55 chronic illnesses, including sleep deprivation, within U.S. generating a composite view of the health of our nation. States have a range of data points available, spanning from 1 city in states like Vermont to 121 in California. Within the following map, 474 cities with sleep health data available are represented. In the above visualization, “High Risk” cities are considered those who meet or exceed the National average of 35.54562% of individuals reporting poor sleep health.",
                 style="font-size:13px")
          )
        )
      ),
      
      #"railroad"
      tabItem(
        tabName = "railroad",
        h1(
          strong("Railroad Dispatcher's Sleep Health")
        )
      ),
      #"car"
      tabItem(
        tabName = "car",
        h1(
          strong("Fatigueness on Extent of Car Damage during an Accident")
        ),
        br(),
        h3(
          strong("Boxplot")
        ),
        fluidRow(
          sidebarPanel(
            selectInput(
              "impairment" ,
              label = "Select Driver Impairment Type(s):" ,
              choices = unique(
                finimpdam$IMPAIRMENT_TYPE
              ),
              selected = c( 'DUI', 'Asleep or Fatigued', 'Blackout', 'Other Physical Impairment'),
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
        ),
        br(),
        h3(
          strong("Density Plot")
        ),
        fluidRow(
          sidebarPanel(
            selectInput(
              "impairment" ,
              label = "Select Driver Impairment Type(s):" ,
              choices = unique(
                finimpdam$IMPAIRMENT_TYPE
              ),
              selected = c( 'DUI', 'Asleep or Fatigued', 'Blackout', 'Other Physical Impairment'),
              multiple = TRUE
            ),
            p(
              "The following data has been obtained via National Highway Traffic Safety Administration Crash Data Systems. This application take an in-depth look into the Fatality Analysius Reporting System from 2014 to 2018",
              style="font-size:13px"  
            )
          ),
          mainPanel(
            plotOutput(
              "cardenplot"
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
          "Midha Ahamad, K. Bryan Chung, Andrew Crean",
          style="font-size:24px"
          ),
        br()
      )
    )
  )
)

  