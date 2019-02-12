# Week 5 Assignment 02_11_19

# Part I: Enter the Tidyverse

#1) Create a new script in your r-davis-in-class-yourname project, and name it w_5_assignment_ABC.R, with your initials in place of ABC. Save it in your scripts folder.

#2) Read portal_data_joined.csv into R using the tidyverse’s command called read_csv(), and assign it to an object named surveys.

library(tidyverse)
surveys<-read_csv("data/portal_data_joined.csv")

#3) Using tidyverse functions and pipes, subset to keep all the rows where weight is between 30 and 60, then print the first few (maybe… 6?) rows of the resulting tibble.

weights_30to60<-surveys%>% 
  filter(weight>30 & weight<60)%>%
  head()

#4) Make a tibble that shows the max (hint hint) weight for each species+sex combination, and name it biggest_critters. Use the arrange function to look at the biggest and smallest critters in the tibble (use ?, tab-complete, or Google if you need help with arrange).

biggest_critters<- surveys %>% 
  group_by(species,sex) %>%
  summarize(max_weight = max(weight,na.rm=TRUE)) %>% 
  arrange(desc(max_weight)) # Note: "desc" means descending order.

#5) Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here.

RowSum_NA<-surveys %>% 
  tally(rowSums(is.na(surveys)))  # Seems like this counts all the NAs for the whole dataframe

surveys %>% 
  filter(is.na(sex)) %>% 
  group_by(sex) %>%
  tally() %>% 
  View()  # While this is more targeted if you needed to know NA counts for a specific column/s

#6) Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight. The resulting tibble should have 32,283 rows.

surveys_avg_weight<-surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species,sex) %>% 
  mutate(mean_weight = mean(weight,na.rm=TRUE)) %>% 
  select(species,sex,weight,mean_weight)

#7) Challenge: Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).

Above_Avgerage <- surveys_avg_weight %>% 
  mutate(above_average = weight>mean_weight)

#8) Extra Challenge: Figure out what the scale function does, and add a column to surveys that has the scaled weight, by species. Then sort by this column and look at the relative biggest and smallest individuals. Do any of them stand out as particularly big or small?

surveys %>% 
  group_by(species) %>% 
  mutate(scaled_weight = scale(weight)) %>% 
  arrange(desc(scaled_weight)) %>% 
  View     # I think this worked? It gave me a table with a column. Some were quite big, while others negative.


