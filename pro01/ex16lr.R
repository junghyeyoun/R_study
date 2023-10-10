# Logistic Regression
# 종속변수(y:범주형)와 독립변수 (x:연속형)간의 관계를 통해 분류 모델을 작성
# 대게의 경우 이항분류를 함
# 신경망 이론(딥러닝)의 기초가 됨

# 실습 : 미국의 어느 대학원 입학여부 관련 dataset을 사용
getwd()
# gre:영어점수, gpa:내신성적, rank:등급?, admit:합격여부
mydata = read.csv('testdata/binary.csv')
head(mydata,n=3)
unique(mydata$admit)
summary(mydata)
str(mydata) # 4개의 변수, 400개의 데이터
# admit에 대한 rank 빈도수
table(mydata$admit,mydata$rank)
xtabs(formula = ~admit + rank,data = mydata)

# 데이터 분리 : 학습데이터 70%, 검정데이터 30% - 과적합 방지가 목적적
set.seed(1) # 난수표 1번열 불러옴(실습이라 난수고정할거임)
idx <- sample(1:nrow(mydata),nrow(mydata) * 0.7) # 비복원 추출
length(idx)
train = mydata[idx,] # idx행, 열은 전체
test=mydata[-idx,]
dim(train) # 280 4 학습데이터
dim(test) # 120 4 검증데이터
head(train,n=3)
head(test,n=3)

# 로지스틱 회귀모델(이항분류)

lgmodel = glm(formula = admit~.,data=train,family = binomial(link="logit")) # 로직변환을 위한 glm(일반화)를 써줌
lgmodel
anova(lgmodel)
summary(lgmodel)

# 분류예측
pred = predict(lgmodel,newdata = test,type = "response") # 이항일땐 type을 response로 써줌
head(pred,n=10) # 이걸 0.5를 기준으로 1이야 0이야 나눔
cat('예측값 : ',head(ifelse(pred > 0.5,1,0),50))
cat('실제값 : ',head(test$admit, 50))

# 분류 정확도 계산
result_pred = ifelse(pred>0.5,1,0)
t=table(result_pred,test$admit)
t
# confusion matrix를 이용해 모델의 Accuracy(정확도)를 구함함
(77+11) / nrow(test) # 분류 정확도(Accuracy) 73%. 0.73333...
(t[1,1]+t[2,2]) / nrow(test)
sum(diag(t)) / nrow(test) # 주 대각값의 합만 구함( sum(diag(t))


)

# 새로운 값으로 분류 결과 얻기
newdata = train[c(1:3),] # 1행부터 3행까지 모든 열 참여해라
newdata = edit(newdata)
new_pred = predict(lgmodel,newdata = newdata,type = 'response')
new_pred
ifelse(new_pred>0.5,'합격','불합격')