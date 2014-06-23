library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles Per Gallon"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
            helpText("Enter the power of your engine and select whether you have an Automatic or Manual. 
               Then enter the price of gas to see a graph of the cost of fuel vs distance."),
      
               numericInput("hp", 
                   label = h4("Horse Power of Engine"), 
                   value = 100,min=25,max=1500,step=25),
      
               radioButtons("am", label = h4("Transmission type"),
                   choices = list("Automatic" = 0, "Manual" = 1),
                   selected = 0),
      
               numericInput("gasPrice", 
                 label = h4("Price of gasoline per gallon in US Dollars"), 
                 value = 4.0,min=0.10,max=20.0,step=0.1)
    ),
    
    # Show the caption and plot of the requested variable against
    # mpg
    mainPanel(
      h3("Fuel Cost Predictions"),
      
      h4(textOutput("mpgMsg")),
      
      plotOutput("costPlot")
    )
  )
))

