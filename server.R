library(shiny)
library(datasets)
library(ggplot2)


mpgData <- mtcars

mdl<-lm(mpg~hp+am,mpgData)
dist<-2*(1:20)

# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {
  
  inData<-reactive({data.frame(hp=input$hp,am=as.numeric(input$am))})
  predMpg<-reactive({predict(mdl,inData())})
  # Compute the forumla text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  costText <- reactive({
    paste("The predicted fuel economy of the car is ", round(predMpg(),2),"mpg")
  })
  
  # Return the formula text for printing as a caption
  output$mpgMsg<- renderText({
    costText()
  })
  
  # Generate a plot of the requested variable against mpg and
  # only include outliers if requested
  output$costPlot <- renderPlot({
    qplot(dist,dist*input$gasPrice/predMpg(),geom="line",main="Cost of commuting per day",xlab="Distance/miles",ylab="Cost/dollars")
  })
})
