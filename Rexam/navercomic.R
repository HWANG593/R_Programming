library(httr)
library(rvest)
library(XML)

comicName <- NULL
comicSummary <- NULL
comicGrade <- NULL

site<- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
for (i in 1:20) {
  url <- paste0(site,i,sep="")
  text <- read_html(url)


  vcomicName<- html_nodes(text, '.challengeTitle > a')
  vcomicName <- html_text(vcomicName)
  vcomicName <- gsub("[[:space:]]","",vcomicName)
  comicName <- c(comicName,vcomicName)
  
  
  vcomicSummary<- html_nodes(text, '.summary')
  vcomicSummary <- html_text(vcomicSummary)
  comicSummary <- c(comicSummary,vcomicSummary)
  
  vcomicGrade<- html_nodes(text, '.rating_type > strong')
  vcomicGrade <- html_text(vcomicGrade)
  comicGrade <- c(comicGrade,vcomicGrade)
}

navercomic <- data.frame(comicName,comicSummary,comicGrade)
View(navercomic)

write.csv(navercomic, file = "output/navercomic.csv")