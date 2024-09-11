library(httr)
library(jsonlite)
res <-GET("https://cat-fact.herokuapp.com/facts")
res
data <- fromJSON(rawToChar(res$content))
names(data)
data$text