# 단순/다중선형 회귀 : mtcars dataset으로 msg(연비) 예측하기
head(mtcars,n=3)
str(mtcars) # 32 * 11

# 연습 1 -단순선형회귀
# hp(마력수):독립변수,mpg(연비): 종속변수
# 임의의 마력수를 입력하면 연비는 얼마?

cor(mtcars$hp,mtcars$mpg) #  -0.7761684
plot(mpg~hp, data=mtcars,xlab='hp',ylab='mpg')

# 인과관계가 있다고 판단하고 회귀분석모델 작성
model1 <- lm(mpg~hp, data=mtcars)
model1 # y=-0.06823*x + 30.09886 
summary(model1) #  p-value: 1.788e-07 < 0.05 유의한 모델. 설명력(R-squared) : 0.6024. 60.24% 설명하는 유의한 모델
# 설명력은 참고자료일 뿐 전적으로 믿진 않는다

abline(model1,col='red')

# 예측1: 수식사용
new_hp=110
cat('예측값 : ', -0.06823 * new_hp + 30.09886)

new_hp=160
cat('예측값 : ', -0.06823 * new_hp + 30.09886)

# 예측2 : predict 함수 사용
mynew <- mtcars[c(1:2), ] # 기존 데이터를 읽어 새로운 hp 얻기
mynew <- edit(mynew)
mynew
pred <- predict(model1,newdata=mynew)
cat('예측값 : ', pred)

# 연습2 - 다중선형회귀
# hp(마력수),we(차체무게):독립변수,mpg(연비): 종속변수
# 임의의 마력수를 입력하면 연비는 얼마?
cor(mtcars$hp,mtcars$mpg)
cor(mtcars$wt,mtcars$mpg) #  -0.8676594

model2 = lm(formula = mpg ~ hp+wt,data = mtcars)
model2
summary(model2) # R-squared:  0.8268,  p-value: 9.109e-12
# 수식 : y^ = -0.03177 * new_hp + (-3.87783) * new_wt + 37.22727

# 예측1 : 수식사용
new_hp=110; new_wt=2.2
cat('예측값 : ', -0.03177 * new_hp -3.87783 * new_wt + 37.22727) # 25.20134

new_hp=130; new_wt=5.2
cat('예측값 : ', -0.03177 * new_hp -3.87783 * new_wt + 37.22727) # 12.93245. 마력 높고 차체무게가 무거우면 연비는 떨어지네


# 예측2 : 함수사용
pred2 <- predict(model2) # 모델 작성 학습에 참여한 데이터로 예측
cat('예측값 : ',pred2[1:10]) #  23.5 22.5 25.2 21.2 18.3 20.4 15.5 22.8 21.9 19.9
cat('실제값 : ',mtcars$mpg[1:10]) # 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2

# 새로운 값에 대한 연비가 궁금
new_data = data.frame(hp=123.45, wt=3.456)
predict(model2,newdata=new_data)
