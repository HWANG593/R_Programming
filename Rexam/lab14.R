library(tm)
library(proxy)


duke <- c("사과 포도 망고")
dully <- c("포도 자몽 자두")
ddochi <- c("복숭아 사과 포도")
donu <- c("오렌지 바나나 복숭아")
gildong <- c("포도 바나나 망고")
huidong <- c("포도 귤 오렌지")


friends <- c(duke, dully, ddochi, donu, gildong, huidong)
cps <- VCorpus(VectorSource(friends))
dtm <- DocumentTermMatrix(cps)
as.matrix(dtm)
# 한글 깨짐

inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
dist(com, method = "cosine")  # 작을수록 유사한 것
dist(com, method = "Euclidean") # 작을수록 유사한 것 
# 듀크와 또치, 듀크와 길동이 가장 유사하다




