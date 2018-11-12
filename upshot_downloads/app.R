#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(stringr)
library(knitr)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Upshot Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput("caption", "Enter District:"),
        verbatimTextOutput("value"),
        actionButton(goButton, "Confirm", icon = NULL, width = NULL, ...)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
     input$goButton 
      path <- get_filename(input$race) 
      get_tibble(path)
      
      kable(path)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

