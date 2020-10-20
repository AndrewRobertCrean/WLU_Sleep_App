labels <- c("Apparently Normal", "Blackout", "Asleep or Fatigued", "Walking with a Cane or Crutches", "Paraplegic or in a Wheelchair", "Impaired Due to Previous Injury", "Deaf", "Blind", "Emotional", "DUI", "Physical Impairment-No Details", "Other Physical Impairment", "Not Reported", "Unknown if Impaired")

names(labels) <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "96", "98", "99")

impdam_2018$IMPAIRMENT_TYPE <- labels[as.character(impdam_2018$DRIMPAIR)]

impdam_2018$ST_CASE <- paste("2018_",impdam_2018$ST_CASE)

impdam_2017$IMPAIRMENT_TYPE <- labels[as.character(impdam_2017$DRIMPAIR)]

impdam_2017$ST_CASE <- paste("2017_",impdam_2017$ST_CASE)

impdam_2016$IMPAIRMENT_TYPE <- labels[as.character(impdam_2016$DRIMPAIR)]

impdam_2016$ST_CASE <- paste("2016_",impdam_2016$ST_CASE)

impdam_2015$IMPAIRMENT_TYPE <- labels[as.character(impdam_2015$DRIMPAIR)]

impdam_2015$ST_CASE <- paste("2015_",impdam_2015$ST_CASE)

impdam_2014$IMPAIRMENT_TYPE <- labels[as.character(impdam_2014$DRIMPAIR)]

impdam_2014$ST_CASE <- paste("2014_",impdam_2014$ST_CASE)


