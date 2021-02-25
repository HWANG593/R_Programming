# 문제 1
str(iris)

# 문제 2
df1 <- data.frame(x = c(1:5),
                  y = c(6:10))

# 문제 3
df2 <- data.frame(col1 = c(1:5),
                  col2 = letters[1:5],
                  col3 = c(6:10))

# 문제 4

var1 <- c("사과", "딸기", "수박")
var2 <- c(1800, 1500, 3000)
var3 <- c(24, 38, 13)

df3 <- data.frame(제품명 = var1,
                  가격 = var2,
                  판매량 = var3)
class(df3)
str(var1)

# 문제 5

price_mean <- apply(df3[,c(2,3)],2,mean)

# 문제 6

name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name, gender, math)

stat <- c(76, 73, 95, 82, 35)

df4$stat <- stat
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100,"B",
                            ifelse(df4$score >= 70,"C","D")))

# 문제 7
myemp <- read.csv("data/emp.csv")
View(myemp)
str(myemp)

# 문제 8
myemp[,c(3:5)]

# 문제 9
myemp[,-4]

# 문제 10
myemp[,"ename"]

# 문제 11
myemp[,c("ename","sal")]

# 문제 12
subset(myemp, job=="SALESMAN", c("ename","sal","job"))
myemp[myemp$job == "SALESMAN", c("ename","sal","job")]

# 문제 13
subset(myemp, sal >= 1000 & sal <= 3000, c("ename","sal","deptno"))
myemp[myemp$sal >= 1000 & myemp$sal <= 3000, c("ename","sal","deptno")]

# 문제 14
subset(myemp, job != "ANALYST", c("ename","job","sal"))
myemp[myemp$job != "ANALYST", c("ename","job","sal")]

# 문제 15
subset(myemp, job == "SALESMAN" | job == "ANALYST", c("ename","job"))
myemp[myemp$job == "SALESMAN" | myemp$job == "ANALYST", c("ename","job")]

# 문제 16
subset(myemp, is.na(myemp$comm),c("ename","sal"))
myemp[is.na(myemp$comm), c("ename","sal")]

# 문제 17
myemp[order(myemp$sal),]


# 문제 18
dim(myemp)
nrow(myemp)
ncol(myemp)

# 문제 19
table(myemp$deptno)

myemp$deptno <- as.factor(myemp$deptno)
summary(myemp$deptno)

# 문제 20
table(myemp$job)

myemp$job <- as.factor(myemp$job)
summary(myemp$job)
