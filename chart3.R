library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

checkout_data2 <- read.csv("/Users/junem/Downloads/romance_mystery.csv")

total_romance_checkouts <- checkout_data2 %>%
  filter(grepl('Romance', Subjects)) %>%
  group_by(CheckoutYear) %>%
  summarise(total_romance = sum(Checkouts) / 1000000)

total_mystery_checkouts <- checkout_data2 %>%
  filter(grepl('Mystery', Subjects)) %>%
  group_by(CheckoutYear) %>%
  summarise(total_mystery = sum(Checkouts) / 1000000)

chart3 <- merge(total_romance_checkouts, total_mystery_checkouts, by = "CheckoutYear")

legend_title <- "Genres"

ggplot(chart3, aes(x = CheckoutYear)) +
  geom_line(aes(y = total_romance, color = "#AB648D")) +
  geom_line(aes(y = total_mystery, color = "#8664AB")) +
  labs(x = "Year", 
       y = "Checkouts (in Millions)", 
       title = "Romance and Mystery Checkout Trends over Time") +
  scale_color_manual(legend_title, labels = c("Romance", "Mystery"), values = c("#AB648D", "#8664AB")) +
  theme_minimal()

