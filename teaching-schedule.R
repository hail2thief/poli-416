# list of all tuesdays between dates
rm(list=ls())
library(lubridate)
library(tidyverse)

# class start date
schedule = tibble(dates = seq(from = ymd("2023-01-10"), 
                              to = ymd("2023-03-17"),
                              by = 'days'), 
                  day = wday(dates, 
                             label = TRUE)) %>% 
  filter(day %in% c('Tue', 'Thu'))

# format for schedule.yaml
schedForm = schedule %>% 
  # get week
  mutate(week = isoweek(dates) - 1) %>% 
  # get nice date format
  mutate(dates = paste0(month(dates, abbr = TRUE, label = TRUE), " ",
                        day(dates))) %>% 
  # spread out
  pivot_wider(names_from = day, values_from = dates) %>% 
  # get nice week-dates
  mutate(label = paste("Week", week, ":", Tue, "-", Thu))

# get in yaml format
yaml = schedForm %>% 
  select(label) %>% 
  mutate(title = " ", 
         reading = " ", 
         class = " ") %>% 
  mutate(yaml = paste0(paste0("- title: ", title, "\n"), 
                       "  date: ", "\"", label, "\"", 
                       "\n", "  class: ", "\n", "  reading: \n"))
yaml$yaml %>% cat(sep = "\n")
