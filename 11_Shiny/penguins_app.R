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
    
    # Add check boxes to select species for the second plot
      checkboxGroupInput(
        inputId = "speciesInput",
        label = "Select species", 
        choices = c("Adelie", "Gentoo", "Chinstrap"),
        inline = TRUE)
    ),
  
    mainPanel(
      plotOutput("count_by_island"),
      plotOutput("plot_by_species")
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
        theme_minimal()
    })
    
    output$plot_by_species <- renderPlot({
      ggplot(data = df %>% 
               filter(species %in% input$speciesInput),
             aes(x = body_mass_g, y = flipper_length_mm, color = species)) +
        geom_point() + 
        theme_minimal() +
        labs(x = "Body mass (g)", y = "Flipper length (mm)")
      
  })
}

shinyApp(ui = ui, server = server)
