labels <- c("Apparently Normal", "Blackout", "Asleep or Fatigued", "Walking with a Cane or Crutches", "Paraplegic or in a Wheelchair", "Impaired Due to Previous Injury", "Deaf", "Blind", "Emotional", "DUI", "Physical Impairment-No Details", "Other Physical Impairment", "Not Reported", "Unknown if Impaired")

names(labels) <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "96", "98", "99")

impdam_2018$labimpair <- labels[as.character(impdam_2018$DRIMPAIR)]

impdam_2017$labimpair <- labels[as.character(impdam_2017$DRIMPAIR)]

impdam_2016$labimpair <- labels[as.character(impdam_2016$DRIMPAIR)]

impdam_2015$labimpair <- labels[as.character(impdam_2015$DRIMPAIR)]

impdam_2014$labimpair <- labels[as.character(impdam_2014$DRIMPAIR)]

