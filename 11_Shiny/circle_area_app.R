library(shiny)

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numInput", "A numeric input:", value = 7, min = 1, max = 30)
    ),
    mainPanel(
      textOutput("txtOutput")
    )
  )
)

server <- function(input, output) {
  output$txtOutput = renderText({
    paste0("The area of the circle is: ", pi*input$numInput^2)
  })
}

shinyApp(ui = ui, server = server)

# Modify the above code to do the follow (do one by one and check the result):
# 1) Change the text to instruct the viewer to provide a radius
# 2) Change the name of the input to "radius"
# 3) Add text that provides the circumference of the circle 
# 4) Round the area and circumference to only provide 2 decimal points
# 5) Allow the user to provide any positive input value
