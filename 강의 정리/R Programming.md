# R Programming

#### R의 자료형

* 문자형(character) : 문자, 문자열
* 수치형(numeric) : 정수(integer), 실수(double)
* 복소수형(complex) : 실수 + 허수
* 논리형(logical) : 참값과 거짓값



#### R의 리터럴(데이터 값)

* 문자형(character)리터럴 : "가나다", '가나다', "", '', '123', "abc"

* 수치형(numeric)리터럴 : 100, 3.14, 0
* 논리형(logical)리터럴 : TRUE(T), FALSE(F)
* NULL : 데이터 셋이 비어있음을 의미 - 데이터 셋 자체가 비어있음
* NA : 데이터 셋의 내부에 존재하지 않는 값(결측치)를 의미 - 셋은 있는데 몇번째 위치에 값이 없다
* NaN(not a number) : 숫자가 아님, Inf(무한대 값)



#### 타입 체크 함수

* is.character(x) - 문자형
* is.logical(x) - 논리형
* is.numeric(x) - 수치형
* is.double(x) - 실수형
* is.integer(x) - 정수형



#### 자동 형변환 규칙

* 문자형 > 복소수형 > 수치형 > 논리형
* 즉,  문자형 + 논리형 = 문자형



#### 강제 형변환 함수

* as.character(x)
* as.complex(x)
* as.numeric(x)
* as.double(x)
* as.integer(x)
* as.logical(x)



#### 자료형 또는 구조 확인 함수

* class(x), str(x), mode(x), typeof(x)

파이썬 : True

자바스크립트 : true

R : TRUE(T)



### R의 데이터 셋

* 벡터(팩터), 행열, 배열, 데이터프레임, 리스트

![R](https://github.com/HWANG593/R_Programming/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/Data.JPG?raw=true)



#### 벡터(vector)

* 가장 기초적인 데이터셋(데이터 구조)로서 1차원으로 사용된다.
* 하나의 데이터 값도 벡터로 취급
* **동일 타입의 데이터만으로 구성** (문자형 > 수치형 > 논리형)
* 벡터 생성 방법 : ```c()```, ```seq()```, ```rep()``` : 연산자

* 미리 정의된 내장 상수 벡터 : LETTERS, letters, month.name, month.abb, pi
* 인덱싱 : **1**부터 시작하는 인덱스 값과 [인덱스] 연산자 사용
* 주요 함수 : length(), names(), sort(), order()



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



#### 팩터(factor)

* 가능한 범주값(level) 만으로 구성되는 벡터
* 팩터 생성 방법 : 
  * ```factor(벡터)```, ```factor(벡터[,levels = 레벨벡터])```
  *  ```factor(벡터[,levels=레벨벡터], ordered=TRUE)```

* 팩터의 레벨 정보 추출 : levels(팩터변수)



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

