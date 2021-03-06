# Assignment: ASSIGNMENT 7
# Name: Young, Stephen
# Date: 2022-05-08

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/young/Desktop/Classes/DSC520/GIT")

## Load the `housing data
library(readxl)
housing_df <- read_excel("data/week-7-housing.xlsx")

#i. Explain any transformations or modifications you made to the dataset
#I honestly do not remember if I did any transformations. I beleive there was a blank space that has been filled in. 

#ii.Create two variables; one that will contain the variables Sale Price and Square Foot of Lot (same variables used from previous assignment on simple regression) 
#and one that will contain Sale Price and several additional predictors of your choice. Explain the basis for your additional predictor selections.
names(housing_df)[names(housing_df)=='Sale Price'] <- 'sale_price'
sale_vs_lot_lm <- lm(sale_price ~ sq_ft_lot, data = housing_df)
sale_vs_zip_lm <- lm(sale_price ~ zip5+square_feet_total_living, data = housing_df)

#iii. Execute a summary() function on two variables defined in the previous step to compare the model results. What are the R2 and Adjusted R2 statistics? 
#Explain what these results tell you about the overall model. Did the inclusion of the additional predictors help explain any large variations found in Sale Price?
summary(sale_vs_lot_lm)
#The Rsquared is 0.01435 and adjusted is 0.01428. This would be considered a very weak to no correlation as it is less than .3, meaning that the 
#model itself does not explain the variation in response between the variables and does not explain the large variables in sales price.  

summary(sale_vs_zip_lm)
#The R-squared is 0.003618 and adjusted is 0.00354. This adjusted r square is even less than the ones for sales vs lot size and and shows even less of a 
#correlation between the variables and also does not explain the large variable size. 


#iv. Considering the parameters of the multiple regression model you have created. What are the standardized betas for each parameter and what do the values indicate?
library(lm.beta)
lm.beta(sale_vs_lot_lm)
#The .1198122 indicates that as the sales price increases, so does the lot size of the property
lm.beta(sale_vs_zip_lm)
#With a .45297887 indicator, the square feet total living has a much greater impact than the .01681726 that the zip code has

#v. Calculate the confidence intervals for the parameters in your model and explain what the results indicate.
confint(sale_vs_lot_lm)
#There is a small number for teh sq_ft_lot which indicates it is not a very good indicator 

confint(sale_vs_zip_lm)
#Both zip and square_feet_total_living have small numbers indicating that they would be very good indicators 

#vi. Assess the improvement of the new model compared to your original model (simple regression model) by testing whether this change is significant by performing an analysis of variance.
aov(housing_df$sq_ft_lot ~ square_feet_total_living, data = housing_df)


#vii. Perform casewise diagnostics to identify outliers and/or influential cases, storing each function's output in a dataframe assigned to a unique variable name.


#viii. Calculate the standardized residuals using the appropriate command, specifying those that are +-2, storing the results of large residuals in a variable you create.

sales_lot_resid <- rstandard(sale_vs_lot_lm)
summary(sales_lot_resid)

#ix Use the appropriate function to show the sum of large residuals.
sum(sales_lot_resid^2)


#x Which specific variables have large residuals (only cases that evaluate as TRUE)?


#xi Investigate further by calculating the leverage, cooks distance, and covariance rations. Comment on all cases that are problematics.

#sales_lot_resid <- housing_df[housing_df$large_residuals,
#                                      c("standardized_residuals", "hat_values",
#                                        "cooks_distance", "covariance_ratio")]

#leverage_threshold <- (3 / nrow(housing_df)) * 3
#sales_lot_resid$large_leverage <- sales_lot_resid$hat_values > leverage_threshold
#sum(sales_lot_resid$large_leverage)

#xii Perform the necessary calculations to assess the assumption of independence and state if the condition is met or not.


#xiii Perform the necessary calculations to assess the assumption of no multicollinearity and state if the condition is met or not.


#xiv Visually check the assumptions related to the residuals using the plot() and hist() functions. Summarize what each graph is informing you of and if any anomalies are present.


#xv Overall, is this regression model unbiased? If an unbiased regression model, what does this tell us about the sample vs. the entire population model?