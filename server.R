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
  
  output$Table <- renderDataTable(ratings.table(), rownames=FALSE, filter="top", options=list(pageLength=50, digits=1))

  # output explicacao
  
  output$Texto <- renderUI({
    
    p01 <- paste("<p>Este aplicativo faz o scraping de páginas do <a href='http://www.imdb.com/' target='_blank'>Internet Movie Database - IMDb</a>, site mantido por usuários que dão notas de 0 a 10 para os filmes e episódios de seriados que assistem. Estes dados já estão organizados no site. O aplicativo apenas pega estes dados e os organiza de maneira mais amigável.</p>")
    p02 <- paste("<p>Tome, por exemplo, a página com as notas do seriado <a href='http://www.imdb.com/title/tt0411008/epdate' target='_blank'>Lost</a>. Os valores das notas médias que os usuários deram estão todas aí. O aplicativo apenas pega estes valores e deixa-os com uma apresentação mais bonita.</p>")
    HTML(paste(p01, p02, sep = '<br/>'))
    
  })
  
}
