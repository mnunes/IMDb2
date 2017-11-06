# source: https://stackoverflow.com/questions/2261079/how-to-trim-leading-and-trailing-whitespace-in-r

trim <- function(x) {
  as.numeric(gsub("(^[[0]]+|[[0]]+$)", "", x))
}

trim(rating$SeasonEpisode)


d <- diff(rating$Episode)


