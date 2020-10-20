impdam_2014 %>%
  

impdam_comb %>%
  group_by(IMPAIRMENT_TYPE) %>%
  summarise(avg_damage = mean(PVEH_SEV, na.rm = TRUE)) %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      avg_damage
    )
  ) + 
  geom_point()

impdam_comb %>%
  ggplot(
    aes(
      PVEH_SEV,
      fill = IMPAIRMENT_TYPE
    )
  ) +
  geom_density(
    alpha = 0.2
  )
