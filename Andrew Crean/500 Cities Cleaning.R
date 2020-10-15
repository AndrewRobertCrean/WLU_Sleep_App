#Calling libraries

library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(stringr)

#Need Profs Help

install.packages("ggpubr")

#Piping for Sleep Variable

View(Five_Hundred_Cities)

Five_Hundred_Cities_Sleep_na <- Five_Hundred_Cities %>%
  select(Year, StateAbbr, CityName, Measure, Data_Value, PopulationCount, GeoLocation) %>% 
  filter(Measure == "Sleeping less than 7 hours among adults aged >=18 Years") %>%
  drop_na(CityName)

View(Five_Hundred_Cities_Sleep_na)

#Removing Missing Data Points

Five_Hundred_Cities_Sleep <- 
  Five_Hundred_Cities_Sleep_na[complete.cases(Five_Hundred_Cities_Sleep_na), ]
View(Five_Hundred_Cities_Sleep)

#Percentages to Individual Counts

Five_Hundred_Cities_Sleep$Individuals <- 
  ((Five_Hundred_Cities_Sleep$Data_Value/100) * 
     Five_Hundred_Cities_Sleep$PopulationCount)

#Individual Sums by City

Five_Hundred_Cities_Individuals_per_City <- Five_Hundred_Cities_Sleep %>%
  group_by(CityName) %>%
  summarise(Individuals = sum(Individuals), Data_Value = mean(Data_Value))

Five_Hundred_Cities_Sleep_Grouped <- Five_Hundred_Cities_Sleep %>%
  group_by(CityName)

View(Five_Hundred_Cities_Individuals_per_City)

#Adding Back GeoLocation

inner_join(Five_Hundred_Cities_Individuals_per_City, 
           Five_Hundred_Cities_Sleep, by= c("GeoLocation"))

View(Five_Hundred_Cities_Individuals_per_City)

#"Risk Level" Command

Five_Hundred_Cities_Individuals_per_City$Level <- 
  ifelse((Five_Hundred_Cities_Individuals_per_City$`sum(Individuals)`>=1000000),
         "High Risk", "Low Risk")
print(Five_Hundred_Cities_Individuals_per_City_Level)

View(Five_Hundred_Cities_Individuals_per_City)

#Grouping by Risk

High_Risk_Cities <- (Five_Hundred_Cities_Individuals_per_City$Level == "High Risk")
Five_Hundred_Cities_Individuals_per_City_High <- 
  Five_Hundred_Cities_Individuals_per_City[c(78,94,102,115,179,181,192,
                                             231,285,323,324,368,371),]

View(Five_Hundred_Cities_Individuals_per_City_High)

#Breakdown into 19, 25 City Dataframes (Alphabetically)

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

#Top 10 Visualization

Visual_Top_Ten <- 
  Five_Hundred_Cities_Individuals_per_City [c("New York", "Los Angeles", "Chicago",
                                              "Houston", "Philidephia", "Phoenix", 
                                              "San Antonio", "San Diego", "Dallas", 
                                              "San Jose"),]
View(Visual_Top_Ten)

str(Five_Hundred_Cities_Individuals_per_City)

#High Risk Visualization

Visual_High_Risk_plot<- ggplot(Five_Hundred_Cities_Individuals_per_City_High,
                               aes(CityName, y=`sum(Individuals)`, fill=Level)) + 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 90))

#Basic Count Boxplots

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

#Combining all 19 Boxplots

ggarrange(Visual_1_plot, Visual_2_plot,Visual_3_plot,Visual_4_plot,Visual_5_plot,
          Visual_6_plot, Visual_7_plot,Visual_8_plot,Visual_9_plot,Visual_10_plot,
          Visual_11_plot, Visual_12_plot,Visual_13_plot,Visual_14_plot,Visual_15_plot,
          Visual_16_plot, Visual_17_plot,Visual_18_plot, Visual_19_plot)

#Who is High/Low Risk

Five_Hundred_Cities_Individuals_per_City$High_Risk <- 
  (Five_Hundred_Cities_Individuals_per_City$Data_Value >= 40)

View(Five_Hundred_Cities_Individuals_per_City)

High_Risk_Cities <- filter(Five_Hundred_Cities_Individuals_per_City, High_Risk == "TRUE")

View(High_Risk_Cities)

Low_Risk_Cities<- filter(Five_Hundred_Cities_Individuals_per_City, High_Risk == "FALSE")

View(Low_Risk_Cities)