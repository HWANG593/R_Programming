# 문제 1

v1 <- sample(1:30, 10, replace=TRUE)
v2 <- letters[26:17]
v1;v2;

# 문제 2
v <- seq(10,38,2)
m1 <- matrix(v, nrow=3, ncol=5, byrow=T)
m2 <- m1 + 100
m_max_v = max(m1)
m_min_v = min(m1)
row_max = apply(m1,1,max)
col_max = apply(m1,2,max)

m_max_v;m_min_v;row_max;col_max;


# 문제 3
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)

m2 <- cbind(n1,n2,n3)

# 문제 4
m3 <- rbind(n1,n2,n3)


# 문제 5
colnames(m3) <- c("col1","col2","col3")
rownames(m3) <- c("row1","row2","row3")

# 문제 6
alpha <- matrix(letters[1:6], nrow=2)
alpha2 <- rbind(alpha,c('x','y','z'))
alpha3 <- cbind(alpha,c('s','p'))

# 문제 7
a <- array(1:24, dim=c(2,3,4))
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a + 100
a[,,4] * 100
a[1,c(2,3),]
a[2,,2] <- a[2,,2] + 100
a[,,1] <- a[,,1] - 2
a <- a * 10
rm(a)
