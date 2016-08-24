#rm(list = ls())
weekNum=1
fileName <- paste0("app2016wk", weekNum, ".RData")
load(fileName)
library(shiny); library(scales)
require(googleVis)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  sizeIndex <- reactive({input$players/5 * 2})

  results <- reactive({playersBest[[sizeIndex()]]})

  output$mostWins <- renderGvis({
    most <- as.data.frame(cbind(Game = weekFile$Game, Pick = results()$mostTeams))
    most.W <- gvisTable(most, #include.rownames=F,
                      options=list(page='enable', #height=500, width = 300,
                                   showRowNumber = F, pageSize = 16,
                                   cssClassNames = "{headerRow: 'myTableHeadrow',
                                   tableRow: 'myTablerow'}",
                                   alternatingRowStyle = TRUE, page = 'disable'),
                      chartid = "mytable")
    most.W
  })

})


