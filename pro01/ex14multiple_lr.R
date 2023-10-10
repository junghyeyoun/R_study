#  다중회귀분석 (독립변수가 복수)
state.x77 # 미국 각 주의 관련정보 dataset
colSums(state.x77)
# Population   Income  Illiteracy   Life Exp   Murder    HS Grad   Frost   Area 
class(state.x77)
is(state.x77)
str(state.x77)

states <- as.data.frame(state.x77[,c('Murder','Population','Income','Illiteracy','Frost')])
is(states)
str(states)
head(states, n=3)
cor(states) # 종속변수 : Murder(살인사건 발생률), 독립변수 : 'Population','Income','Illiteracy','Frost'

# 다중회귀모델 작성
mfit <- lm(formula = Murder ~ Population+Income+Illiteracy+Frost, data=states)
mfit
summary(mfit) # p-value: 9.133e-08 < 0.05이므로 유의한 모델, 설명력은 56.7%
# 각 독립변수 p 값은 Income: 0.9253 , Fros:0.9541로 유의수준 0.05보다 크므로 독립변수의 자격을 의심해야함

# 회귀모형의 적절성의 선행 조건을 확인
# 1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
# 2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
# 3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
# 4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
# 5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.

# 그래프 출력
par(mar=c(1,1,1,1))
par(mfrow=c(2,2))
plot(mfit)

# 독립 : population+illiteracy, 종속 : murder
install.packages("car",dependencies = T)
library(car)
imisi_mfit <- lm(formula = Murder ~ Population+Illiteracy, data=states)
imisi_mfit
summary(imisi_mfit)
par(mar=c(1,1,1,1))
par(mfrow=c(2,2))
plot(imisi_mfit)

# 그래프 출력결과 선형성은 만족하는 것으로 보임
# 선형성 만족 여부 수치로 확인
boxTidwell(Murder ~ Population+Illiteracy, data=states ) # Pr(>|t|) : 0.7483 > 0.05 이므로 선형성 만족(이거는 아까와 반대)


# 그래프 출력결과 정규성은 만족하는 것으로 보임
shapiro.test(residuals(imisi_mfit)) # p-value = 0.6098이므로 잔차의 정규성 만족

# 그래프 출력결과 등분산성은 만족하지 않을 가능성이 있아 보임
ncvTest(imisi_mfit) #  0.16305 >0.05이므로 잔차의 정규성 만족

# 독립성 
durbinWatsonTest(imisi_mfit) # p-value:0.29 p값이 2에 근사하면 독립성 만족하지 못함

# 다중공선성
?vif # Variance Inflation Factors (분산 팽창 요인)
vif(imisi_mfit) # 값이 10이 넘으면 다중공선성에 문제가 있다.

# 최적의 모델을 작성하려면 적당한 독립변수의 선택이 중요
# 독립변수의 개수가 많아지면 예측성능이 떨어지기 때문
mfit1 <- lm(formula = Murder~ Population+Income+Illiteracy+Frost, data=states)
summary(mfit1)

mfit2 <- lm(formula = Murder~ Population + Illiteracy, data=states)
summary(mfiy2)(mfit2) # p-value 

# AIC 통계량 : 모델을 평가하는 지표 중 하나로 최소의 정보 손실을 갖는 모델이 가장 데이터와 적합한 모델로 선택
AIC(mfit1, mfit2)
# df      AIC
# mfit1  6 241.6429
# mfit2  4 237.6565 # 더 값이 작으므로 좋은 모델로 평가됨

# 적당한 독립변수 선택방법중 stepwise regression
# 후진 소거법 (backward : 모든 변수를 넣고 기여도가 낮은 것부터 하나씩 제거)
full_model <- lm(Murder~., data = states)
reduce_model <- step(full_model, direction = "backward")

# 전진 선택법 (forward:유익한 변수부터 하나씩 추가)
min_model<-lm(Murder ~1, data = states) # 독립변수 없이 절편값만 주고 출발
fwd_model<-step(min_model,direction = "forward",scope=(Murder~Population+Income+Illiteracy+Frost),trace=1)
