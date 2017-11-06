library(datasets)
library(ggplot2)
theme_set(theme_bw())
library(dplyr)
library(rvest)
library(stringr)

# function needed
source("imdb.R")

# tv series names
source("list.R")

lista <- cbind(Codigo=tvseries, Nome=tvseries.names)

lista <- lista[order(lista[, 2]), ]

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

