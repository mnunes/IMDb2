# usar um tema para a pagina,
# baseado no bootstrap
fluidPage(theme = shinytheme("spacelab"),
  
  # titulo da pagina
  titlePanel("Histórico dos Ratings dos Seriados"),
  
  # coluna lateral
  sidebarLayout(
    
    # definicao do sidebar
    sidebarPanel(
      selectInput("TVSeries",
                  choices=tvChoices,
                  label="Escolha o Seriado:",
                  selected="tt0411008"), # Lost (2004)
      hr(),
      helpText("Visulalização das informações temporais das 250 melhores séries de TV, de acordo com os usuários do IMDb.")
    ),
    
    # conteudo principal
    mainPanel(
      tabsetPanel(
        
        # grafico
        tabPanel("Plot", plotOutput("Plot")),
        
        # tabela
        tabPanel("Tabela",  dataTableOutput("Table")),
        
        # explicacao
        tabPanel("Explicação", htmlOutput("Texto"))
      )
    )
    
  )
)

