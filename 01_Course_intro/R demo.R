# R Demo

library(palmerpenguins)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(ggbernie)

# Quickly summarize data
summary(penguins)

# Plot relationships between variables
ggplot(penguins, aes(x = bill_length_mm, y = flipper_length_mm, colour = sex)) +
  geom_point() +
  theme_clean()

# Generate many plots
ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, colour = sex)) +
  geom_point() +
  facet_grid(rows = vars(species), cols = vars(island)) +
  theme_few()

# Plot time series
ggplot(penguins %>% group_by(year, species) %>% tally(), 
       aes(x = year, y = n, colour = species)) +
  geom_line() +
  theme_minimal()

# Plot time series with icons
ggplot(penguins %>% group_by(year, species) %>% tally(), 
       aes(x = year, y = n, colour = species)) +
  geom_line() +
  geom_bernie(bernie = "sitting") +
  theme_minimal()


