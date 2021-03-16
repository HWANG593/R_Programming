# 문제 1
exam1 <- function()
  
  return(paste0(LETTERS,letters))


# 문제 2
exam2 <- function(num){
  result <- 0
  for(i in 1:num){
    result <- result+i
  }
  return(result)
}


# 문제 3
exam3 <- function(num1,num2){
  if(num1 >= num2){
    return(num1 - num2)
  }else{
    return(num2-num1)
  }
}
  

# 문제 4
exam4 <- function(num1,cal,num2)
  if(cal=="+"){
    return(cat(num1+num2))
  }else if (cal=="-"){
    return(cat(num1-num2))
  }else if (cal=="*"){
    return(cat(num1*num2))
  }else if (cal=="%/%"){
      if(num1 == "0"){
        return(cat("오류1"))
      }else{return(num1%/%num2)
        }
  }else if (cal=="%%"){
    if(num1 == "0"){
      return(cat("오류1"))
    }else{return(num1%%num2)
      }
  }else{
    return(cat("규격의 연산자만 전달하세요"))
  }
    

# 문제 5
exam5 <- function(num1,char1 = "#"){
  if(num1>=0){
    for(i in 1:num1){
      cat(char1)
    }
  }
  else{
    return()
  }
}


# 문제 6

exam6 <- function(score){
  for(i in score){  
    if(is.na(i)){
        print("NA는 처리불가")
    }
      
    else if(i>=85){
      ans <- paste(i,"점은 상등급입니다.",sep="")
      print(ans)
    }else if(i>=70 & i<85){
      ans <- paste(i,"점은 중등급입니다.",sep="")
      print(ans)
    }else if(i<70){
      ans <- paste(i,"점은 하등급입니다.",sep="")
      print(ans)
    }
  }
}

score <- c(80,50,70,66,NA,35)
exam6(score)

