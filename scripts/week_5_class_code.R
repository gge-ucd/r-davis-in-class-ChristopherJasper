# Week 5 Class Code

# tidyverse 
install.packages ("tidyverse")

library (tidyverse)
library (dplyr)

# Underscore "_" used in "tidyverse" rather than dot "."
# "readr" used to read in "tidyverse"

surveys <- readr :: read_csv ("data/portal_data_joined.csv")

str (surveys)

# "select" command is used for collums in a data frame

select (surveys, plot_id, species_id, weight)

# "filter" command is used to filter rows. Dataframe first, then category to filter for...

filter (surveys, year == 1995)

surveys2 <- filter (surveys, weight < 5)

surveys_sml <- select (surveys2, species_id, sex, weight)

# Pipes %>% : Shortcut is "cmd - shift - M"
# Using a pipe is an order of comands. Think of like using "then" after each step.

surveys %>% 
  filter (weight < 5) %>% 
  select (species_id, sex, weight)

# Challenge 1: Using pipes, subset the surveys data to include individuals collected before 1995 and retain only the columns year, sex, and weight.

surveys %>% 
  filter (year < 1995) %>% 
  select (year, sex, weight)

# "mutate" command is used to create new columns. In this example it is used for unit conversion

surveys <- surveys %>% 
  mutate (weight_kg  = weight/1000)%>% 
  mutate (weight_kg2 = weight_kg * 2)

# Filtering "NA" by "!" function, which means "not"
surveys %>% 
  filter  (!is.na(weight)) %>% 
  mutate  (weight_kg = weight/1000) %>% 
  summary ()

# ^ Above: "summary" can be left open, because it is refering what is upstream in the pipe.

# Challenge 2: Create a new data frame from the surveys data that meets the following criteria: contains only the  species_id column and a new column called  hindfoot_half containing values that are half the  hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are less than 30.

surveys_hind_half <- surveys %>% 
  filter  (!is.na(hindfoot_length)) %>%
  mutate  (hindfoot_half = hindfoot_length/2) %>% 
  filter  (hindfoot_half < 30) %>% 
  select  (species_id,hindfoot_half)

# "group_by" is a command for "split - apply - combine"
# It designates similar categories in groups to analize

surveys %>% 
  group_by  (sex) %>% 
  summarize (mean_weight = mean(weight, na.rm = TRUE))

# Testing how mutate works in this senario with the rouping around sexes.

surveys %>% 
  group_by  (sex) %>% 
  mutate (mean_weight = mean(weight, na.rm = TRUE)) %>% View

# "view" command can view the dataframe without actually running and altering it.

#mutate adds new columns to an existing data frame, summarize spits out a totally new data frame 

surveys %>%
  filter(is.na(sex)) %>% 
  View #way to look at all the NAs in the data frame 

surveys %>%  # "tally" command tells us where the NAs are in species 
  group_by(species) %>% 
  filter(is.na(sex)) %>% 
  tally()

surveys %>% 
  filter (!is.na(weight)) %>% 
  group_by (sex, species_id) %>% 
  summarize (mean_weight = mean (weight), min_weight =    min(weight)) %>% View

# "tally" command 

tally_df <- surveys %>% 
  group_by(sex, species_id) %>% 
  tally() %>% View

# "tally()" is the same as group_by("something") %>% summarize (new_column = n())

# Gathering and spreading

# "spread" command is a lot like a "pivot table" in excel

surveys_gw <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by (genus, plot_id) %>% 
  summarise (mean_weight = mean(weight))

surveys_spread <- surveys_gw %>% 
  tidyr :: spread(key = genus, value = mean_weight)

surveys_gw %>% 
  tidyr :: spread (genus, mean_weight, fill = 0) %>% View

# "gather" command does the opposite

surveys_gather <- surveys_spread %>%
  tidyr::gather(key = genus, value = mean_weight, -plot_id) %>% View


