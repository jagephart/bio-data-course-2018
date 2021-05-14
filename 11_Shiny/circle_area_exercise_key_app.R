library(shiny)

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      numericInput("radiusInput", "Provide a radius:", value = 2, min = 0)
    ),
    mainPanel(
      textOutput("txtOutput"),
      textOutput("circumOutput")
    )
  )
)

server <- function(input, output) {
  output$txtOutput = renderText({
    paste0("The area of the circle is: ", round(pi*input$radiusInput^2, 2))
  })
  
  output$circumOutput = renderText({
    paste0("The circumference of the circle is: ", round(2*pi*input$radiusInput, 2))
  })
}

shinyApp(ui = ui, server = server)

# Modify the above code to do the follow (do one by one and check the result):
# 1) Change the text to instruct the viewer to provide a radius
# 2) Change the name of the input to "radius"
# 3) Add text that provides the circumference of the circle 
# 4) Round the area and circumference to only provide 2 decimal points
# 5) Allow the user to provide any positive input value
