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

![R](C:\Users\HYM\Desktop\R.JPG)



#### 벡터(vector)

* 가장 기초적인 데이터셋(데이터 구조)로서 1차원으로 사용된다.
* 하나의 데이터 값도 벡터로 취급
* **동일 타입의 데이터만으로 구성** (문자형 > 수치형 > 논리형)
* 벡터 생성 방법 : ```c()```, ```seq()```, ```rep()``` : 연산자

* 미리 정의된 내장 상수 벡터 : LETTERS, letters, month.name, month.abb, pi
* 인덱싱 : **1**부터 시작하는 인덱스 값과 [인덱스] 연산자 사용
* 주요 함수 : length(), names(), sort(), order()



#### 행렬(matrix)

