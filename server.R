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
      labs(x="Episódios", y="Nota dos Usuários", title=lista$Nome[which(lista$Codigo==input$TVSeries)], colour="Temporada") +
      scale_y_continuous(limits=c(floor(min(ratings()$UserRating)), ceiling(max(ratings()$UserRating)))) +
      theme(plot.title = element_text(hjust = 0.5))
    
    print(g)
    
  })
  
  # output da tabela
  
  #ratings.table <- reactive({
  #  print(ratings()) %>%
  #    select(Temporada=Season, Episódio=Episode, Nota=UserRating)
  #  
  #})
  
  #output$Table <- renderDataTable(ratings.table(), rownames=FALSE, filter="top", options=list(pageLength=50, digits=1))
  
}
