# 단순 선형 회귀
# 미국 여성의 height, weight가 담긴 dataset을 사용
women
head(women, n=3)

cor(women$height, women$weight) # 0.9954948
plot(women$height, women$weight)

mfit <- lm(formula = weight ~ height, data=women)
mfit # y(weight) = 3.45(height) *x + (-87.52)

58 * 3.45 +(-87.52)
48 * 3.45 +(-87.52)
59.1234 * 3.45 +(-87.52)

abline(mfit, col='red') # 회귀선

summary(mfit) # 모델에 대한 요약통계량

pred <- predict(mfit, data.frame(height=c(45.5,5,55.5,60.5)))
pred

cor.test(women$height, women$weight) # 상관관계 분석               
1.091e-14 ** 2

# 회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.

# 회귀분석모형 진단 그래프
par(mfrow=c(2,2))
plot(mfit)

