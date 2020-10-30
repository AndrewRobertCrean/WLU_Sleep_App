#Calling libraries#

library(dplyr)
library(tidyverse)
library(ggplot2)
library(stringr)

install.packages("tidyverse")
install.packages("ellipsis")

#Piping for Sleep Variable#

FiveHundredCitiesCompressed <- readRDS("~/Sleep_App/Andrew Crean/FiveHundredCitiesCompressed.RDS")

View(FiveHundredCitiesCompressed)

Five_Hundred_Cities_Sleep_na <- FiveHundredCitiesCompressed %>%
  select(Year, StateAbbr, CityName, Measure, Data_Value, PopulationCount, GeoLocation) %>% 
  filter(Measure == "Sleeping less than 7 hours among adults aged >=18 Years")

View(Five_Hundred_Cities_Sleep_na)

#Removing Missing Data Points#

Five_Hundred_Cities_Sleep <- 
  Five_Hundred_Cities_Sleep_na[complete.cases(Five_Hundred_Cities_Sleep_na), ]
View(Five_Hundred_Cities_Sleep)

#Percentages to Individual Counts#

Five_Hundred_Cities_Sleep$Individuals <- 
  ((Five_Hundred_Cities_Sleep$Data_Value/100) * 
     Five_Hundred_Cities_Sleep$PopulationCount)

#Individual Sums by City#

Five_Hundred_Cities_Individuals_per_City <- Five_Hundred_Cities_Sleep %>%
  group_by(CityName) %>%
  summarise(Individuals = sum(Individuals), Data_Value = mean(Data_Value))

Five_Hundred_Cities_Sleep_Grouped <- Five_Hundred_Cities_Sleep %>%
  group_by(CityName)

View(Five_Hundred_Cities_Individuals_per_City)

#Adding Back GeoLocation#
  #Part One: Cleaning the Geolocation Data#
Five_Hundred_Cities_Sleep_Geo <- Five_Hundred_Cities_Sleep[,c("CityName", "GeoLocation")]
View(Five_Hundred_Cities_Sleep_Geo)

Five_Hundred_Cities_Sleep_Geo$lat <- sapply(strsplit(Five_Hundred_Cities_Sleep_Geo$GeoLocation, ","),
                                          function(x) {
                                            as.numeric(substring(x[1],first = 2, last = str_length(x[1])))
                                          })

Five_Hundred_Cities_Sleep_Geo$long <- sapply(strsplit(Five_Hundred_Cities_Sleep_Geo$GeoLocation, ","),
                                          function(x) {
                                            as.numeric(substring(x[2],first = 1, last = str_length(x[2])-1))
                                          })


Five_Hundred_Cities_Sleep_Geo <- Five_Hundred_Cities_Sleep_Geo %>%
  group_by(CityName) %>%
  summarise(lat = mean(lat), long = mean(long))

View(Five_Hundred_Cities_Sleep_Geo)

  #Part Two: Joining#
Sleep_and_Geolocation <- left_join(Five_Hundred_Cities_Individuals_per_City, Five_Hundred_Cities_Sleep_Geo, by = "CityName")
View(Sleep_and_Geolocation)

#"Risk Level" Command#

Sleep_and_Geolocation_Clean$RiskLevel <- 
  ifelse((Sleep_and_Geolocation$Data_Value>=35),
         "High Risk", "Low Risk")

View(Sleep_and_Geolocation_Clean)

#Who is High/Low Risk

View(Sleep_and_Geolocation)

High_Risk_Cities <- filter(Sleep_and_Geolocation_Clean, RiskLevel == "High Risk")

View(High_Risk_Cities)

Low_Risk_Cities<- filter(Sleep_and_Geolocation_Clean, RiskLevel == "Low Risk")

View(Low_Risk_Cities)

##Organized Sleep
Sleep_and_Geolocation_Clean <- Sleep_and_Geolocation[c(1,4,5,2,3)]
View(Sleep_and_Geolocation_Clean)
