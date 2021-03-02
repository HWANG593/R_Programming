memo <- readLines("data/memo.txt",encoding="UTF-8")
memo

gsub("[[:punct:]]","",memo[1])
gsub("e","E",memo[2])
gsub("[[:digit:]]","",memo[3])
gsub("[[:upper:][:lower:]]","",memo[4])
gsub("[[:punct:][:digit:]]","",memo[5])
gsub("[[:blank:]]","",memo[6])
gsub("YOU","you",memo[7])
gsub("OK","ok",gsub("YOU","you",memo[7]))


write(gsub("[[:punct:]]","",memo[1]),file = "data/memo_new.txt",append=TRUE)
write(gsub("e","E",memo[2]),file = "data/memo_new.txt",append=TRUE)
write(gsub("[[:digit:]]","",memo[3]),file = "data/memo_new.txt",append=TRUE)
write(gsub("[[:upper:][:lower:]]","",memo[4]),file = "data/memo_new.txt",append=TRUE)
write(gsub("[[:punct:][:digit:]]","",memo[5]),file = "data/memo_new.txt",append=TRUE)
write(gsub("[[:blank:]]","",memo[6]),file = "data/memo_new.txt",append=TRUE)
write(gsub("OK","ok",gsub("YOU","you",memo[7])),file = "data/memo_new.txt",append=TRUE)
