library(dplyr)
library(tidyverse)
library(ggpubr)

# Pull in raw data and name it

#Left joining the Driver Impairment Data with Extent of Damage Data
impdam_2018 <- left_join(
  read.csv("Bryan Chung/Data_BC/2018DRIMPAIR.csv") %>%
    select(
      c(
        2,
        4
      )
    ),
  read.csv("Bryan Chung/Data_BC/2018PARKWORK.csv") %>%
    select(
      c(
        2,
        51
      )
    ),
  by = c(
    'ST_CASE'
  )
)

impdam_2017 <- left_join(
  read.csv("Bryan Chung/Data_BC/2017DRIMPAIR.csv") %>%
    select(
      c(
        2,
        4
      )
    ),
  read.csv("Bryan Chung/Data_BC/2017PARKWORK.csv") %>%
    select(
      c(
        2,
        51
      )
    ),
  by = c(
    'ST_CASE'
  )
)

impdam_2016 <- left_join(
  read.csv("Bryan Chung/Data_BC/2016DRIMPAIR.csv") %>%
    select(
      c(
        2,
        4
      )
    ),
  read.csv("Bryan Chung/Data_BC/2016PARKWORK.csv") %>%
    select(
      c(
        2,
        51
      )
    ),
  by = c(
    'ST_CASE'
  )
)

impdam_2015 <- left_join(
  read.csv("Bryan Chung/Data_BC/2015DrImpair.csv") %>%
    select(
      c(
        2,
        4
      )
    ),
  read.csv("Bryan Chung/Data_BC/2015parkwork.csv") %>%
    select(
      c(
        2,
        51
      )
    ),
  by = c(
    'ST_CASE'
  )
)

impdam_2014 <- left_join(
  read.csv("Bryan Chung/Data_BC/2014DRIMPAIR.CSV") %>%
    select(
      c(
        2,
        4
      )
    ),
  read.csv("Bryan Chung/Data_BC/2014PARKWORK.CSV") %>%
    select(
      c(
        2,
        51
      )
    ),
  by = c(
    'ST_CASE'
  )
)

# Label Driver Impairment Type from an integer to character + making it into a new column
labels <- c("Apparently Normal", "Blackout", "Asleep or Fatigued", "Walking with a Cane or Crutches", "Paraplegic or in a Wheelchair", "Impaired Due to Previous Injury", "Deaf", "Blind", "Emotional", "DUI", "Physical Impairment-No Details", "Other Physical Impairment", "Not Reported", "Unknown if Impaired")

names(labels) <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "96", "98", "99")

impdam_2018$IMPAIRMENT_TYPE <- labels[as.character(impdam_2018$DRIMPAIR)]
impdam_2017$IMPAIRMENT_TYPE <- labels[as.character(impdam_2017$DRIMPAIR)]
impdam_2016$IMPAIRMENT_TYPE <- labels[as.character(impdam_2016$DRIMPAIR)]
impdam_2015$IMPAIRMENT_TYPE <- labels[as.character(impdam_2015$DRIMPAIR)]
impdam_2014$IMPAIRMENT_TYPE <- labels[as.character(impdam_2014$DRIMPAIR)]

# Renaming ST_CASE because there are identical state cases every year.

impdam_2018$ST_CASE <- paste("2018_",impdam_2018$ST_CASE)
impdam_2017$ST_CASE <- paste("2017_",impdam_2017$ST_CASE)
impdam_2016$ST_CASE <- paste("2016_",impdam_2016$ST_CASE)
impdam_2015$ST_CASE <- paste("2015_",impdam_2015$ST_CASE)
impdam_2014$ST_CASE <- paste("2014_",impdam_2014$ST_CASE)

#joining data of different years into one

impdam_comb <- rbind(
  impdam_2018,
  impdam_2017,
  impdam_2016,
  impdam_2015,
  impdam_2014
)

# Filter for specifc types of Impairment Data
finimpdam <- filter(
  impdam_comb,
  IMPAIRMENT_TYPE %in% c(
    "Asleep or Fatigued",
    "Blackout",
    "DUI",
    "Other Physical Impairment"
  ),
  PVEH_SEV %in% c(
    "0", "2", "4", "6"
  )
) 


# Here, I try to use ggplot2(Boxplot to be specific)
finimpdam %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV,
      fill = IMPAIRMENT_TYPE
    )
  )+
  geom_boxplot(
    alpha = 0.9
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60, 
      hjust = 1
    )
  ) +
  labs(
    title = "Driver Impairment and Extent of Damage",
    x = 'Impairment Type',
    y = "Extent of Damage"
  ) + 
  scale_fill_brewer(
    palette = "Blues"
  ) +
  ylim(
    0, 
    6
  )

#Here, I try to do ANOVA on the same data
car.aov <- aov(
  IMPAIRMENT_TYPE ~ PVEH_SEV,
  finimpdam
)
summary(car.aov)

#Here, lets make a plot
finimpdam %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV
    )
  ) 
