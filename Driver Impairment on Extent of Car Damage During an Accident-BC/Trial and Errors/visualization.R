library(ggplot2)
library(tidyverse)

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

impdam_comb %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV,
      fill = IMPAIRMENT_TYPE
    )
  )+
  geom_boxplot(
    alpha = 0.9
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60, 
      hjust = 1
    )
  ) +
  labs(
    title = "Driver Impairment and Extent of Damage",
    x = 'Impairment Type',
    y = "Extent of Damage"
  ) + 
  scale_fill_brewer(
    palette = "Blues"
  )

finimpdam %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV,
      fill = IMPAIRMENT_TYPE
    )
  )+
  geom_boxplot(
    alpha = 0.9
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60, 
      hjust = 1
    )
  ) +
  labs(
    title = "Driver Impairment and Extent of Damage",
    x = 'Impairment Type',
    y = "Extent of Damage"
  ) + 
  scale_fill_brewer(
    palette = "Blues"
  ) +
  ylim(
    0, 
    6
  )

finimpdam %>%
  ggplot(
    aes(
      IMPAIRMENT_TYPE,
      PVEH_SEV,
      fill = IMPAIRMENT_TYPE
    )
  )+
  geom_boxplot(
    alpha = 0.9
  ) +
  theme(
    axis.text.x = element_text(
      angle = 60, 
      hjust = 1
    )
  ) +
  labs(
    title = "Driver Impairment and Extent of Damage",
    x = 'Impairment Type',
    y = "Extent of Damage"
  ) + 
  scale_fill_brewer(
    palette = "Blues"
  ) +
  ylim(
    0, 
    6
  )

#another one


