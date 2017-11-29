# funcao que cria a lista de series de tv do menu lateral
# do app IMDb2
# 
# Marcus Nunes - http://marcusnunes.me

source("extrair.R")

qtde <- 816 # numero de series de TV
# qtde <- 5576 # numero de series de TV
# qtde <- 50 # numero de series de TV

lista <- NULL

for (j in 1:floor(qtde/50)){

  url <- paste0("http://www.imdb.com/search/title?num_votes=10000,&title_type=tv_series&sort=num_votes,desc&page=", j)

  pagina <- read_html(url) %>%
    html_nodes("a") %>%
    .[grep("title/tt", .)] %>%
    .[grep("img", .)]

  lista <- rbind(lista, as.data.frame(t(sapply(pagina, extrair))))

}

lista <- data.frame(lista[, 2], lista[, 1])

names(lista) <- c("Nome", "Codigo")

save(lista, file="lista.RData")

# cria menu dropdown para colar manualmente dentro do global.R

write.table(lista, file="dropdown.txt", quote=TRUE, row.names = FALSE, sep="=", col.names = FALSE)

dropdown <- read.table(file="dropdown.txt", sep="\t", stringsAsFactors=FALSE)

dropdown <- paste0(dropdown[, 1], ",")

write.table(dropdown, file="dropdown.txt", quote=TRUE, row.names = FALSE, sep="=", col.names = FALSE)

# apos isto, eh necessario substituir manualmente = por "=" e ", por ", no arquivo dropdown.txt

