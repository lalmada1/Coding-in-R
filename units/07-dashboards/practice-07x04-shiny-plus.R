


# SETUP ----



library(shiny)
library(shinydashboard)



# PREPROCESSING ----



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



# DASHBOARD COMPONENTS ----



header <- dashboardHeader(title = "Lab-04 Dynamic Graphics")

sidebar <- dashboardSidebar(
  
  sidebarMenu(
    
    menuItem(icon = icon("user"), 
             text = "Author: Your Name"),
    
    menuItem(icon = icon("calendar"),
             text = paste("Date:", Sys.Date()))
    
    # User control input here
    
  )
  
)

body <- dashboardBody(
  
  plotOutput("my_plot")
  
  )



# DASHBOARD ----



server <- function(input, output){
  
  output$my_plot <- renderPlot({
    
    # Visualization code here
    
  })
  
}

ui <- dashboardPage(header = header, 
                    sidebar = sidebar, 
                    body = body)

shinyApp(ui, server)
