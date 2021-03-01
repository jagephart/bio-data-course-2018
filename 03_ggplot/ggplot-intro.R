# Title: ggplot-intro-notes.R

# OBJECTIVE:
## Review different types of graphs
## Become familiar with the grammar of graphics
## Become comfortable using ggplot2 for exploratory data visualization
## Learn how to use color, point types, point size to visualize additional aspects of the data
## Learn to use different geometric layers


#_____________________________________________________________________________________________________#
# Set up
#_____________________________________________________________________________________________________#
## Load the tidyverse package, which includes the ggplot2 package
library(tidyverse)

## Read in the data and get it ready to use.
## Make sure you download the data to your "Data" folder
SpokaneFish <- read.csv(file="Data/LowerSpokaneFish.csv", header=TRUE)

## If you get an error, make sure the data is in the correct folder and check your working directory

# Fix dates using the function "as.Date" which allows you to specify the date format
SpokaneFish$Date <- as.Date(SpokaneFish$Date, "%m/%d/%y")

# TASK: Have a look at the head and structure of SpokaneFish


# TASK: Based on the str command, how many fish species are in the SpokaneFish dataframe?


# Lets focus on just one species, redband trout, which is actually a subspecies of rainbow trout
# Redbank trout have been facing population declines due to habitat loss and competition with exotic species
# We'll select just Redband trout that have been aged
Redband <- subset(SpokaneFish, Species=="RB" & is.na(ScaleAge)==F )   #This is one of several ways to subset data

#_____________________________________________________________________________________________________#
# 1) Aesthetics and mapping
#_____________________________________________________________________________________________________#
## QUESTION: In the code below, what is the default dataset? What are the aesthetics?
## QUESTION: When you run the code below, why don't we see a graph?
ggplot(Redband, aes(x=ScaleAge, y=Length))


#_____________________________________________________________________________________________________#
# 2) Adding layers: Geometric objects
#_____________________________________________________________________________________________________#
## We need to specify a layer!
## At a minimum, we must specify a geometric object (what shape to add to the plot)
ggplot(Redband, aes(x=ScaleAge, y=Length)) + 
  geom_point()

## TASK: Visualize the relationship between redband length and weight


## You can also specify different aes() for different layer
## For example, we can plot points for length and weight
## (Note - this isn't a good idea from a visualization perspective because the y-axis now has different units)
## We can also specify the color of the points so that we can distinguish them
ggplot(Redband) + 
  geom_point(aes(x=ScaleAge, y=Length), color = "magenta") +
  geom_point(aes(x=ScaleAge, y=Weight), color = "darkblue")


## We can also add aesthetics to the geometric object
## For example, we can integrate these relationships by coloring points based on ScaleAge
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point(aes(color=as.factor(ScaleAge)))


## TASK: Modify the aesthetics of the geometric object in the previous figure so that the shape 
## of the points varies with as.factor(ScaleAge)


## Visit the ggplot2 documentation webpage at http://docs.ggplot2.org/current/

#_____________________________________________________________________________________________________#
# 3) Adding layers: Statistical transformations
#_____________________________________________________________________________________________________#
## A stat takes a dataset as input and visualizes a new, processed dataset with new variables as output.

## For example, if we could relate length and width by calculating and graphing a smoothing function:
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point() + 
  geom_smooth()

## We also can specify a model to fit
## Looks like a quadratic function fits it well:
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point() + 
  geom_smooth(formula = y ~ poly(x,2))

## QUESTION: How and why do the following lines differ from the one above, and from each other?
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point(aes(color=as.factor(ScaleAge))) + 
  geom_smooth(formula = y ~ poly(x,2))

ggplot(Redband, aes(x=Length, y=Weight, color=as.factor(ScaleAge))) + 
  geom_point() + 
  geom_smooth(formula = y ~ poly(x,2))


## Another example of a statistical transformation is geom_boxplot() which:
## Calculates a new dataset based on statistically transforming the default dataset and aesthetics (Weight and ScaleAge)
## In this case, it creates a dataframe of  the mean and upper and lower quantiles of Weight within ScaleAge
## Adds this transformed data as a geometric object
ggplot(Redband, aes(x=as.factor(ScaleAge), y=Weight)) + 
  geom_boxplot()


#_____________________________________________________________________________________________________#
# 4) Altering scales
#_____________________________________________________________________________________________________#
## A scale controls the mapping from data to aesthetic attribute. 
## For example, the following are all aspects of scale:
## The size and color of points and lines, axes limits and labels

## Let's start by revisiting our basic length by weight scatter plot
ggplot(Redband, aes(x=Length, y=Weight)) +
  geom_point()

## We could alter the size and color and shape of the points
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point(size=1, color="darkblue", shape=1)

## We could add on to alter the x and y axes scales; for example, let's make put them on a log10 scale
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point(size=1, color="darkblue", shape=1) +
  scale_x_log10() + 
  scale_y_log10()

## TASK: Relate length with scale age on a log-log scale



#_____________________________________________________________________________________________________#
# SWITCH TO GROUP EXERCISE
#_____________________________________________________________________________________________________#


#_____________________________________________________________________________________________________#
# 5) Specifying facets
#_____________________________________________________________________________________________________#
## Faceting makes it easy to graph subsets of an entire dataset. 
## For example, we could relate length and width within each age class.
## We do that by adding a facet specification to our initial graph:
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point() + 
  facet_wrap(~ScaleAge)

## We could also make a grid by faceting one variable by another.
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point() + 
  facet_grid(Year~ScaleAge) 

#_____________________________________________________________________________________________________#
# 6) Other types of graphs
#_____________________________________________________________________________________________________#
## There is often a length requirement for take from fishing
## What is the distribution of legnths of redband trout in the lower Spokane River? 
ggplot(Redband, aes(x=Length)) + 
  geom_histogram()

## TASK: Make a histogram of length faceted by scale age



## QUESTION: Is the distribution of length normal within age?


## TASK: Using the full SpokaneFish dataset, make a histogram of length faceted by species


## We can also use line graphs for plotting time series
## Note - this will look ugly because there is more than one point per date
ggplot(Redband, aes(x = Date, y = Weight)) +
  geom_line() 

## If we also want points, we can layer that on too
ggplot(Redband, aes(x = Date, y = Weight)) +
  geom_line() +
  geom_point()

#_____________________________________________________________________________________________________#
# 7) Changing appearances
#_____________________________________________________________________________________________________#
## Changing labels
## We could customize the x and y axis labels
ggplot(Redband, aes(x=Length, y=Weight)) + 
  geom_point(size=1, color="darkblue", shape=1) +
  scale_x_log10() + 
  scale_y_log10() +
  xlab("Redband trout length (mm)") + 
  ylab("Redband trought weight (g)")

## Changing legends
ggplot(SpokaneFish, aes(x = Length, fill = Species)) +
  geom_histogram() + 
  theme(legend.position = "bottom")

## Changing themes
## You can change many aspects of the appearance by applying a theme
## You can develop your own theme with the theme() function or select a built in theme
## You can choose from more themes by loading the package ggthemes()
library(ggthemes)

ggplot(SpokaneFish, aes(x = Length, fill = Species)) +
  geom_histogram() + 
  theme_minimal() 

## Note: the built in themes do not have all the same argument options as theme()
## You can add additional base theme() options after applying a built in theme 
ggplot(SpokaneFish, aes(x = Length, fill = Species)) +
  geom_histogram() + 
  theme_minimal() +
  theme(legend.position = "bottom")


## TASK: Change the theme to a different option


#_____________________________________________________________________________________________________#
# SWITCH TO GROUP EXERCISE
#_____________________________________________________________________________________________________#

