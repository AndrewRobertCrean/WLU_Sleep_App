# Reading necessary packages
library(shinydashboard)
library(shiny)

dashboardPage(
  dashboardHeader(
    title = 'WLU Sleep App'
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "Introduction", tabName = "introduction", icon = icon("dashboard")
        ),
      menuItem(
        "500 Cities Sleep Health Data", tabName = "cities", icon = icon("map")
        ),
      menuItem(
        "Railroad Dispatchers' Sleep Health", tabName = "railroad", icon = icon("question-circle")
        ),
      menuItem(
        "Fatiguness on Extent of Car Accident", tabName = "eofca", icon = icon("car-crash")
        ),
      menuItem(
        "About", tabName = "about", icon = icon("person-circle")
      )
    )
  ),
  dashboardBody()
)
