# DELIVERABLE 1

# Use the library() function to load the dplyr package
?library
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe
MechaCar_mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar_mpg_table)

# Perform linear regression using the lm() function. 
# In the lm() function, pass in all six variables (i.e., columns), 
# and add the dataframe you created in Step 4 as the data parameter.
?lm
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg_table)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
?summary
summary(lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg_table))




# DELIVERABLE 2

# Read in the Suspension_Coil.csv file as a table.
Suspension_Coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
head(Suspension_Coil_table)

# Write an RScript that creates a total_summary dataframe using the summarize() function
# to get the mean, median, variance, and standard deviation of the suspension coil's PSI column
?summarize
total_summary <- Suspension_Coil_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
head(total_summary)

# Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions 
# to group each manufacturing lot by the mean, median,variance, and standard deviation 
# of the suspension coil's PSI column.
lot_summary <- Suspension_Coil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
head(lot_summary)




# DELIVERABLE 3

# Write an RScript using the t.test() function to determine if the PSI across all manufacturing lots 
# is statistically different from the population mean of 1,500 pounds per square inch.
t.test((Suspension_Coil_table$PSI),mu=1500)

# Write three more RScripts using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot 
# is statistically different from the population mean of 1,500 pounds per square inch.
t.test((subset(Suspension_Coil_table, Manufacturing_Lot == "Lot1")$PSI),mu=(1500))
t.test((subset(Suspension_Coil_table, Manufacturing_Lot == "Lot2")$PSI),mu=(1500))
t.test((subset(Suspension_Coil_table, Manufacturing_Lot == "Lot3")$PSI),mu=(1500))

