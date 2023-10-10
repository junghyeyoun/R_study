# 단순 선형회귀 분석 모델 
# 독립변수(x) 1개 : 연속형, 종속변수(y) : 연속형

# 부모의 두뇌지수(IQ)와 자녀의 두뇌지수(IQ)를 이용해 선형회귀 분석
x <- c(110,120,130,140,150) # 부모
y <- c(100,105,128,115,155) # 자녀
cor(x,y) # 상관계수 : 0.8621722 -> 양의 상관관계가 매우 강함
plot(x,y)
# 두 변수의 인과관계는? x가 y에 영향을 줌 (분석가의 주관) --> 회귀분석을 시도할 수 있음

# x = wx + b  w? b? <== 최소제곱법을 사용

# 모델 생성 방법1 : 최소제곱법 수식을 사용
x_dev <- x-mean(x) # x에 대한 편차
y_dev <- y-mean(y) # y에 대한 편차
dev_mul <- (x-mean(x)) * (y-mean(y)) # 두 변수 각 편차의 곱
square <- x_dev ** 2 # x 편차 제곱
df <- data.frame(x, y, x_dev, y_dev, dev_mul, square)
df
mean(df$x)
mean(df$y)
sum(df$dev_mul)
sum(df$square)

w <- sum(df$dev_mul) / sum(df$square)
w # 기울기 : 1.2

b <- mean(df$y) - w*mean(df$x)
b # 절편 : -35.4
# y = w*x + b  y = 1.2*x + (-35.4) # 모델 완성
# 부모의 IQ 110인 경우 자식 IQ는?
w * 110 +b # 96.6
w * 120 +b # 108.6
1.2 * 120 + (-35.4)

# 모델 생성 방법2 : R이 제공하는 함수 사용
mymodel <-lm(formula = y ~ x)  # lm(formula = 종속변수 ~ 독립변수) -> 바로 기울기와 절편나옴 
mymodel
predict(mymodel, data.frame(x=c(110, 120, 87.5, 134.567))) 

plot(x,y)
abline(mymodel, col="blue") # 추세선 : 잔차가 최소가 되는 평균들을 이은 선
