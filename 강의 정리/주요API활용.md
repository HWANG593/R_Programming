# 주요API활용

## 날짜, 시간 관련 함수

#### 현재 날짜 및 시간

* Sys.Date()

* 현재 날짜 및 시간 : Sys.time()

#### 미국식 날짜 및 시간 

* date()

<br>

#### 연월일 시분초 타입 문자열 시간으로 변경

* as.Date("년-월-일 시:분:초") or as.Date("년/월/일 시:분:초")

<br>

#### 특정 포맷을 이용한 날짜 및 시간

* as.Date("날짜 및 시간 문자열",format="포맷")

<br>

#### 날짜 데이터끼리 연산 가능

* 날짜끼리 뺄셈 가능
* 날짜와 정수 덧셈뺄셈 가능
* 날짜 데이터끼리 연산 시 소수점 표현을 원하면 as.Date 대신 **as.POSIXct 함수** 이용
* 하루를 1로 간주

<br>

| 기호 | 의미 |
| ---- | ---- |
| %Y   |      |
| %A   |      |
| %B   |      |
| %m   |      |
| %d   |      |
| %b   |      |
|      |      |

```R
today <- Sys.Date()
format(today, "%d %B %Y")
weekdays(today)
months(today)
quarters(today)

# 실행 결과
"2021-03-02"
"02일 3월 2021년"
"화요일"
"3월"
"Q1"

unclass(today)	# 1970-01-01을 기준으로 얼마나 날짜가 지났는지 값
Sys.Date()
Sys.time()
Sys.timezone()
as.Date('1/15/2018', format = '%m/%d/%Y')
as.Date('4월 26, 2018', format = '%B %d, %Y')
as.Date('110228',format='%d%b%y')
as.Date('110228',format='%y%m%d')
as.Date('11228',format='%d%b%y')

# 실행 결과
18688
"2021-03-02"
"2021-03-02 19:44:28 KST"
"Asia/Seoul"
NA
"2011-02-28"
"2028-02-11"
```

```R
x1 <- "2021-03-02 13:30:41"
as.Date(x1, "%Y-%m-%d %H:%M:%S") 	# 문자열을 날짜형으로
strptime(x1, "%Y-%m-%d %H:%M:%S")	# 문자열을 날짜+시간형으로

x2 <- "20210302"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")

# 실행 결과
"2021-03-02"
"2021-03-02 13:30:41 KST"
"2020-03-02"
"2020-03-02 KST"

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00")
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")

# 실행 결과
Time difference of 0 days
Time difference of 3 hours
Time difference of 3 hours


t<-Sys.time()
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
unclass(ct) 
unclass(lt)
lt$mon+1    # 1월이 0이기때문에 +1해줘야한다
lt$hour
lt$year+1900

# origin으로부터 앞의 숫자만큼 지난 후
as.POSIXct(1449894438,origin="1970-01-01") 
as.POSIXlt(1449894438,origin="1970-01-01")
```

<br>

---

<br>

## 문자열 처리 함수들

* nchar() : 문자열 길이
* sort() : 정렬
* tolower() : 소문자로 변환
* toupper() : 대문자로 변환
* substr() : 시작점부터 끝점까지 지정하여 출력
* substring() : 시작점만 지정하여 끝까지 출력
* grep() : pattern을 통해 해당 str이 들어간 데이터의 인덱스 출력
* gsub() : pattern을 뒤의 str로 대체
* strsplit() : 기준을 통해 split(분할)하여 list로 반환

<br>

---

<br>

## apply 계열 함수

* apply 함수들은 데이터 전체에 함수를 한 번에 적용하는 벡터 연산을 수행하므로 속도도 빠르고 구현도 간단하다

| 함수     | 설명                                                         | 특징                                               |
| -------- | ------------------------------------------------------------ | -------------------------------------------------- |
| apply()  | 배열 or 행렬에 주어진 함수를 적용한 뒤 그 결과를 벡터 or 배열 or 리스트로 반환 | 배열 또는 행렬에 적용                              |
| lapply() | 벡터, 리스트 or 표현식에 함수를 적용하여 그 결과를 리스트로 반환 | 리스트로 반환                                      |
| sapply() | lapply와 유사하나 결과를 가능한 심플한 데이터셋으로 반환     | 심플 데이터셋으로 반환                             |
| tapply() | 벡터에 있는 데이터를 특정 기준에 따라 그룹으로 묶은 뒤 각 그룹마다 주어진 함수를 적용하고 그 결과를 반환 | 데이터를 그룹으로 묶은 뒤 함수를 적용              |
| mapply() | sapply의 확장된 버전, 여러 개의 벡터 또는 리스트를 인자로 받아 함수에 각 데이터의 첫째 요소들을 적용한 결과, 둘째 요소들을 적용한 결과, 셋째 요소들을 적용한 결과 등을 반환 | 여러 데이터셋의 데이터를 함수의 인자로 적용한 결과 |

