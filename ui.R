# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Histórico dos Ratings dos Seriados"),
  
  # Generate a row with a sidebar
  sidebarLayout(
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("TVSeries",
                  choices=tvChoices,
                  label="Escolha a Série:",
                  selected="tt0411008"), # Lost (2004)
      hr(),
      helpText("As 250 séries melhor avaliadas no IMDb.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("Plot")  
    )
    
  )
)

