# Load necessary libraries
library(ggplot2)

# Load the house_prices.rda file
load('C:/Users/ljarb/Desktop/house_prices.rda')

# Assuming the data is loaded into a variable called house_prices
# If the variable name is different, adjust accordingly
# For example, if the loaded variable is `df`, use `df` instead of `house_prices`

# Check the structure of the loaded data
str(house_prices)

# Create the plot
ggplot(house_prices, aes(x = date, y = house_price_index, color = state)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(
    breaks = c(1980, 2000, 2020),
    labels = c("80", "00", "20")
  ) +
  labs(
    x = "Year",
    y = "House Price Index",
    title = "Trends of House Price Index Over Years for Each State"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none"
  )

#1B
if (!require(tidyr)) install.packages("tidyr")
if (!require(dplyr)) install.packages("dplyr")
library(tidyr)
library(dplyr)

str(house_prices)

house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value", house_price_index, unemploy_perc, -state, -date)


str(house_reshaped)
head(house_reshaped)

#1c
Use house_reshaped to replicate the graph in 1a with two lines where each represents house_price_index
and unemploy_perc over the years for each state. Once you have the chart, please comment on it as to whether
it’s a good graph to present those two pieces of information.
library(ggplot2)

#plot
ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(
    breaks = c(1980, 2000, 2020),
    labels = c("80", "00", "20")
  ) +
  labs(
    x = "Year",
    y = "Value",
    title = "Trends of House Price Index and Unemployment Percentage Over Years for Each State",
    color = "Measure"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

#1d
#When you achieve the goals above, please create a R markdown file and create an HTML page which has your
#codes and charts including your comments.

install.packages("rmarkdown")

---
  title: "House Prices and Unemployment Analysis"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)






