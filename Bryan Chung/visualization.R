impdam_2014 %>%
  group_by(labimpair) %>%
  summarise(avg_damage = mean(PVEH_SEV, na.rm = TRUE)) %>%
  ggplot(aes(labimpair, avg_damagg)) + geom_point()


impdam_2014 %>%
  ggplot(
    aes(
    PVEH_SEV,
    fill = labimpair
    )
  ) +
  geom_density(
    alpha = 0.5
  )

impdam_2014 %>%
  ggplot(
    aes(
      labimpair,
      PVEH_SEV
    )
  ) +
  geom_
    
  )

impdam_2014 %>%
  group_by(labimpair) %>%
  summarise(avg_dam = mean(PVEH_SEV, na.rm = TRUE)) %>%
  ggplot(
    aes(
      labimpair,
      avg_dam
    )
  ) +
  geom_bar(
    state = 
      'identity'
  )
