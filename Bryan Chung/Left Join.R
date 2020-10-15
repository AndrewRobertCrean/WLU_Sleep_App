#Left Join

impdam_yurr <- left_join(
  read.csv("Bryan Chung/Data_BC/yurrDRIMPAIR.csv") %>%
    select(s
      c(
        2,
        4
      )
    ),
  read.csv("Bryan Chung/Data_BC/yurrPARKWORK.csv") %>%
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

#2018
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

#2017
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

#2016
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

#2015
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

#2014
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

