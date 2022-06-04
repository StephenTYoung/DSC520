---
title: "Final Project Step 1"
output:
  pdf_document: default
date: '2022-06-03'
---

#How to import and clean my data
# The first thing I would do is look at the files to see if there is blanks and whether or not it is worth keeping. 
#  I would then delete those that are not needed, and set the blanks to "No Policy Data" in the suicide policy for those that had no data. 
# and then "No data" for the other columns. I need to then combine the 3 data sets into one. I would set the working directory to 
# the correct spot, then use the readxl to import the data.


#What does the final data set look like?

setwd("C:/Users/young/Desktop/Classes/DSC520/GIT/")

#import data 
library(readxl)
happiness_df <- read_excel("Final Project/Data/Appendix_2_Data_for_Figure_2.1.xls")
suicide_policy_df <-read_excel("Final Project/Data/suicide_policy.xls")
who_df <- read_excel("Final Project/Data/who_suicide_statistics.xlsx")

happiness_policy_df <- merge(happiness_df, suicide_policy_df,by = 'country')

combined_df <- merge(happiness_policy_df, who_df, by = 'country')

head(combined_df)

#Questions for future steps.

# Is there anything missing, do I need different data?
# should I not have excluded the years before 2010 from suicide statistics?
# Can I combine these into 1 data frame in a better way than manually?
# Are there steps in the data process that I messed up or missed? 

#What information is not self-evident?

# How do these all relate, do they even really relate? I can make arguments that it is all related and not at all related at the same time. 
# The pattern of the data and how it all works together is definitely not apparent just by looking at all these different data frames. 

#What are different ways you could look at this data?

# Could try to make connection like the number of suicides by year and whether or not they had any sort of stand-alone policy. You could look at the
# number of suicides in the country for 2016 and the happiness score of the country to see if there are more or less suicides in "happier" countries
# It would also be possible to look at the GDP and happiness score to see if money really does by happiness. 

#How do you plan to slice and dice the data?

# I may end up slicing and dicing the data from the combined data into the smaller chunks that it originally was. I may also create a dataframe where
# the country is US and then focus on the US for several different types of analysis. 

#How could you summarize your data to answer key questions?

#I could summarize this by using the head() command to show the top parts of the data, and use the summary() function to show and summarize other parts
#of the data to show what the minimum, mean and max of each of the different variables are. 


#What types of plots and tables will help you to illustrate the findings to your questions?

#Plots to show the Happiness score for each country, table of country, suicide and happiness score. plots of the suicides per year would also be 
#interesting. 

#Do you plan on incorporating any machine learning techniques to answer your research questions? Explain.

# Regression would possibly the only type of machine learning technique that I would use for the project to see if there is a way to predict 
# what the suicides will look like based on factors that may be controlable so there could be a chance to lessen the number of future suicides. 
