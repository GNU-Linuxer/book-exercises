# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- c(paste("Employee", 1:100))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
initial_salaries <- c(runif(100, min=40000, max=50000))

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salary_adjustments <- c(runif(100, min=-5000, max=10000))

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, initial_salaries, salary_adjustments,stringsAsFactors=FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$new_salaries <- salaries$initial_salaries + salaries$salary_adjustments

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raising_salaries <- c(salaries$salary_adjustments > 0)


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
print(salaries[salaries$employees == "Employee 57", "new_salaries"])

# How many employees got a raise? (note: this is second to most difficult question)
nrow(salaries[salaries$raising_salaries == TRUE,])

# What was the dollar value of the highest raise?
highest_raise <- max(salaries$salary_adjustments)

# What was the "name" of the employee who received the highest raise?
highest_raise_employee <- salaries[salaries$salary_adjustments==highest_raise, "employees"]

# What was the largest decrease in salaries between the two years?
largest_decrease <- min(salaries$salary_adjustments)

# What was the name of the employee who recieved largest decrease in salary?
largest_decrease_employee <- salaries[salaries$salary_adjustments==largest_decrease, "employees"]

# What was the average salary change?
average_change <- mean(salaries$salary_adjustments)

# For people who did not get a raise, how much money did they lose on average? (note: this is the most difficult task)
average_decreae <- mean(salaries$salary_adjustments[salaries$salary_adjustments <= 0])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "salaries.csv", row.names = FALSE)
