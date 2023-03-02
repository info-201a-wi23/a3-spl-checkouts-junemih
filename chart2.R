library("tidyverse")
library("dplyr")
library("stringr")
library("ggplot2")

checkout_data <- read.csv("/Users/junem/Downloads/online_checkouts.csv")

total_ebook_checkouts <- checkout_data %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(total_ebook = sum(Checkouts) / 1000)

total_audiobook_checkouts <- checkout_data %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(total_audiobook = sum(Checkouts) / 1000)

chart2 <- merge(total_audiobook_checkouts, total_ebook_checkouts, by = "CheckoutYear")

legend_title <- "Legend"

ggplot(chart2, aes(x = CheckoutYear)) +
  geom_line(aes(y = total_audiobook, color = "#64A0AB")) +
  geom_line(aes(y = total_ebook, color = "#64AB8A")) +
  labs(x = "Year", 
       y = "Checkouts (in Thousands)", 
       title = "Online Checkout Trends over Time") +
  scale_color_manual(legend_title, labels = c("Audiobooks", "Ebooks"), values = c("#64A0AB", "#64AB8A")) +
  theme_minimal()