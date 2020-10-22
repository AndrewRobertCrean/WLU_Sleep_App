library(shiny)

source("sidebar.R")
source("mainpanel.R")

fluidPage(
  titlePanel("Old Faithful Geyser Data"),
  sidebarLayout(sidebar, mainpanel)

##About Sleep homepage#  
  
#tabs of web app pages in the side bar#

fluidPage(
  
  titlePanel("Sleep Health Impact"),
  
  navlistPanel(
    "Sleep Health Impact Analysis",
    tabPanel("500 Cities Sleep Health Data",
             h3("500 Cities Sleep Health Data")
    ),
    tabPanel("Railroad Dispatchers' Sleep Health",
             h3("Railroad Dispatchers' Sleep Health")
    ),
    tabPanel("Type of Impairment and Extent of Damage",
             h3("Type of Impairment and Extent of Damage")
    )
  )
)


##information brochure on the right side#

##Citations or sources used for data##

##500 cities geospatial map data##

##Railroad dispatch workers data with correlational graphs##
  #have a grapgh on the right#
    #have a drop down menu/checklist of six sleep health variables on the left of the graph#
      


##Accident reports due to drowsy driving page## 
