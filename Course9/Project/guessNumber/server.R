#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  myNumber<-sample(0:100,1)
  output$outmsg1<-renderPrint({
          ifelse(myNumber==input$guess,"NOOO! You got it!","WRONG! Try again...")
  })
  output$outmsg2<-renderPrint({
          ifelse(myNumber==input$guess,"Wanna play again? Reload shiny app.",
                 ifelse(myNumber<input$guess,paste("Hint: My number is smaller than",input$guess,"..."),
                        paste("Hint: My number is larger than",input$guess,"...")))
  })
})
