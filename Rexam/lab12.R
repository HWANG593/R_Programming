# 문제 1
v1<- c('Happy', 'Birthday','to','You')
length(v1) + sum(nchar(v1))


# 문제 2
v2 <- paste(v1,collapse = " ")
length(v2) + nchar(v2)


# 문제 3
first <- paste(LETTERS[1:10],1:10)
first
second <- paste(LETTERS[1:10],1:10, sep="")
second


# 문제 4
text <- "Good Morning"
text
strsplit(text,split=" ")


# 문제 5
text2 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!", "That's why we call it the present – from kung fu Panda")
text2 <- gsub(",","",text2)
text2 <- gsub("–","",text2)
text2
strsplit(text2, split=" ")


# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 <- gsub("[가-힣]","",s1); r1
r2 <- gsub("[[:punct:]]","",s1); r2
r3 <- gsub("[[:punct:]]","",gsub("[가-힣]","",s1)); r3
r4 <- gsub("100","백",s1); r4


# 문제 7
library(KoNLP)
useSejongDic()

text3 <- readLines("output/hotel.txt")
word_data <- extractNoun(text3)  # 지금은 sapply 안써도 똑같이 나와
word_data

undata <- unlist(word_data)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

df1 <- data.frame(head(final, 10))
names(df1) <- c("wname","wcount")

write.csv(df1, file="output/hotel_top_word.csv")
