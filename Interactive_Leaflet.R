library(leaflet)
?leaflet

source("500 Cities Cleaning.R")

str(Five_Hundred_Cities_Sleep_Geo)

leaflet(data = Sleep_and_Geolocation)%>%
  addTiles()%>%
  addMarkers(lng = Sleep_and_Geolocation$long, lat = Sleep_and_Geolocation$lat,
             label = ~as.character(CityName))
  