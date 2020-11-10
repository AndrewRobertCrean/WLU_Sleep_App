

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
        ),
        fluidRow(
          column(
            width = 5,
            box(
              title = "Why Sleep Matters", 
              width = NULL, 
              solidHeader = TRUE, 
              status = "primary",
              "A third of US adults report that they usually get less than the recommended amount of sleep. Not getting enough sleep is linked with many chronic diseases and conditions—such as type 2 diabetes, heart disease, obesity, and depression—that threaten our nation’s health. Not getting enough sleep can lead to motor vehicle crashes and mistakes at work, which cause a lot of injury and disability each year. Getting enough sleep is not a luxury—it is something people need for good health. Sleep disorders can also increase a person’s risk of health problems. However, these disorders can be diagnosed and treated, bringing relief to those who suffer from them."
            ),
            box(
              title = "Links for More Information", 
              width = NULL, 
              background = "light-blue",
                a(
                  "NIH Sleep Health Page", 
                  href = "https://www.nhlbi.nih.gov/health-topics/education-and-awareness/sleep-health", 
                  style = "color:LightGray;"
                  ),
                br(),
                a(
                  "NIH Guide to Healthy Sleep", 
                  href = "https://www.nhlbi.nih.gov/health-topics/education-and-awareness/sleep-health/publications-patients", 
                  style = "color:LightGray;"
                  ),
                br(),
                a(
                  "NIH Sleep Related Health Topics", 
                  href = "https://www.nhlbi.nih.gov/health-topics/education-and-awareness/sleep-health/topics", 
                  style = "color:LightGray;"
                  ),
                br()
            )
          ),
          column(
            width = 7,
            box(
              img(
                src = 'dogs_sleeping.jpg',
                width = "100%"
              )
            )
          )
        ),
      br(),
      img(src='CDC Sleep Requirement.png', align = "center", height= "85%", width= "85%"),
      br(),
      p("“CDC - Sleep Home Page - Sleep and Sleep Disorders.” Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, 15 Apr. 2020, www.cdc.gov/sleep/index.html." )
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
          strong("Fatigueness on Extent of Car Damage during an Accident")
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
              selected = c( 'DUI', 'Asleep or Fatigued', 'Blackout', 'Other Physical Impairment'),
              multiple = TRUE
            ),
            p(
              "The following data has been obtained via National Highway Traffic Safety Administration Crash Data Systems. This application take an in-depth look into the Fatality Analysius Reporting System from 2014 to 2018",
              style="font-size:13px"  
            ),
            br(),
            h4(
              strong("Remarks:")
            ),
            p(
              "0 = No Damage, 2 = Minor Damage, 4 = Functional Damage, 6 = Disabling Damage",
              style="font-size:13px"  
            )
          ),
          mainPanel(
            plotOutput(
              "carboxplot"
            ),
            br(),
            plotOutput(
              "cardenplot"
            )
          )
        ),
        br(),
        fluidRow(
          sidebarPanel(
            h4(
              strong("One-way ANOVA")
            ),
            p(
              "",
              style="font-size:13px"  
            ),
            br()
          ),
          mainPanel(
            verbatimTextOutput(
              "summary"
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

