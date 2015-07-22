
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
# using library ROracle
library(ROracle)
library(shinydashboard)

#server <-
  function(input, output) {
  
  # set the driver for Oracle
  drv <-dbDriver("Oracle")
  
  # set the connection (for ENGUA at the moment)
  con <-dbConnect(drv, username ="app_owner", password = "XX", dbname = "xx")
  
  #save the query results to july_cx_data
  july_cx_data <- dbGetQuery(con, "SELECT FLYDATA.REFDATE,DEP,CASE WHEN delay_code IN ('RTECH', 'TECH') THEN 'TECH' WHEN delay_code = 'WEAT' THEN 'WEAT' WHEN delay_code IN ('CREW', 'CABC', 'PILO') THEN 'CREW' ELSE 'OTHER'  END        delay_grouping  FROM FLYDATA, DELAY_DETAIL WHERE     FLYDATA.FLYDATA_ID = DELAY_DETAIL.FLYDATA_ID(+)       AND FLYDATA.REFDATE BETWEEN '01-jul-2015' AND '15-jul-2015'       AND FLYDATA.LEGTYPE = 'CX'       AND FLYDATA.LEGTYPE IS NOT NULL       AND FLYDATA.stc = 'J'       AND FLYDATA.AIRLINE = 'BE'")
  
  # this is setting up the drop down select but so it can be used in the UI bit. very swish!
  output$stationSelect <- renderUI ({
    allStations <- july_cx_data$DEP
    selectInput ("stations", "pick a station", choices = allStations)
  })
  

  
  output$canx_flights <- renderPlot(
    
    {data <- table(july_cx_data$DELAY_GROUPING) 
    
    barplot(data, 
            main = "Canx flights", 
            #horiz =  TRUE,
            xlab = "Reasons", 
            col = "purple")})
}

#shinyApp(uix,server)














# 
# 
# library(shiny)
# 
# shinyServer(function(input, output) {
# 
#   output$distPlot <- renderPlot({
# 
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2]
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white')
# 
#   })
# 
# })
