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
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))

tdm
(m <- as.matrix(tdm))

favor <- rowSums(m)
favor <- sort(favor, decreasing = T)

# 가장 많이 선택된 과일
favor[which(favor == max(favor))]

# 가장 적게 선택된 과일
favor[which(favor == min(favor))]