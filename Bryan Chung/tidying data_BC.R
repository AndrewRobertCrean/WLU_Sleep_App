library(dplyr)
library(tidyverse)
library(ggplot2)
#install library

impair_2018 <- read.csv("Bryan Chung/Data_BC/2018DRIMPAIR.csv")
damage_2018 <- read.csv("Bryan Chung/Data_BC/2018PARKWORK.csv")
#read the data into R


summary(impair_2018)
summary(damage_2018)
#quick preview of each data set

impair_2018 %>%
  select(
    c(
      2,
      4
    )
  )
#seeing only case number and impairment type from imapir table

cimpair_2018 <- impair_2018 %>%
  select(
    c(
      2,
      4
    )
  )
#creating a new "impair" table with just afromentioned variables

colnames(damage_2018)
#seeing what columns are called

damage_2018 %>%
  select(
    c(
      2,
      51
    )
  )
#seeing only case number and severity of the damage from damage table
cdamage_2018 <- damage_2018 %>%
  select(
    c(
      2,
      51
    )
  )
#creating a new "damage" table with just afromentioned variables

impdam_2018 <- left_join(
  cimpair_2018,
  cdamage_2018,
  by = c(
    'ST_CASE'
         )
)

impair_2017 <- read.csv("Bryan Chung/Data_BC/2017DRIMPAIR.csv")
damage_2017 <- read.csv("Bryan Chung/Data_BC/2017PARKWORK.csv")
#yo
impair_2017 %>%
  select(
    c(
      2,
      4
    )
  )

cimpair_2017 <- impair_2017 %>%
  select(
    c(
      2,
      4
    )
  )

damage_2017 %>%
  select(
    c(
      2,
      51
    )
  )


cdamage_2017 <- damage_2017 %>%
  select(
    c(
      2,
      51
    )
  )

impdam_2017 <- left_join(
  cimpair_2017,
  cdamage_2017,
  by = c(
    'ST_CASE'
  )
)    

df