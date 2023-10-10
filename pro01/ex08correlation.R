# 공분산, 상관계수
plot(1:5, 2:6)
cov(1:5, 2:6) # 공분산 / 메소드 안적어주면 피어슨
cor(1:5, 2:6) # 상관계수 : 공분산을 표준화한 값 / 상관계수가 1라는 것은 완전 정비례

plot(10:50, 20:60)
cov(10:50, 20:60)
cor(10:50, 20:60) 

plot(1:5, c(3,3,3,3,3))
cov(1:5, c(3,3,3,3,3)) # 0
cor(1:5, c(3,3,3,3,3)) # 공분산이 0이기 때문에 na

plot(1:5, 5:1)
cov(1:5, 5:1) # 음의 상관관계
cor(1:5, 5:1) # 반비례

# 아버지와 아들 키의 공분산과 상관계수 구하기
getwd()
hf = read.csv("testdata/galton.csv", header = T)
head(hf, n=3)
dim(hf) # 몇행 몇열인지
str(hf) # 구조

hf_man = subset(hf, sex == "M")
head(hf_man)
dim(hf_man)
hf_man = hf_man[c('father', 'height')]
head(hf_man)

# 공분산
cov(hf_man$father, hf_man$height) # 양의 관계(정비례) / 2.368441
# 상관계수
cor(hf_man$father, hf_man$height) # 0.3913174

plot(hf_man$father, hf_man$height) # 폭이 좁을수록 상관관계 높음

cor.test(hf_man$father, hf_man$height, method = 'pearson')

plot(height ~ father, data = hf_man, xlab="아버지키", ylab = "아들키")
abline(lm(height ~ father, data = hf_man)) # 데이터들의 평균을 지나가는 선 그어줌
