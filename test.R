library(tidyverse)
source("R/pru_plots.R")

ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl))) +
  geom_point() +
  theme_minimal() +
  pru_theme() +
  pru_palette("dis4") +
  labs(title = "Car Weight vs. MPG")

