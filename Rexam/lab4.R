# 문제 1

L1 <- list("scott",3000)
names(L1) <- c("name", "sal")
result1 <- L1[["sal"]] * 2


# 문제 2
L2 <- list("scott",c(100,200,300))

# 문제 3
L3 <- list(c(3,5,7),c("A","B","C"))
L3[[2]][1] <- "Alpha"

# 문제 4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]] + 10

# 문제 5
emp <- read.csv("data/emp.csv")

data1 <- LETTERS
data2 <- head(emp,n=3)
data3 <- L4

L5 <- list(data1 = data1,
           data2 = data2, 
           data3 = data3)

L5[["data1"]][1]
L5[["data2"]]$ename
L5[["data3"]][[3]]

# 문제 6
L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(unlist(L6))


# 문제 7
grade <- sample(1:6,1)

if (grade == 1 | grade == 2 | grade == 3){
  cat(grade," 학년은 저학년입니다.","\n")
}else{
  cat(grade," 학년은 고학년입니다.","\n")
}

# 문제 8
choice <- sample(1:5,1)
if (choice == 1){
  print(300+50)
}else if (choice == 2){
  print(300-50)
}else if (choice == 3){
  print(300*50)
}else if (choice == 4){
  print(300/50)
}else{
  print(300%%50)
}

# 문제 9
count <- sample(3:10,1)
deco <- sample(1:3,1)

if (deco == 1){
  for (i in 1:count){
    cat("*")
  }
}else if (deco == 2){
    for (i in 1:count){
      cat("$")
    }
}else{
  for (i in 1:count){
    cat("#")
  }
}


# 문제 10
score <- sample(0:100,1)
front_score <- score%/%10
front_score <- as.character((front_score))

grade <- switch(front_score,
                "9"=,"10"="A",
                "8"="B",
                "7"="C",
                "6"="D",
                "F"
)
cat(score,"점은",grade,"등급입니다.")


# 문제 11
alpha <- vector()
for (i in 1:length(LETTERS)){
  new <- paste(LETTERS[i],letters[i],sep="")
  alpha <- c(alpha,new)
}
alpha
  