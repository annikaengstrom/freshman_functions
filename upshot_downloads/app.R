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
        actionButton("button", "Confirm", icon = NULL, width = NULL)
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
     
     input$button 
     
     path <- get_filename(input$caption) 
     
     data <- get_tibble(path)
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

