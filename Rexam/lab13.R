library(wordcloud2)
library(htmlwidgets)
library(KoNLP)

text <- readLines("data/yes24.txt", encoding="UTF-8")
word_data <- extractNoun(text)  # 지금은 sapply 안써도 똑같이 나와
word_data

# [^가-힣[:space:]] 한글과 space가 아닌애
undata <- unlist(word_data)
undata <- gsub("[^가-힣]","",undata)

undata2 <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, undata)
word_table2 <- table(undata2)

final <- sort(word_table2, decreasing = T)

df1 <- data.frame(final)


result<-wordcloud2(data = df1)
result

htmltools::save_html(result,"output/yes24.html")