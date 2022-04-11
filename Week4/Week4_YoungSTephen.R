# Assignment: Scores
# Name: Young, Stephen
# Date: 4-10-2022

setwd("C:/Users/young/Desktop/Classes/DSC520/GIT")
scores_df <-read.csv("data/scores.csv")

#  What are the observational units in this study?
#Score Counts of the students

#  Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
# Section is a variable, it is the part of the class that was in the sports or regular section and this is categorical
# scores are quantitative and part of the scores
#count is quantitative part of the scores

print(class(scores_df$Count))
print(class(scores_df$Score))
print(class(scores_df$Section))

#  Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
sports_data <- subset(scores_df, Section=="Sports",Select=c(Count,Score,Section))
reg_data <- subset(scores_df, Section=="Regular",Select=c(Count,Score,Section))

#  Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer the following questions:
reg_score = reg_data$Score
reg_count = reg_data$Count
sports_score = sports_data$Score
sports_count = sports_data$Count

#regular scores
plot(reg_score, reg_count, col="blue", main = "Regular Scores", xlab = "Score", ylab = "# Students")
#sports scores
plot(sports_score, sports_count, col="red", main = "Sports Scores", xlab = "Score", ylab = "# Students")

#combined
plot(reg_score, reg_count, col="blue", pch=16, main = "Score Comparison", xlab = "Score", ylab = "# Students")
par(new = TRUE) 
plot(sports_score, sports_count, pch=17, axes = FALSE, xlab = "", ylab = "", col="red")

#  Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
#The Regular section had consistantly better scores, with more scores having 20 or more students with scores of 320 and above where as Sports had 2 really high points
#but it was mostly 10 students or less with higher scores. 

#  Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
#No, each section had those that were higher and those taht were lower at some point there was no one section that was best for every part, the mean tendancy of the regular was statistically slightly higher but wasnt better on every score

#  What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
# Another variable could be gender that could pull it one way or another, some may say that certain genders might be prone to understand sports references better

#***************Assignment 2*****************
install.packages("readxl")
library(readxl)
housing_df <-read_excel("data/week-7-housing.xlsx")

#  Use the apply function on a variable in your dataset
apply(housing_df, 2, sort)
#  Use the aggregate function on a variable in your dataset
print(aggregate(housing_df$'Sale Price', list(housing_df$zip5), FUN=mean))
#  Use the plyr function on a variable in your dataset - more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together


#  Check distributions of the data
library(ggplot2)
theme_set(theme_minimal())
ggplot(housing_df, aes(square_feet_total_living)) + geom_histogram(bins=8)

#  Identify if there are any outliers
#There are outliers, only a few houses that approach the 15,000 square feet line, and a few that were under 1000 feet. 

#  Create at least 2 new variables
housing_df$price_sqft_living <- housing_df$`Sale Price`/housing_df$square_feet_total_living
housing_df$price_sqft_lot <- housing_df$`Sale Price`/housing_df$sq_ft_lot

