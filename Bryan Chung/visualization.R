impdam_comb %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
       PVEH_SEV,
      na.rm = TRUE
        )
  ) +
  geom_bar(
    stat = 'identity'
  ) + 
  theme(
    axis.text.x = element_text(
      angle = 60, 
      hjust = 1
      )
    )

impdam_comb %>%
  ggplot(
    aes(
      PVEH_SEV,
      fill = IMPAIRMENT_TYPE
    )
  ) +
  geom_density(
  alpha = .2
    )

impdam_comb %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV
    )
  ) +
  geom_point(
    
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60, 
      hjust = 1
    )
  )
