library(tidyverse)
library(ggplot2)


##read file

Dispatchers_Background_Data_2 <- read.csv("~/R/Sleep Health App/Midha's data/Dispatchers_Background_Data 2.csv")

##filter out particpants with diagnosed sleep disorders so they are not included##
no_sleep_disorder <- filter(Dispatchers_Background_Data_2, Diagnosed_Sleep_disorder > 1)

##lower all column names##
colnames(no_sleep_disorder) <- tolower(colnames(no_sleep_disorder))

##create a new table with relevant sleep health variables##
sleep_health_RD <- select(no_sleep_disorder, id, age_group, 
                          sex, caff_beverages, 
                          if_yes_how_many_daily, alert_at_work,
                          health_status, avg_work_hrs_week, 
                          mentally_drained, phys_drained,
                          emergencies, lack_of_control,
                          job_pressure, resp_for_others_safety,
                          total_life_events, sleep_loss,
                          total_years_dispatcher
                          
                          
)

##create sleep health variables##

Sleep_duration_stress <- select(sleep_health_RD, id, sleep_loss)

Alertness <- select(sleep_health_RD, sleep_loss, id, alert_at_work)

Exhaustion <- select(sleep_health_RD, id, sleep_loss, mentally_drained, phys_drained)

Perceived_health <- select(sleep_health_RD, id, health_status)

Time_on_job <- select(sleep_health_RD, id, avg_work_hrs_week)

Age <- select(sleep_health_RD, id, age_group)

Sex <- select(sleep_health_RD, id, sex)

Total_years <- select(sleep_health_RD, id, total_years_dispatcher)


######labelling data##########

#create age variable not coded in numerics#

Age$age_desc <- Age$age_group
labels_age <- c("twenties", "thirties", "fourties", "fifties", "sixties")
names(labels_age) <- c("1", "2", "3", "4", "5")
Age$age_desc <- labels_age[as.character(Age$age_desc)]


##create sleep stress level variables not coded in numerics###

Sleep_duration_stress$sleep_loss_stress <-  Sleep_duration_stress$sleep_loss
labels_stress <- c("no stress", "a little stress","stressed out","very stressed out")
names(labels_stress) <- c("1", "2", "3", "4")
Sleep_duration_stress$sleep_loss_stress <- labels_stress[as.character(Sleep_duration_stress$sleep_loss_stress)]

#create exhaustion variables (mentally plus physically drained) not coded in numerics#

Exhaustion$mentally_drained_stress <- Exhaustion$mentally_drained
labels_stress <- c("no stress", "a little stress","stressed out","very stressed out")
names(labels_stress) <- c("1", "2", "3", "4")
Exhaustion$mentally_drained_stress <- labels_stress[as.character(Exhaustion$mentally_drained_stress)]

Exhaustion$phys_drained_stress <- Exhaustion$phys_drained
labels_stress <- c("no stress", "a little stress","stressed out","very stressed out")
names(labels_stress) <- c("1", "2", "3", "4")
Exhaustion$phys_drained_stress <- labels_stress[as.character(Exhaustion$phys_drained_stress)]

#create health status variable not coded in numerics#

Perceived_health$health_status_rating <- Perceived_health$health_status
labels_health <- c("poor", "fair","good","excellent")
names(labels_health) <- c("1", "2", "3", "4")
Perceived_health$health_status_rating <- labels_health[as.character(Perceived_health$health_status_rating)]  

#create sex variable not coded in numerics# 

Sex$sex_desc <- Sex$sex
labels_sex <- c("male", "female")
names(labels_sex) <- c("1", "2")
Sex$sex_desc <- labels_sex[as.character(Sex$sex_desc)]

#create alertness variable not coded in numerics#

Alertness$alert_rating <- Alertness$alert_at_work
labels_alert <- c("never alert", "occasionally alert", "frequently alert", "always alert")
names(labels_alert) <- c("1", "2", "3", "4")
Alertness$alert_rating <- labels_alert[as.character(Alertness$alert_rating)]


#possibly clean out midpoints of shifts##
#need help with how to do this##

##create a new table with all the new variables recoded##

tidy_table <-  bind_cols(Sex, Age, Sleep_duration_stress, Time_on_job, Total_years, Exhaustion, Alertness, Perceived_health)

##get rid of all the reoeated ID columns##

tidy_table$id1 <- NULL
tidy_table$id2 <- NULL
tidy_table$id3 <- NULL
tidy_table$id4 <- NULL
tidy_table$id5 <- NULL
tidy_table$id6 <- NULL
tidy_table$id7 <- NULL

#final stuff with no numeric fluff edited out##

##get rid of NA data##

new_tidy_table <- na.omit(tidy_table)

##some random visualizations##


ggplot(new_tidy_table, aes(sleep_loss_stress)) + geom_bar()
ggplot(new_tidy_table, aes(age_desc)) + geom_bar()
ggplot(new_tidy_table, aes(alert_rating)) + geom_density()

ggplot(new_tidy_table, aes(sleep_loss_stress, fill = alert_rating)) + geom_density(alpha = 0.2)
ggplot(new_tidy_table, aes(age_desc, fill = sleep_loss_stress)) + geom_density(alpha = 0.2)


#fancy bar graphs with stacked data


ggplot(new_tidy_table, aes(sleep_loss_stress, fill = age_desc)) + geom_bar()
ggplot(new_tidy_table, aes(sleep_loss_stress, fill = sex_desc)) + geom_bar()
ggplot(new_tidy_table, aes(sleep_loss_stress, fill = alert_rating)) + geom_bar()
ggplot(new_tidy_table, aes(sleep_loss_stress, fill = alert_rating)) + geom_bar()
ggplot(new_tidy_table, aes(sleep_loss_stress, fill = mentally_drained_stress)) + geom_bar()
ggplot(new_tidy_table, aes(sleep_loss_stress, fill = phys_drained_stress)) + geom_bar()

ggplot(new_tidy_table, aes(age_group , avg_work_hrs_week)) + geom_point()
ggplot(new_tidy_table, aes(sex_desc , avg_work_hrs_week)) + geom_count(color = "blue", alpha = 0.2)
ggplot(new_tidy_table, aes(sleep_loss_stress , alert_rating)) + geom_count(color = "blue", alpha = 0.2)


## create a table of ratings for boxplot with sleep health variables only

boxplot_variables <- select(new_tidy_table, sleep_loss_stress, 
                            mentally_drained_stress, phys_drained_stress,
                            alert_rating, health_status_rating)

