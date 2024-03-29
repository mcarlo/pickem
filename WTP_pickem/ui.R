library(shiny)
library(googleVis)

# Define the overall UI
shinyUI(fluidPage(
  includeCSS("styles.css"),
  fluidRow(
    column(3, p("")),
    column(9,
           h3("Subscriber picks for 2016"), #style = "color: #06018f;"),
           h6("Appropriate for straight-up pick'em pools with a weekly payout"),
           sliderInput("players", "   Number of Players in Pool:", min = 5,
                       max = 100, step = 5, value = 35),
            h4(paste0("Winningest Picks, Week 17")),
           p(paste0("simulations updated ", as.character.Date(Sys.time()), as.character.Date(Sys.timezone()))),
           htmlOutput(outputId="mostWins")
          ,
                        tags$head(tags$style(type="text/css",
                                             ".myTableHeadrow {color:#FFFFFF; background-color:#FF0000;}
                                             .myTablerow {background-color:#D9D9D9;}"))
            )
    ),
    tags$head(includeScript("google-analytics.js"))
  )

)