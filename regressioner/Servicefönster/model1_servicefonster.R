# Load necessary libraries
library(readr)
library(dplyr)
library(lmtest)

# Read the data
data <- read_csv("../data/Export for regressions/exported_data_regression/regression_data_utlovade_tider_2011_2023.csv")

# Ensure the data has the necessary columns: 'time', 'group', and 'outcome'
# 'time' should be a binary variable indicating pre-treatment (0) and post-treatment (1)
# 'group' should be a binary variable indicating control (0) and treatment (1)
# 'outcome' is the dependent variable

# Create the interaction term
data <- data %>%
    mutate(interaction = time * group)

# Fit the difference-in-difference regression model
model <- lm(outcome ~ time + group + interaction, data = data)

# Display the summary of the model
summary(model)

# Perform a hypothesis test on the interaction term
coeftest(model)