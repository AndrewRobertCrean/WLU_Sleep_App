
library(tidyverse)
no_sleep_disorder <- filter(railroad_sleep, Diagnosed_Sleep_disorder > 1)
colnames(no_sleep_disorder) <- tolower(colnames(no_sleep_disorder))
sleep_health_RD <- select(no_sleep_disorder, id, age_group,
                          sex, caff_beverages, 
                          if_yes_how_many_daily, alert_at_work,
                          health_status, avg_work_hrs_week, 
                          mentally_drained, phys_drained,
                          emergencies, lack_of_control,
                          job_pressure, resp_for_others_safety,
                          total_life_events
  
                          )
Alertness <- select(sleep_health_RD, alert_at_work, mentally_drained, phys_drained)
Sleep_duration <- 
