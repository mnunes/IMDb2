# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$Plot <- renderPlot({
    
    # plot the graph
    imdb(input$TVSeries)
  })
}
