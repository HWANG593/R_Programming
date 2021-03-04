library(XML)
library(rvest)

text <- NULL; newstitle <- NULL; newspapername <- NULL
url<- "https://news.daum.net/ranking/popular"
text <- read_html(url)

for (index in 1:50){
  node <- html_node(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index,") > div.cont_thumb > strong > a"))
  title <- html_text(node)
  title
  newstitle[index] <- title

  node <- html_node(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index,") > div.cont_thumb > strong > span"))
  broadcast <- html_text(node)
  newspapername[index] <- broadcast
}


page1 <- data.frame(vtitle, vbroadcast)
write.csv(page, "output/daumnews.csv")

  
################################################
news1 <- NULL;  news2 <- NULL;

imsi <- read_html("https://news.daum.net/ranking/popular")
t <- htmlParse(imsi)

# li 태그 모두를 찾을 것이므로 반복문 안써도 된다. 
news1 <- xpathSApply(t,"//*[@id='mArticle']/div[2]/ul[3]/li/div[2]/strong/a",xmlValue)
news1

news2 <- xpathSApply(t,"//*[@id='mArticle']/div[2]/ul[3]/li/div[2]/strong/span",xmlValue)
news2

page2 <- data.frame(newstitle = news1, newspapername = news2)