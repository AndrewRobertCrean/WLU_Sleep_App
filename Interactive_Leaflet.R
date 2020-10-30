library(leaflet)
?leaflet

source("500 Cities Cleaning.R")

str(Five_Hundred_Cities_Sleep_Geo)

pal <- colorFactor(c("red", "green"), domain = c("Low Risk", "High Risk"))

leaflet(data = Sleep_and_Geolocation_Clean)%>%
  addProviderTiles(providers$Stamen.Toner)%>%
  addCircles(label = Sleep_and_Geolocation_Clean$CityName, 
             popup = as.character(Sleep_and_Geolocation$Data_Value,
             color = ~pal(RiskLevel),
             radius = (Sleep_and_Geolocation_Clean$Data_Value*100))


