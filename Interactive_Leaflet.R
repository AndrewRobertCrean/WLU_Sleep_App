library(leaflet)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(stringr)

source("~/Sleep_App/Andrew Crean/500 Cities Cleaning.R")

pal2 <- colorQuantile("RdYlBu", reverse = TRUE, Sleep_and_Geolocation$Data_Value, n = 10)

leaflet(data = Sleep_and_Geolocation_Clean)%>%
  addProviderTiles(providers$Stamen.Toner)%>%
  addCircles(label = Sleep_and_Geolocation_Clean$CityName, 
             popup = paste("", Sleep_and_Geolocation_Clean$CityName, "<br>",
                           "Risk Level:", Sleep_and_Geolocation_Clean$RiskLevel, "<br>",
                           "Percentage Poor Sleepers:", Sleep_and_Geolocation_Clean$Data_Value, "<br>",
                           "Latitude:", Sleep_and_Geolocation_Clean$lat, "<br>",
                           "Longitude:", Sleep_and_Geolocation_Clean$long),
             color = ~pal2(Data_Value),
             radius = (Sleep_and_Geolocation_Clean$Data_Value*100)) %>%
  addLegend(title = "Percentage Gradient", pal = pal2, values = ~Data_Value, opacity = 1)





