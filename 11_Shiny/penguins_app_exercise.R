library(shiny)
library(shinythemes)
library(palmerpenguins)
library(tidyverse)

# R Shiny with data
# This step is not necessary, but I am adding just so you can see where you would add data
df <- penguins 

ui <- fluidPage(
  # Add a title
  titlePanel("Explore Penguin Data"),
  
  sidebarLayout(
    sidebarPanel(
      # Add radio button to select sex for the first plot
      radioButtons(
        inputId = "sexInput",
        label = "Select sex", 
        choices = c("male", "female")),
      
      # Add island count title for first plot
      textInput(inputId = "islandTitle",
                label = "Add count by island plot title",
                value = ""),
      
      # Add check boxes to select species for the second plot
      checkboxGroupInput(
        inputId = "speciesInput",
        label = "Select species", 
        choices = c("Adelie", "Gentoo", "Chinstrap"),
        inline = TRUE),
      
      # Add radio button two select the year for the second plot
      radioButtons(
        inputId = "yearInput",
        label = "Select year", 
        choices = c(2007, 2008, 2009)),
      
      # Add numeric input for the minimum beak length
      numericInput(
        inputId = "minbeakInput",
        label = "Set the minumum beak length",
        value = 44
      ),
      
      # Add check boxes to select island for the third plot
      checkboxGroupInput(
        inputId = "islandInput",
        label = "Select island", 
        choices = c("Biscoe", "Dream", "Torgersen"),
        selected = "Biscoe",
        inline = TRUE)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Island count", 
                 plotOutput("count_by_island"),
                 textOutput("count_above_min_beak")),
        tabPanel("Species plot", plotOutput("plot_by_species")),
        tabPanel("Species by Island", plotOutput("plot_species_by_island"))
      )
    )
  )
)

server <- function(input, output){
  output$count_by_island <- renderPlot({
    ggplot(data = df %>% 
             filter(sex == input$sexInput) %>% 
             group_by(island) %>%
             tally(),
           aes(x = island, y = n)) +
      geom_segment(aes(x = island, xend = island, y = 0, yend = n)) +
      geom_point() + 
      lims(y = c(0, 100)) +
      labs(title = paste(input$islandTitle)) +
      theme_minimal()
  })
  
  output$plot_by_species <- renderPlot({
    ggplot(data = df %>% 
             filter(species %in% input$speciesInput) %>%
             filter(year == input$yearInput),
           aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
      geom_point() + 
      theme_minimal() +
      labs(x = "Body mass (g)", y = "Flipper length (mm)")
  })
  
  output$count_above_min_beak <- renderText({
    paste0("There are ", nrow(penguins %>% filter(bill_length_mm > input$minbeakInput)), " penguins with bill length greater than ",
           input$minbeakInput, " mm.")
  })
  
  output$plot_species_by_island <- renderPlot({
    ggplot(data = df %>%
             filter(island %in% input$islandInput) %>%
             group_by(species) %>%
             tally(), aes(x = 2, y = n, fill = species)) +
      geom_bar(stat = "identity") +
      coord_polar("y") +
      xlim(.2,2.5) +
      theme_void() 
  })
}

shinyApp(ui = ui, server = server)

