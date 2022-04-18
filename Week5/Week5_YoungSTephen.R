# Assignment: Scores
# Name: Young, Stephen
# Date: 4-17-2022

setwd("C:/Users/young/Desktop/Classes/DSC520/GIT")
library(readxl)
housing_df <-read_excel("data/week-7-housing.xlsx")
library(dplyr)
library(tidyr)
library(stringr)
# 1. Using the dplyr package, use the 6 different operations to analyze/transform the data - 
#GroupBy, Summarize, Mutate, Filter, Select, and Arrange - Remember this isn't just modifying data, 
#you are learning about your data also - so play around and start to understand your dataset in more detail
#GroupBy
by_zip <- housing_df %>% group_by(zip5)

#Summarize
by_zip %>% summarise(living_sq_ft = mean(square_feet_total_living))

#Mutate, #Select
by_zip %>% select(square_feet_total_living, sq_ft_lot)%>% mutate(nonliving_sqft = sq_ft_lot -square_feet_total_living, sq_ft_lot )
  
#Filter
filter(housing_df, zip5 %in% '98053')

#Arrange
by_zip %>% arrange(desc(zip5))

# 2. Using the purrr package - perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.
library(purrr)
dates <- by_zip$`Sale Date`
dates <- as.Date(dates)
keep(by_zip, ~inherits(.x, dates)
 

# 3. Use the cbind and rbind function on your dataset
beds <- by_zip$bedrooms
full_bath <- by_zip$bath_full_count

bed_fullbath <- cbind(beds, full_bath)

new_row <-c('2006/01/08', 999999, 1, 3, 15, 'R1', '1 World Drive', '32821', 'ORLANDO', 'ORLANDO', '28.385233', '-81.563873', 10, 3499, 4, 4, 1, 0, '2010', 0, 'R6', 28102, 'R', 2)
rbind(new_row, data.frame(by_zip))

# 4. Split a string, then concatenate the results back together
date <- by_zip$`Sale Date`
date_split <- strsplit(as.character(date), "-")