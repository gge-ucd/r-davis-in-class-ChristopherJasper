# Week 6 Assignment.... it's week 7 already? .... oh geeze


# Part 1 
# This exercise asks you to modify existing code to complete a new task. We will work in the same repository that you’ve been working in for the last couple of weeks: r-davis-in-class-YourName.For this homework, we are going to be working with a new dataset called gapminder. Download the data using the code below. Remember, this code is looking for a folder called data to put the .csv in, so make sure you have a folder named data, or modify the code to the correct folder name.

library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

 
# 1A: Modify the following code to make a figure that shows how life expectancy has changed over time.

str(gapminder) # Observe structure to adjust plot

# Given Code
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()   # The x-axis isn't a great choice for over time obervation

# Modified code by Chris
ggplot(gapminder, aes(x = year, y = lifeExp)) +     # Changed x axis to "year" shows over time change
  geom_point()


# 1B: Look at the following code. What do you think the scale_x_log10() line is doing? What do you think the geom_smooth() line is doing?

#Hint: There’s no cost to tinkering! Try some code out and see what happens with or without particular elements

#Given Code
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + #LinearModel method
  theme_bw()

?scale_x_log10() # Alters the x axis data to "Log10" 
?geom_smooth()   # "Smooths" out overploting issues to make easier to obeserve data 
?lm              # Used to fit data to a linear model


# Altered code by Chris 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'solid', size = .5) + 
  theme_bw()





# 1C: Modify the above code to size the points in proportion to the population of the county. 
# Hint: Are you translating data to a visual feature of the plot? # Answer - yes

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, size = pop)) +  # "size" by pop
  geom_point(aes(alpha = 0.1, color = continent)) + # "alpha" for transparency
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'solid', size = .5) + 
  theme_bw()
