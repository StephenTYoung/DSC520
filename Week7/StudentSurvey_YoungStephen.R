# Assignment: Student Survey
# Name: Young, Stephen
# Date: 2022-05-1

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/young/Desktop/Classes/DSC520/GIT")

## Load the `data/r4ds/heights.csv` to
student_df <- read.csv("data/student-survey.csv")

#i. Use R to calculate the covariance of the Survey variables and provide an explanation 
#of why you would use this calculation and what the results indicate.

#the covariance is -10.35009, meaning the relationship between the two is negative
cov(student_df$TimeReading, student_df$Happiness)
#the covariance is 114.3773 so there is a positive relationship
cov(student_df$TimeTV, student_df$Happiness)

#ii. Examine the Survey data variables. What measurement is being used for the variables? 
#Explain what effect changing the measurement being used for the variables would have on the covariance calculation. 
#Would this be a problem? Explain and provide a better alternative if needed.

#the measurement of TimeReading and TimeTV are both in terms of hours, Happiness is a percentage and Gender is noted as 0 or 1
#Changing the measurement being used would possibly effect how they relate to each other. If the time variable was done as
#minutes, then it would be different because the units are. The magnitude of the covariance is arbitrary and not inuitive
#the number does not necessarily show the strength of the relationship

#iii. Choose the type of correlation test to perform, explain why you chose this test, and make a prediction if the test yields 
#a positive or negative correlation?

#I would chose the pearson correlation test to be between timeTV and timeReading and say that there is a correlation between the two
#variables and say it would be a possitive correlation between them both
cor(student_df$TimeTV, student_df$TimeReading) #-0.8830677 is negatively correlated so as one increases the other decreases

#iv. Perform a correlation analysis of:
#a. All variables
cor(student_df) 

#b. A single correlation between two a pair of the variables
cor(student_df$TimeTV, student_df$Gender)
#.006596673, very low to no relationship between the two

#c. Repeat your correlation test in step 2 but set the confidence interval at 99%
cor.test(student_df$TimeTV, student_df$Gender, conf.level = 0.99)


#d. Describe what the calculations in the correlation matrix suggest about the relationship between the variables. Be specific with your explanation.
#There seems to be correlation between TimeTV and Happiness. Everything else is a weak
#relationship (Time TV and Gender .006596673 and Happiness and Gender .157011838) or negative relationship
#(TimeReading to TimeTV -0.8831, TimeReading to Happiness -0.4349,TimeReading to Gender -0.0896, Happiness to TimeReading -0.4349)

#v. Calculate the correlation coefficient and the coefficient of determination, describe what you conclude about the results.
#correlation coefficient
cor(student_df)
#coefficient of determination
student.lm = lm(formula = Happiness ~ TimeReading + TimeTV+Gender, data = student_df)
summary(student.lm)$r.squared
#The coefficient of determination is .5205882 which means that there is a 52.06% chance of explaining the variance
#between the variables so only 52.06% of the relation between happiness, time reading, Time TV and Gender. This is a 
#rather low amount of explaination between the variables


#vi. Based on your analysis can you say that watching more TV caused students to read less? Explain.
# the relation between TV and Reading was a negative coefficient of -0.883067681 which means there is a very high amount
#of negative relation between the two, so as one increases the other one decreases and vice versa so if TV was to
#rise, this would cause reading to go down. 

#vii. Pick three variables and perform a partial correlation, documenting which variable you are "controlling". 
#Explain how this changes your interpretation and explanation of the results
library(ppcor)
pcor.test(student_df$TimeReading, student_df$TimeTV, student_df$Happiness)
#the estimate is -0.872945 which is a negative correlation between the two variables, the p.value is .00975 which
#means that the it is not statistically significant and it is controlling for happiness. 
