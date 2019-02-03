# Week 4 Assignment - Coding Practice - Chris Jasper 

# This code is saved in the scripts folder

# Read portal_data_joined.csv into R using the read.csv command and create a dataframe named surveys.

# Download file via....
download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv")

# Reading csv with "read.csv" command and naming surveys as a dataframe
surveys <- read.csv(file = "data/portal_data_joined.csv")

# Subset to just the first column and columns five through 8. Include only the first 400 rows. Save this as a dataframe called surveys_subset.

surveys[1:400,1-5:8]

surveys_subset <- surveys[1:400,c(1,5:8)]

# CHALLENGE: Select all rows that have a hindfoot_length greater than 32, save these in a new data.frame named surveys_long_feet, then plot its  hindfoot_length values as a histogram using the hist function.

# Subset hind foot lengths to greater than 32
subset(surveys_subset,hindfoot_length>32)

# Assign new data frame of hind foot > 32
surveys_long_feet <- subset(surveys_subset,hindfoot_length>32)


# Histogram ploting using hist function
hist(surveys_long_feet$hindfoot_length)

# Change the column hindfoot_lengths into a character vector.
as.character(surveys_long_feet$hindfoot_length)

# Plot the hindfoot_lengths in a histogram
hist(as.character(surveys_long_feet$hindfoot_length ))
# Error in hist.default(as.character(surveys_long_feet$hindfoot_length)) : 
# 'x' must be numeric

