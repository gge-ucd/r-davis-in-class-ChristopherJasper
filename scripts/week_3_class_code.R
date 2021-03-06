# Week 3 Live Code

# How to read a csv
read.csv("data/tidy.csv")

# Simple vetor we learned last week
x <- 4

# Vectors
weight_g <- c(50,60,31,89)
weight_g

# now characters
animals <- c("mouse","rat","dog","cat")
animals

# Vector exploaration tools
length (weight_g)
length (animals)

class (weight_g)
class (animals)

# "str" gives you all the information behind an object
str (x)
str (weight_g)

# Note that repeating this command will add values
weight_g <- c(weight_g,105)
weight_g

weight_g <- c(25,weight_g)
weight_g

# 6 types of atomic vectors: "numeric" ("double"), "character", "logical", "integer", "complex", and "raw"
# The first four listed are most common

typeof (weight_g)

weight_integer <- c(20L, 21L, 85L)

class (weight_integer)
typeof (weight_integer)

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")


class (num_char)
class (num_logical)
class (char_logical)
class (tricky)

combined_logical <- c(num_logical,char_logical)
combined_logical

# subsetting vectors
animals

animals [3]

animals [c(2,3)]
animals [c(3,1,3)]

# conditional subsetting
weight_g
weight_g[c(T,F,T,T,F,T,T)]

weight_g > 50

weight_g[weight_g > 50]

# multiple conditions
# note: "shift \" = "|" = "or" function
weight_g [weight_g < 30 | weight_g > 50]

weight_g [weight_g >= 30 & weight_g == 89]

# Searching for Characters

# note: "%in%"
animals %in% c("rat","antelope","jackelope","hippogriff")

animals[animals %in% c("rat","antelope","jackelope","hippogriff")]

# challenge
"four">"five"
"six">"five"
"eight">"five"

# how to do stuff with "NA" values
heights <- c(2,4,4,NA,6)

mean(heights)
max(heights)

mean(x=heights, na.rm= TRUE)
max(x=heights, na.rm= TRUE)

is.na(heights)
complete.cases(heights)
