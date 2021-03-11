library(dplyr)
library(ggplot2)

emp <- read.csv("data/emp.csv")
View(emp)

# 문제 1
emp %>% filter(job == "MANAGER")

# 문제 2
emp %>% select(empno, ename, sal) 

# 문제 3
emp %>% select(-empno)

# 문제 4
emp %>% select(ename, sal)

# 문제 5
emp %>% count(job)

# 문제 6
emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename, sal, deptno)

# 문제 7
emp %>% filter(job != "ANALYST") %>% select(ename, job, sal)

# 문제 8
emp %>% filter(job == "SALESMAN" | job == "ANALYST") %>% select(ename,job)

# 문제 9
dept1 <- emp %>% filter(deptno == 10)
dept2 <- emp %>% filter(deptno == 20)
dept3 <- emp %>% filter(deptno == 30)
sum(dept1$sal)
sum(dept2$sal)
sum(dept3$sal)


# 문제 10
emp %>% arrange(sal)

# 문제 11
emp %>% arrange(desc(sal)) %>% head(1)

# 문제 12
empnew <- emp %>% rename(salary = sal, commrate = comm)

# 문제 13
empnew %>% count(deptno) %>% tail(1)

# 문제 14
empnew %>% 
  mutate(enamelength = nchar(emp$ename)) %>% 
  arrange(enamelength)

# 문제 15
empnew %>% filter(commrate >= 0) %>% count
