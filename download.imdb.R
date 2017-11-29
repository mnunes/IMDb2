# inspirada por http://www.nathancunn.com/2017-10-26-simpsons-decline/
#
# funcao que extrai os ratings de uma determinada serie de TV
# o argumento 'tvseries' eh o codigo da serie no IMDb
# 
# Marcus Nunes - http://marcusnunes.me

download.imdb <- function(tvseries){
  
  data <- read_html(paste0("https://www.imdb.com/title/", tvseries, "/epdate"))
  
  title0 <- html_nodes(data, "title")
  title0 <- gsub("<title>", "", title0)
  title0 <- gsub("</title>", "", title0)
  title <- gsub("\"", "", gsub("\"", "", title0))
  
  title <- title0
  
  rating <- data %>%
    html_table() %>%
    .[[1]]
  
  rating <- rating[, 1:4]
  
  rating[, 1] <- as.numeric(rating[, 1])
  
  rating$Season <- floor(rating[, 1])
  
  rating$Episode <- (rating[, 1]-rating$Season)*100
  
  season.length <- rating %>% 
    group_by(Season) %>%
    count()
  
  episodios <- NULL
  for (j in 1:length(season.length$n)){
    episodios <- c(episodios, seq(1:season.length$n[j]))
  }
  
  rating$Episode <- episodios
  
  rating$UserVotes <- as.numeric(gsub("\\,", "", rating$UserVotes))
  
  rating <- rating[, 2:5]
  
  rating$Sequence <- 1:length(rating$UserRating)
  
  rating$Season <- factor(str_pad(rating$Season, 2, pad="0"))
  
  colnames(rating) <- c("Episode", "UserRating", "UserVotes", "Season", "Sequence")
  
  rating <- as_data_frame(rating)
  
  return(rating)
  
}
