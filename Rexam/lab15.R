# 문제 1
plog <- read.table("data/product_click.log")
plog

PID <- plog$V2
PID
table(PID)

barplot(table(PID), main = "세로바 그래프 실습",
        col = terrain.colors(10),
        xlab = "상품 ID", ylab = "출력수")

dev.copy(png, "output/clicklog1.png")
dev.off()

# 문제 2
Ptime <- plog$V1
Ptime <- substr(Ptime, start=9, stop=10)
table(Ptime)
lab1 <- c('0~1','1~2','2~3','3~4','4~5','5~6','8~9','9~10',
          '10~11','11~12','12~13','13~14','14~15','15~16','16~17','17~18','18~19')

pie(table(Ptime),
    main = "파이그래프 실습",
    col = rainbow(18),
    label = lab1)


dev.copy(png, "output/clicklog2.png")
dev.off()


# 문제 3
std <- read.table("data/성적.txt", header=T)
std

std2 <- std[,3:5]
boxplot(std2, col=rainbow(3),
        main = "과목별 성적 분표")


dev.copy(png, "output/clicklog3.png")
dev.off()


# 문제 4

language <- std$국어
math <- std$수학
english <- std$영어
score <- rbind(language,math,english)
colnames(score) <- std$성명
score

barplot(score, main='학생별 점수',
        col=c('orange','skyblue','pink'),
        legend.text=c("국어","수학","영어"),
        args.legend = list(x='topright', inset=c(-0.20,0)))    

dev.copy(png, "output/clicklog4.png")
dev.off()