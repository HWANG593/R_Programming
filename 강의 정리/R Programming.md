# R Programming

## R 언어

### R의 자료형

* 문자형(character) : 문자, 문자열
* 수치형(numeric) : 정수(integer), 실수(double)
* 복소수형(complex) : 실수 + 허수
* 논리형(logical) : 참값과 거짓값

<br>

### R의 리터럴(데이터 값)

* 문자형(character)리터럴 : "가나다", '가나다', "", '', '123', "abc"

* 수치형(numeric)리터럴 : 100, 3.14, 0
* 논리형(logical)리터럴 : TRUE(T), FALSE(F)
* NULL : 데이터 셋이 비어있음을 의미 - 데이터 셋 자체가 비어있음
* NA : 데이터 셋의 내부에 존재하지 않는 값(결측치)를 의미 - 셋은 있는데 몇번째 위치에 값이 없다
* NaN(not a number) : 숫자가 아님, Inf(무한대 값)

<br>

#### 타입 체크 함수

* is.character(x) - 문자형
* is.logical(x) - 논리형
* is.numeric(x) - 수치형
* is.double(x) - 실수형
* is.integer(x) - 정수형

<br>

#### 자동 형변환 규칙

* 문자형 > 복소수형 > 수치형 > 논리형
* 즉,  문자형 + 논리형 = 문자형

<br>

#### 강제 형변환 함수

* as.character(x)
* as.complex(x)
* as.numeric(x)
* as.double(x)
* as.integer(x)
* as.logical(x)

<br>

#### 자료형 또는 구조 확인 함수

* class(x), str(x), mode(x), typeof(x)

파이썬 : True

자바스크립트 : true

R : TRUE(T)

<br>

### R의 데이터 셋

* 벡터(팩터), 행열, 배열, 데이터프레임, 리스트

![R](https://github.com/HWANG593/R_Programming/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/Data.JPG?raw=true)

<br>

#### 벡터(vector)

* 가장 기초적인 데이터셋(데이터 구조)로서 1차원으로 사용된다.
* 하나의 데이터 값도 벡터로 취급
* **동일 타입의 데이터만으로 구성** (문자형 > 수치형 > 논리형)
* 벡터 생성 방법 : ```c()```, ```seq()```, ```rep()``` : 연산자

* 미리 정의된 내장 상수 벡터 : LETTERS, letters, month.name, month.abb, pi
* 인덱싱 : **1**부터 시작하는 인덱스 값과 [인덱스] 연산자 사용
* 주요 함수 : length(), names(), sort(), order()

<br>

#### 행렬(matrix)

* 2차원의 벡터

* 동일 타입의 데이터만 저장 가능

* 인덱싱 : **[행의인덱싱, 열의인덱싱]**, **[행의 인덱싱, ]**, **[, 열의 인덱싱]**

  * 만약 하나의 행 or 하나의 열을 선택한다면 **1차원 벡터**로 바꿔버린다.
  * drop 속성 - 행렬구조 유지      -> 즉, **2차원**을 유지해라.

* 행렬 생성 방법 : ```matrix(data=벡터, nrow=행의 갯수, ncol=열의 갯수)``` (default 열 우선)

  ​							```matrix(data=벡터, nrow=행의 갯수, ncol=열의 갯수, byrow=TRUE)```

  ​							```rbind(벡터), cbind(벡터)```

* dim(matrix) : 행렬이 몇 차원인지 체크, nrow(matrix), ncol(matrix)
* 이외 : colnames(m), rownames(m), colSums(m), rowSums(m), colMeans(m), rowMeans(m), sum(m)
* apply(m, 1또는 2, 함수)

<br>

#### 팩터(factor)

* 가능한 범주값(level) 만으로 구성되는 벡터
* 팩터 생성 방법 : 
  * ```factor(벡터)```, ```factor(벡터[,levels = 레벨벡터])```
  *  ```factor(벡터[,levels=레벨벡터], ordered=TRUE)```

* 팩터의 레벨 정보 추출 : levels(팩터변수)

<br>

#### 데이터프레임(data.frame)

* 2차원 구조
* 열 단위로 **서로다른 타입의 데이터**들로 구성 가능
* **모든 열의 데이터 개수(행의 개수)는 동일해야 한다**
* 데이터프레임 생성 방법 : 
  * ```data.frame(벡터들)```, ```data.frame(열이름 = 벡터)```,
  * ```data.frame(벡터들, [,stringsAsFactor = False])``` 4.0 이전엔 default = T , 4.0 이후 F로 변경
  * ```as.data.frame(벡터 or 행렬)```

* 데이터프레임 변환 : rbind(df, 벡터), cbind(df, 벡터)
* 데이터프레임의 구조 확인 : **str(df)**, dim(df)
* 인덱싱 : [행의 인덱싱, 열의 인덱싱], [열의 인덱싱], df$컬럼이름, [[열 인덱싱]]
* 원하는 행과 열 추출 : subset(df, subset=(조건), select=컬럼명),  df[조건, 컬럼명]

<br>

#### 리스트(list)

* 저장 가능한 데이터의 타입 or 데이터 셋의 정류에 제한이 없음
* 서로 다른 구조의 데이터를 하나로 묶을 수 있는 자료구조
* R에서는 통계 분석의 결과를 리스트 구조로 제시하는 경우가 많다.
* list() 함수로 리스트를 생성하고, [], [[]], $ 를 통해 부분집합을 뽑아낸다.
  * [] : 리스트가 포함한 하위 리스트를 뽑아낸다. ( 출력이 list 형태를 유지함 )
  * [[]], $ : 하위 리스트가 포함한 원소를 추출하고, 계층구조 수준을 한 단계 제거한다. ( list 형태 추출 X )
* **unlist()** : 리스트 해제, 리스트를 벡터로 변환

<br>

### R의 연산자

| 연산자                         | 기능                            |
| ------------------------------ | ------------------------------- |
| {}                             | 블록 정의                       |
| ()                             | 괄호 기능                       |
| $                              | 성분 추출                       |
| [] , [[]]                      | 첨자 표현                       |
| ^ , **                         | 제곱 연산자                     |
| -                              | 음의 부호 연산자                |
| :                              | 연속된 데이터 정의              |
| %*%  , %/%  ,  %%              | 행렬의 곱,  몫,   나머지 연산자 |
| * ,  /                         | 곱셈, 나눗셈 연산자             |
| + ,  -                         | 더하기, 빼기 연산자             |
| < ,  > ,  <= ,  >=  , ==  , != | 비교 연산자                     |
| !                              | 부정 연산자                     |
| &  ,  &&  ,  \|  ,  \|\|       | 논리 연산자                     |
| <<-                            | 전역 할당 연산자                |
| <-  ,   =   ,   ->             | 할당 연산자                     |

<br>

### R의 데이터 입출력

#### 데이터 출력 함수

* print(출력데이터, 옵션) 
  * print(100)
  * print(data)
  * print(data, quote=F)
  * v1<- c("사과", "바나나", "포도")
  * print(v1), print(v1, print.gap = 10)
* cat(...., 옵션)
  * cat(100)
  * cat(100,200)
  * cat(100,200,"\n")
  * cat("aaa","bbb","ccc","\n")
  * cat(v1, sep="-", "\n")
* paste(...)
  * paste("aaa","가나다","123")
  * "aaa가나다123"

<br>

#### 데이터 셋과 함수 저장하기

* save(list=ls(), file = "all.rda")
* rm(list=ls())
* load("all.rda")

<br>

#### 파일에서 데이터 읽어들이기

* nums <- scan ("sample_num.txt")
* words_ansi <- scan ("sample_ansi.txt", what="")
* words_utf8 <- scan ("sample_utf8.txt", what="", e ncoding ="UTF 8")
* lines_ansi <- readLines ("sample_ansi.txt")
* lines_urf8 <- readLines ("sample_utf8.txt", encoding ="UTF 8")
* **df1 <- read.csv ("CSV 파일 또는 CSV 를 응답하는 URL")**
* **df2 <- read.table 일정한 단위 공백 또는 탭등 로 구성되어 있는 텍스트 파일 또는 URL")**

* **write.csv(파일명), write.table(파일명)**

<br>

### 제어문

#### if 문

```R
if (조건1){
	수행 명령 문장 1
}else if (조건2){
	수행 명령 문장 2
}else if (조건3){
	수행 명령 문장 3
}		:
		:
else
	수행 명령 문장 n
```

<br>

#### ifelse 함수

* ifelse(조건, 조건이 참일때 명령문1, 조건이 거짓일 때 명령문 2)

<br>

#### switch 함수

* switch(EXRP=수치데이터, 식1,식2,식3,...)
* switch(EXRP=문자열데이터, 비교값1 = 식1,비교값2 = 식2,비교값3 =, 비교값4 = 식3,..., 식4)

<br>

#### 반복문

>** 반복문 내에서는 화면에 결과 출력 시 출력함수print() 또는 cat()) 사용해야 한다.**

* for (변수 in 데이터셋){ 수행 명령 문장 }
* while (조건){ 수행 명령 문장 }
* repeat 명령문( while(TRUE)와 동일 )
  * 적어도 한 번 이상 명령문을 실행, 무한 루프에서 벗어나기 위해 분기문을 반드시 포함

<br>

#### 분기문

* break : 해당 루프(반복문)를 종료
* next : 현재 반복을 종료하고 실행 위치를 다음 반복문으로 이동

<br>

### 함수 정의 및 처리

#### 함수의 처리 과정

* 시작(입력) : 매개변수를 통해 아규먼트 값을 받아옴

