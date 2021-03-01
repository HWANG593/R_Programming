# 문제1

countEvenOdd <- function(x){
  even <- 0
  odd <- 0
  if(is.vector(x) && !is.list(x) && is.numeric(x)){
    for(i in x){
      if(i %% 2 == 0){
        even <- even + 1
      }else{
        odd <- odd + 1
      }
    }  
    return(list(even,odd))
  }else{
    return(NULL)
  }
}
  


# 문제 2
vmSum <- function(x){
  if(is.vector(x) && !is.list(x)){
    if(is.numeric(x)){
      return(sum(x))
    }else{
      cat("숫자 벡터를 전달하숑!","\n")
      return(0)
    }
  }else{
    cat("벡터만 전달하숑!","\n")
  }
}


# 문제 3
vmSum2 <- function(x){
  if(is.vector(x) && !is.list(x)){
    if(is.numeric(x)){
      return(sum(x))
    }else{
      warning("숫자 벡터를 전달하숑!","\n")
      return(0)
    }
  }else{
    stop("벡터만 전달하숑!","\n")
  }
}


# 문제 4
mySum <- function(x){
  oddSum <- 0
  evenSum <- 0
  if(is.null(x)){
    return(NULL)
  }
  
  if(is.vector(x) && !is.list(x)){
    if(any(is.na(x))){
      warning("NA를 최저값으로 변경하여 처리함!!")
      x[is.na(x)] <- min(x[!is.na(x)])
    }
    
    for(i in x){
      if(i%%2==0){
        evenSum <- evenSum + i
      }
      else{
        oddSum <- oddSum + i
      }
    }
      
    return(list(evenSum,oddSum))
  }else{
    stop("벡터만 처리가능!")
  }
}


# 문제 5
random_number <- function(){
  return(sample(1:45,6))
}

myExpr <- function(f){
  if(is.function(f)){
    return(0)
    
  }else{
    stop("수행 안할꺼임!!")
  }
}
  

# 문제 6

createVector1 <- function(...){
  p <- c(...)
  if(is.null(p)){
    return(NULL)
  }else if(any(is.na(p))){
    return(NA)
  }else{
    return(p)
  }
}


# 문제 7
createVector2 <- function(...){
  p <- list(...)
  if(is.null(p)){
    return(NULL)
  }
  else{
    nu <- vector()
    ch <- vector()
    bo <- vector()
    for(i in p){
      if(is.numeric(i)){
        nu <- c(nu,i)
      }else if(is.character(i)){
        ch <- c(ch,i)
      }else{
        bo <- c(bo,i)
      }
    }
    return(list(nu,ch,bo))
  }
}