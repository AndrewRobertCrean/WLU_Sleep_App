#Calling libraries#

library(dplyr)
library(tidyverse)
library(ggplot2)
library(stringr)

#Piping for Sleep Variable#

FiveHundredCitiesCompressed <- readRDS("~/Sleep_App/Andrew Crean/FiveHundredCitiesCompressed.RDS")

Five_Hundred_Cities_Sleep_na <- FiveHundredCitiesCompressed %>%
  select(Year, StateAbbr, CityName, Measure, Data_Value, PopulationCount, GeoLocation) %>% 
  filter(Measure == "Sleeping less than 7 hours among adults aged >=18 Years")

#Removing Missing Data Points#

Five_Hundred_Cities_Sleep <- 
  Five_Hundred_Cities_Sleep_na[complete.cases(Five_Hundred_Cities_Sleep_na), ]

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

#Adding Back GeoLocation#
  #Part One: Cleaning the Geolocation Data#
Five_Hundred_Cities_Sleep_Geo <- Five_Hundred_Cities_Sleep[,c("CityName", "GeoLocation", "Data_Value")]

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

  #Part Two: Joining#
Sleep_and_Geolocation <- left_join(Five_Hundred_Cities_Individuals_per_City,
                                   Five_Hundred_Cities_Sleep_Geo,
                                   by = "CityName")

#"Risk Level" Command#

Sleep_and_Geolocation_Clean$RiskLevel <-
  print(if_else(Sleep_and_Geolocation_Clean$Data_Value >= 35, "High Risk", "Low Risk"))

##Organized Sleep
Sleep_and_Geolocation_Clean <- Sleep_and_Geolocation[c(1,4,5,2,3)]
