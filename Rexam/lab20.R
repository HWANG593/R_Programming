library(psych)
library(MASS)
library(corrgram)
library(corrplot)

data("airquality")

str(airquality)
airquality_test <- airquality[,1:4]
airquality_test <- na.omit(airquality_test)

# 상관 계수, p-value
corr.test(airquality_test)

# p-value 0.05 이상
cor.test(airquality_test$Wind, airquality_test$Solar.R)


# 시각화 1
pairs(airquality_test)
dev.copy(png, "output/lab20_1.png")
dev.off()

# 시각화 2
pairs.panels(airquality_test, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of US States Data")

dev.copy(png, "output/lab20_2.png")
dev.off()

# 시각화 3
corrplot(cor(airquality_test), method="pie", type="lower", order="hclust", tl.srt=45, diag=F, addCoef.col="black")

dev.copy(png, "output/lab20_3.png")
dev.off()
