# define o servidor do shiny
function(input, output) {
  
  # baixa os dados
  
  ratings <- reactive({
    download.imdb(input$TVSeries)
  })
  
  # output do plot
  
  output$Plot <- renderPlot({
    
    g <- ggplot(ratings(), aes(x=Sequence, y=UserRating, colour=Season)) +
      geom_point() +
      geom_smooth(method="loess", se=FALSE) +
      labs(x="Episódios", y="Rating", title=tvseries.names[which(tvseries==input$TVSeries)], colour="Temporada") +
      theme(plot.title = element_text(hjust = 0.5))
    
    print(g)
    
  })
  
  # output da tabela
  
  ratings.table <- reactive({
    print(ratings()) %>%
      select(Temporada=Season, Episódio=Episode, Nota=UserRating)
    
  })
  
  output$Table <- renderTable(ratings.table(), striped=TRUE, hover=TRUE, align="c")

  # output explicacao
  
  #output$Texto <- h3(textOutput("Texto"))
  
}
