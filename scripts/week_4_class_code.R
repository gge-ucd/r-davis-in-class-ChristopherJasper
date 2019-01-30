# Intro into Data Frames:
# Downloading a file from url and creating a destination file

download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv")

# Note: hit "Tab" while typing file pathway to make it way faster

surveys <- read.csv(file = "data/portal_data_joined.csv")

# Head = display the data in the console
head(surveys)

# let's look at the structure of surveys using "str"

str(surveys)

#dimensions = "dim"

dim(surveys)
nrow(surveys)
ncol(surveys)

tail(surveys)

names(surveys)
row.names(surveys)

# Summary, very usefull for summary stats. Good way to identify issues with the data.

summary(surveys)

# susetting dataframes useing [ row, column ]
animal_vec <- c("mouse", "rat", "cat")
animal_vec[2]

# Data frames are 2D

surveys[1,1]
head(surveys)
surveys[2,1]

surveys[1,6]

# Pulling out the whole first column. Leave the first dimension blank. The whole first column is printed as a vector in result

surveys[,1]

# Using a single number, without a comma, will give us a dataframe with one column
surveys [1]
head (surveys[1])

# This command pulls out the first three values in the 6th column

surveys [1:3,6]

# pull out a whole single obsevation

surveys [5,]

# negative sign to eclude indicies

surveys [1:5, -1 ]

surveys [-c(10:34786),]

str(surveys [-c(10:34786),])

surveys [c(10,15,20),]
surveys [c(10,15,20,10),]


# More ways to subset
surveys["plot_id"] # single column as data frame
surveys[,"plot_id"] # single column as vector
surveys[["plot_id"]] # single column as vector, usefull for list. For another day....

# "$" is useful for exporing what is within your data frame. When run, generates a sinle column vector

surveys$year

# Challenge

surveys[200,]
nrow(surveys[200,])
tail(surveys[200,])


surveys_200 <- surveys[200,]
nrow(surveys_200)


## Challenge explained

# Create a data.frame (surveys_200) containing only the data in row 200 of the surveys dataset.

surveys_200 <- surveys [200,]
surveys_200

# Notice how nrow() gave you the number of rows in a data.frame?

surveys[nrow(surveys),]

# Use that number to pull out just that last row in the data frame.

# Compare that with what you see as the last row using tail() to make sure it’s meeting expectations.

surveys <- surveys[nrow(surveys),]

# Pull out that last row using nrow() instead of the row number.

# Create a new data frame (surveys_last) from that last row.

# Use nrow() to extract the row that is in the middle of the data frame. Store the content of this row in an object named surveys_middle.

surveys_middle <- surveys[nrow(surveys)/2,]
surveys_middle

# Combine nrow() with the - notation above to reproduce the behavior of head(surveys), keeping just the first through 6th rows of the surveys dataset.

surveys [-c(7:nrow(surveys)),]

# Finally, Factors
# Factors are categorical data stored with integers assigned to them.

surveys$sex

#creating our own factor

sex <- factor(c("male", "female", "female", "male"))

sex

# Class = high level descriptiom
class(sex)

# typeof = fundamental description
typeof(sex)

# "levels" gives back a character vector of the levels
levels(sex)

nlevels(sex)

concentration <- factor(c("high", "medium", "high", "low"))

concentration <- factor(concentration,levels = c("low","medium","high"))
concentration

# Adding to a factor

concentration <- c(concentration, "very high")
concentration

# Coerces to charracters if you add a value that doesn't match curent level

# let's just make them characters

as.character (sex)


# Factors with numeric levels

year_factor <- factor(c(1990, 1923, 1965, 2018))
as.numeric(year_factor)
as.character(year_factor)

# this will give us a numeric factor
as.numeric(as.character(year_factor))

# why so many vectors. Cause "read.csv" designate them that way.
read.csv ()

surveys_no_factors <- read.csv (file = "data/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys_no_factors)

# recomended way
as.numeric (levels(year_factor)) [year_factor]

# re-naming factors
sex <- surveys$sex
levels (sex)
levels (sex) [1]
levels (sex) [1] <- "undetermined"
levels (sex)
head(sex)

# Working with dates
# loading packages with "library"
library(lubridate)

# "ymd" designates as a date
my_date <- ymd ("2015-01-01")
my_date
str(my_date)

my_date <- ymd (paste("2015","05","17", sep = "-"))

my_date

paste(surveys$year, surveys$month, surveys$day, sep = "-")

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
