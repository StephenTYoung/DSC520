'''
****************************************************************
Assignment 003
***************************************************************
'''

# Assignment: ASSIGNMENT 3
# Name: Young, Stephen
# Date: 4-3-2022

install.packages("ggplot2")
## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/young/Desktop/Classes/DSC520/GIT")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

# https://ggplot2.tidyverse.org/reference/geom_point.html
## Using `geom_point()` create three scatterplots for
## `height` vs. `earn`
ggplot(heights_df, aes(x=height, y=earn)) + geom_point()
## `age` vs. `earn`
ggplot(heights_df, aes(x=age, y=earn)) + geom_point()
## `ed` vs. `earn`
ggplot(heights_df, aes(x=ed, y=earn)) + geom_point()

## Re-create the three scatterplots and add a regression trend line using
## the `geom_smooth()` function
## `height` vs. `earn`
ggplot(heights_df, aes(x=height, y=earn)) + geom_point() + geom_smooth()
## `age` vs. `earn`
ggplot(heights_df, aes(x=age, y=earn)) + geom_point() + geom_smooth()
## `ed` vs. `earn`
ggplot(heights_df, aes(x=ed, y=earn)) + geom_point() + geom_smooth()

## Create a scatterplot of `height`` vs. `earn`.  Use `sex` as the `col` (color) attribute
ggplot(heights_df, aes(x=height, y=earn, col=sex)) + geom_point()

## Using `ggtitle()`, `xlab()`, and `ylab()` to add a title, x label, and y label to the previous plot
## Title: Height vs. Earnings
## X label: Height (Inches)
## Y Label: Earnings (Dollars)
ggplot(heights_df, aes(x=height, y=earn, col=sex)) + geom_point() + ggtitle("Height vs. Earnings") + xlab("Height (Inches)") + ylab("Earnings (Dollars)")

# https://ggplot2.tidyverse.org/reference/geom_histogram.html
## Create a histogram of the `earn` variable using `geom_histogram()`
ggplot(heights_df, aes(earn)) + geom_histogram()

## Create a histogram of the `earn` variable using `geom_histogram()`
## Use 10 bins
ggplot(heights_df, aes(earn)) + geom_histogram(bins=10)

# https://ggplot2.tidyverse.org/reference/geom_density.html
## Create a kernel density plot of `earn` using `geom_density()`
ggplot(heights_df, aes(earn)) +  geom_density()

'''
****************************************************************
Survey Exercise
***************************************************************
'''
# Assignment: American Community Survey Exercise
# Name: Young, Stephen
# Date: 4-3-2022

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/young/Desktop/Classes/DSC520/GIT")

## Load the data to be read
aes_df <-read.csv("data/acs-14-1yr-s0201.csv")

#1. What are the elements in your data (including the categories and data types)?

#2. Please provide the output from the following functions: str(); nrow(); ncol()
str(aes_df) 
#ID= chr, ID2 = int, Geography = chr, PopGroupID = int, PopGroup.DisplayLabel = chr, RacesReported = int
#HSDegree = num, $BachDegree = num
nrow(aes_df)
#136
ncol(aes_df)
#8

#3. Create a Histogram of the HSDegree variable using the ggplot2 package.
#Set a bin size for the Histogram.
#Include a Title and appropriate X/Y axis labels on your Histogram Plot
ggplot(aes_df, aes(HSDegree)) + geom_histogram(bins=12) + ggtitle("HS Degree") + xlab("Number of People") + ylab("Density")

#4. Answer the following questions based on the Histogram produced:
#  Based on what you see in this histogram, is the data distribution unimodal? Yes, negatively skewed
#  Is it approximately symmetrical? No
#  Is it approximately bell-shaped? No
#  Is it approximately normal? No
#  If not normal, is the distribution skewed? If so, in which direction? Skewed negatively
#  Include a normal curve to the Histogram that you plotted.
ggplot(aes_df, aes(HSDegree)) + geom_histogram(aes(y = ..density..), binwidth=11)

# Explain whether a normal distribution can accurately be used as a model for this data.
#The data is skewed to the right so you would not be able to use this as a normal distribution

#5. Create a Probability Plot of the HSDegree variable.
ggplot(aes_df, aes(sample = HSDegree)) + stat_qq() + stat_qq_line() 

#6 Answer the following questions based on the Probability Plot:
# Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# If not normal, is the distribution skewed? If so, in which direction? Explain how you know.

#The data points form a curve so it is nor a normal distribution, it is curved mostly upward, it is 
#left skewed  or negative skewed. 

#7 Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
install.packages("pastecs")
library(pastecs)
options(scipen=100)
options(digits=2)
stat.desc(aes_df)
