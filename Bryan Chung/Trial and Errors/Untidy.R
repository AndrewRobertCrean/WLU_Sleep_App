library(tidyverse)
library(shiny)

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

new <- finimpdam %>%
  group_by(
    ST_CASE
  ) %>%
  mutate(
    indi_case = row_number())


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
  
  fluidRow(
    sidebarPanel(
      selectInput(
        "x_axis",
        "Choose an X",
        choice = colnames(df)
      ),
      selectInput(
        "y_axis",
        "Choose a Y",
        choice = colnames(df)
      )
    ),
    mainpanel(
      plotOutput(
        "name"
      )
    )
  )
  
  output$name <- renderPlot({
    
    ggplot(
      df, 
      aes_string(
        input$x_axis,
        input$y_axis
        ) +
        geom_point()
      )
    
  })
  
  fit <- aov(x ~ y, data = df)
  summary(fit)
  
  fit <- aov(PVEH_SEV ~ IMPAIRMENT_TYPE, data = finimpdam)
summary(fit)


view(mtcars)

mtcars <- view(mtcars)

fit <- aov(mpg ~ cyl, data = mtcars)
summary(fit)
