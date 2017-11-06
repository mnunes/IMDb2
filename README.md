# IMDb2

[My old IMDb project](https://github.com/mnunes/IMDb/) uses `bash`, `R` and `ggplot2` to make some cool TV Series plots using data available at IMDb. Unfortunately, it demanded a lot of work, even for more experienced programmers.

The goal of this project is to simplify the way these plots are made. Using packages like `rvest` and `dplyr`, one can automaticaly download and process IMDb data to use on `ggplot2` without even know what `R` is.

This application considers the [Top 250 TV Shows list](http://www.imdb.com/chart/toptv/) available at IMDb website.

You can try this app live at [Shiny Apps](https://marcusnunes.shinyapps.io/IMDb2/).