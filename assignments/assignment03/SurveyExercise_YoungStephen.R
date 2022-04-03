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
