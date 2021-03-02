data <- scan("data/iotest2.txt", what="",encoding="UTF-8")
f_data <- summary(factor(data))

cat("가장 많이 등장한 단어는",names(which.max(f_data)),"입니다")
