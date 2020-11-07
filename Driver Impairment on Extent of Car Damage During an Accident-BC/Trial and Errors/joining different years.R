#joining data of different years

impdam_comb <- rbind(
  impdam_2018,
  impdam_2017,
  impdam_2016,
  impdam_2015,
  impdam_2014
)

library(dplyr)


#these are maybe
finimpdam <- filter(
  impdam_comb,
  IMPAIRMENT_TYPE == c(
  "Asleep or Fatigued",
  "Blackout",
  "DUI",
  "Other Physical Impairment"
  )
) 
