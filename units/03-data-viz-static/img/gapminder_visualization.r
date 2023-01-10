
library(tidyverse)

url <- paste0("https://raw.githubusercontent.com/cssearcy/AYS-R-Co",
              "ding-SPR-2020/master/LABS/gapminder_group_data.csv")

regions <- read_csv(file = url) %>%         # Import country region data
  select(Country = name,
         Region = eight_regions) %>% 
  mutate(Region = str_replace_all(string = Region, 
                                  pattern = "_", 
                                  replacement = " "),
         Region = str_to_title(Region))

url <- paste0("https://raw.githubusercontent.com/cssearcy/AYS-R-Co",
              "ding-SPR-2020/master/LABS/gapminder_life_exp.csv")

life_exp <- read_csv(file = url) %>%        # Import, merge life expectancy data
  pivot_longer(cols = -country) %>% 
  rename("Country" = country, 
         "Year" = name, 
         "Lifespan" = value) %>% 
  left_join(regions) %>% 
  mutate(Year = as.numeric(Year)) %>% 
  select(Region, Country, Year, Lifespan) %>% 
  arrange(Region, Country, Year, Lifespan)

region_avgs <- life_exp %>% 
  group_by(Year, Region) %>% 
  summarize(Average = mean(Lifespan, 
                           na.rm = TRUE))

year_avg <- life_exp %>% 
  group_by(Year) %>% 
  summarize(Average = mean(Lifespan, 
                           na.rm = TRUE))

ggplot(life_exp, aes(x = Year, 
                     y = Lifespan)) +
  geom_point(alpha = 0.025,
             color = "grey50") +
  geom_line(data = region_avgs,
            size = 1,
            aes(x = Year,
                y = Average,
                group = Region),
            alpha = 0.4,
            color = "grey20") +
  geom_point(data = region_avgs,
             size = 0.25,
             alpha = 0.6,
             color = "grey20",
             aes(x = Year,
                 y = Average,
                 group = Region)) +
  geom_line(data = year_avg,
            size = 1.5,
            aes(x = Year,
                y = Average),
            color = "white") +
  geom_point(data = year_avg,
             size = 0.5,
             color = "white",
             aes(x = Year,
                 y = Average)) +
  geom_line(data = year_avg,
            size = 1,
            aes(x = Year,
                y = Average),
            alpha = 0.6,
            color = "dodgerblue") +
  geom_point(data = year_avg,
             size = 0.25,
             alpha = 0.8,
             color = "dodgerblue",
             aes(x = Year,
                 y = Average)) +
  geom_segment(x = 1918, 
               y = 20, 
               xend = 1948, 
               yend = 20,
               color = "grey50") +
  annotate(geom = "text", 
           x = 1961,
           y = 20, 
           size = 2,
           label = "World War I\nEnds, 1918") +
  geom_segment(x = 1945, 
               y = 45, 
               xend = 1975, 
               yend = 45,
               color = "grey50") +
  annotate(geom = "text", 
           x = 1988,
           y = 45, 
           size = 2,
           label = "World War II\nEnds, 1945") +
  labs(title  = "Average Life Expectancy Over Time", 
       subtitle = "Overall & 8 Region Averages",
       caption = "Source: www.gapminder.org ",
       x = "Year",
       y = "Life Expectancy (Years)") +
  theme_minimal()

