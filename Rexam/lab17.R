library(ggplot2)


data(mpg)
# 1-1 구조 확인
str(mpg)

# 1-2 행 갯수 열 갯수
nrow(mpg)
ncol(mpg)

# 1-3 앞에서 10개
head(mpg,10)

# 1-4 뒤에서 10개
tail(mpg,10)

# 1-5 GUI 출력
View(mpg)

# 1-6 열 단위로 요약
summary(mpg)

# 1-7 제조사별 차량의 수
mpg %>% group_by(manufacturer) %>% count

# 1-8 제조사별 모델별 차량의 수
mpg %>% group_by(manufacturer,model) %>% count


data(mpg)
# 2-1  cty -> city, hwy -> highway
mpg1 <- mpg %>% rename(city = cty, highway = hwy)

# 2-2 출력
mpg1



data(midwest)
# 3-1 구조 확인
str(midwest)

# 3-2 poptotal -> total , popasian -> asian
midwest1 <- midwest %>% rename(total = poptotal, asian = popasian)
midwest1

# 3-3 asian_per_total
midwest1 <- midwest1 %>% mutate(asian_per_total = asian/total)

# 3-4 파생변수 large small
mean_percentage <- midwest1 %>% summarise(mean(asian_per_total))

midwest1 <- midwest1 %>% mutate(result = ifelse(asian_per_total >= 
                                                  mean_percentage[[1]],"large","small"))


# 4-1 4이하인게 연비가 더 높다
data(mpg)
mpg %>% filter(displ <= 4) %>% summarise(mean(hwy)) 
mpg %>% filter(displ >= 5) %>% summarise(mean(hwy)) 


# 4-2 토요타가 더 높다
mpg %>% filter(manufacturer == "audi") %>% summarise(mean(cty))
mpg %>% filter(manufacturer == "toyota") %>% summarise(mean(cty))

# 4-3 자동차 추출, hwy 전체 평균
cfh <- mpg %>% filter(manufacturer == "chevrolet" | manufacturer == "ford" | manufacturer == "honda")
distinct(cfh,model)
cfh %>% summarise(mean(hwy))



# 5-1 
data(mpg)
new_mpg <- mpg %>% select(class, cty)
head(new_mpg)

# 5-2 campact형이 더 높다
new_mpg %>% filter(class == "suv") %>% summarise(mean(cty))
new_mpg %>% filter(class == "compact") %>% summarise(mean(cty))

# 6
data(mpg)
mpg %>% filter(manufacturer == "audi") %>% arrange(hwy) %>% head(5)
