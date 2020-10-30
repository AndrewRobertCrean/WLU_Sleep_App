library(leaflet)
?leaflet

source("500 Cities Cleaning.R")

str(Five_Hundred_Cities_Sleep_Geo)

pal <- colorFactor(c("red", "green"), domain = c("Low Risk", "High Risk"))
pal2 <- colorQuantile("RdYlBu", reverse = FALSE, Sleep_and_Geolocation$Data_Value, n = 10)

Interactive_Plot <- leaflet(data = Sleep_and_Geolocation_Clean)%>%
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





