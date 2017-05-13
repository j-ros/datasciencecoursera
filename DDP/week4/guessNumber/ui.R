#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that plays a guessing game
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Guess the number"),
  
  sidebarLayout(
    sidebarPanel(
        h3("Make your guess:"), 
        h3("0-100"),
        numericInput("guess",min=0,max=100,step=1,value=0,label=NULL),
        submitButton()
    ),
    
    mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("Game Screen",br(),
                                 h3("Mastermind says:",br(),
                                 textOutput("outmsg1"),br(),
                                 textOutput("outmsg2"))),
                        tabPanel("Game Documentation",
                                 h4("Insert a number from 0 to 100 in the 
                                    numeric input field and click the submit button."),
                                 h4("In the main panel you can check whether or not 
                                        the number was correct and some hints 
                                        as to which number is correct."))
                        )
    )
  )
))
