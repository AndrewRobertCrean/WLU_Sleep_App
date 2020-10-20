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




impdam_comb %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV
        )
  ) +
  geom_bar(
    stat = 'identity'
  ) + theme(axis.text.x = element_text(angle = 60, hjust = 1))
