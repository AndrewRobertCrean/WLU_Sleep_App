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

Five_Hundred_Cities_Sleep_Geo$x <- sapply(strsplit(Five_Hundred_Cities_Sleep_Geo$GeoLocation, ","),
                                          function(x) {
                                            as.numeric(substring(x[1],first = 2, last = str_length(x[1])))
                                          })

Five_Hundred_Cities_Sleep_Geo$y <- sapply(strsplit(Five_Hundred_Cities_Sleep_Geo$GeoLocation, ","),
                                          function(x) {
                                            as.numeric(substring(x[2],first = 1, last = str_length(x[2])-1))
                                          })

Five_Hundred_Cities_Sleep_Geo <- Five_Hundred_Cities_Sleep_Geo %>%
  group_by(CityName) %>%
  summarise(x = mean(x), y = mean(y))

View(Five_Hundred_Cities_Sleep_Geo)

  #Part Two: Joining#
Sleep_and_Geolocation <- left_join(Five_Hundred_Cities_Individuals_per_City, Five_Hundred_Cities_Sleep_Geo, by = "CityName")
View(Sleep_and_Geolocation)

#"Risk Level" Command#

Sleep_and_Geolocation$RiskLevel <- 
  ifelse((Sleep_and_Geolocation$Data_Value>=35),
         "High Risk", "Low Risk")

View(Sleep_and_Geolocation)

#Who is High/Low Risk

View(Sleep_and_Geolocation)

High_Risk_Cities <- filter(Sleep_and_Geolocation, RiskLevel == "High Risk")

View(High_Risk_Cities)

Low_Risk_Cities<- filter(Sleep_and_Geolocation, RiskLevel == "Low Risk")

View(Low_Risk_Cities)

#Breakdown into 19, 25 City Dataframes (Alphabetically)#

Visual_1 <- Five_Hundred_Cities_Individuals_per_City [1:25,]
Visual_2 <- Five_Hundred_Cities_Individuals_per_City [26:50,]
Visual_3 <- Five_Hundred_Cities_Individuals_per_City [51:75,]
Visual_4 <- Five_Hundred_Cities_Individuals_per_City [76:100,]
Visual_5 <- Five_Hundred_Cities_Individuals_per_City [101:125,]
Visual_6 <- Five_Hundred_Cities_Individuals_per_City [126:150,]
Visual_7 <- Five_Hundred_Cities_Individuals_per_City [151:175,]
Visual_8 <- Five_Hundred_Cities_Individuals_per_City [176:200,]
Visual_9 <- Five_Hundred_Cities_Individuals_per_City [201:225,]
Visual_10 <- Five_Hundred_Cities_Individuals_per_City [226:250,]
Visual_11 <- Five_Hundred_Cities_Individuals_per_City [251:275,]
Visual_12 <- Five_Hundred_Cities_Individuals_per_City [276:300,]
Visual_13 <- Five_Hundred_Cities_Individuals_per_City [301:325,]
Visual_14 <- Five_Hundred_Cities_Individuals_per_City [326:350,]
Visual_15 <- Five_Hundred_Cities_Individuals_per_City [351:375,]
Visual_16 <- Five_Hundred_Cities_Individuals_per_City [376:400,]
Visual_17 <- Five_Hundred_Cities_Individuals_per_City [401:425,]
Visual_18 <- Five_Hundred_Cities_Individuals_per_City [426:450,]
Visual_19 <- Five_Hundred_Cities_Individuals_per_City [451:474,]

#Top 10 Visualization#

Visual_Top_Ten <- 
  Five_Hundred_Cities_Individuals_per_City [c("New York", "Los Angeles", "Chicago",
                                              "Houston", "Philidephia", "Phoenix", 
                                              "San Antonio", "San Diego", "Dallas", 
                                              "San Jose"),]
View(Visual_Top_Ten)

str(Five_Hundred_Cities_Individuals_per_City)

#High Risk Visualization#

Visual_High_Risk_plot<- ggplot(Five_Hundred_Cities_Individuals_per_City_High,
                               aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))

#Basic Count Boxplots#

Visual_1_plot<- ggplot(Visual_1, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_2_plot<- ggplot(Visual_2, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_3_plot<- ggplot(Visual_3, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_4_plot<- ggplot(Visual_4, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_5_plot<- ggplot(Visual_5, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_6_plot<- ggplot(Visual_6, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_7_plot<- ggplot(Visual_7, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_8_plot<- ggplot(Visual_8, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_9_plot<- ggplot(Visual_9, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_10_plot<- ggplot(Visual_10, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_11_plot<- ggplot(Visual_11, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_12_plot<- ggplot(Visual_12, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_13_plot<- ggplot(Visual_13, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_14_plot<- ggplot(Visual_14, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_15_plot<- ggplot(Visual_15, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_16_plot<- ggplot(Visual_16, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_17_plot<- ggplot(Visual_17, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_18_plot<- ggplot(Visual_18, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))
Visual_19_plot<- ggplot(Visual_19, aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))

#Combining all 19 Boxplots# (NEVER COMPLETED)

ggarrange(Visual_1_plot, Visual_2_plot,Visual_3_plot,Visual_4_plot,Visual_5_plot,
          Visual_6_plot, Visual_7_plot,Visual_8_plot,Visual_9_plot,Visual_10_plot,
          Visual_11_plot, Visual_12_plot,Visual_13_plot,Visual_14_plot,Visual_15_plot,
          Visual_16_plot, Visual_17_plot,Visual_18_plot, Visual_19_plot)

