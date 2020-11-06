library(tidyverse)

untidyimp <- finimpdam %>%
  group_by(
    ST_CASE
  ) %>%
  mutate(
    indi_case = row_number()
  ) %>%
  spread(
    IMPAIRMENT_TYPE,
    PVEH_SEV
  )
  
  untidyimp %>%
    ggplot(
      aes(
        `Asleep or Fatigued`
      )
    ) +
    geom_density(
      na.rm = FALSE
    )
  
  finimpdam %>%
    ggplot(
      aes(
        PVEH_SEV,
        fill = IMPAIRMENT_TYPE
      )
    ) +
    geom_density(
      alpha =.5
    ) +
    labs(
      title = "Driver Impairment and Extent of Car Damage",
      x = 'Impairment Type',
      y = "Extent of Damage"
    )
  
  mean(untidyimp$DUI, na.rm = TRUE)
  mean(untidyimp$`Asleep or Fatigued`, na.rm = TRUE)

  plot(untidyimp$DUI, untidyimp$`Asleep or Fatigued`)  
  