library(datasets)
library(ggplot2)
theme_set(theme_bw())
library(dplyr)
library(rvest)

source("imdb.R")

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$Plot <- renderPlot({
    
    # plot the graph
    imdb(input$TVSeries)
  })
}
