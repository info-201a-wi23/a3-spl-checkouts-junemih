library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")


harry_potter_data <- read.csv("/Users/junem/Downloads/Potter_Checkouts.csv")

ggplot(harry_potter_data, aes(x = CheckoutYear, y = Checkouts, fill = CheckoutYear)) +
  geom_col() +
  labs(x = "Year", y = "Checkouts", title = "Harry Potter Checkouts Throughout the Years") +
  theme_minimal()
  