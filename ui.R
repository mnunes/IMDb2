# usar um tema para a pagina,
# baseado no tema bootstrap
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
      helpText("Visualização das informações temporais das 800 séries de TV com mais votos dados pelos usuários do IMDb. No meu acima, as séries estão classificadas de acordo com o número de votos recebidos.")
    ),
    
    # conteudo principal
    mainPanel(
      tabsetPanel(
        
        # grafico
        tabPanel("Plot", plotOutput("Plot")),
        
        # tabela
        tabPanel("Tabela",  dataTableOutput("Table")),
        
        # explicacao
        tabPanel("Sobre", includeMarkdown("sobre.md"))
      )
    )
    
  )
)

