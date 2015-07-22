
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


library(shiny)
library(shinydashboard)

#ui <- 
  dashboardPage(dashboardHeader(title = "Ground Ops Dashboard v0.1"),
                    dashboardSidebar(),
                    dashboardBody(
                      # boxes need to be put in a row or column
                      fluidRow(
                        box(plotOutput("canx_flights", height = 300)),
                        
                        box(title = "some title here",
                            #selectInput("stations","choose a departure station", "dropdownsx"),
                            sliderInput ("slider","number of observations:", 1,100,50)
                        )
                        ,
                        box(title = "attempt 2", uiOutput("stationSelect"))
                      )
                    )
)






















# library(shiny)
# 
# shinyUI(fluidPage(
# 
#   # Application title
#   titlePanel("Ground Operations Dashboard"),
# 
#   # Sidebar with a slider input for number of bins
#   sidebarLayout(
#     sidebarPanel(
#       sliderInput("bins",
#                   "Number of bins:",
#                   min = 1,
#                   max = 50,
#                   value = 30)
#     ),
#     
# 
#     # Show a plot of the generated distribution
#     mainPanel(
#       plotOutput("distPlot")
#     )
#   )
# ))
