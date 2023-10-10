# 군집분석(clustering anlaysis) : 비지도 학습
# 계층적, 비계층적이 있음
# 군집 간 유사성과 비유사성 확인을 위해 거리계산법 사용 - 맨하튼 거리계산법, 유클리디안 거리계산법 등 

# 유클리디안 거리계산법 - 피타고라스 이용
x <- matrix(1:16, nrow=4)
x
?dist # "euclidean", "maximum", "manhattan", "canberra", "binary" or "minkowski"
dist <- dist(x, method="euclidian")
dist
plot(dist)
text(dist, c(LETTERS[1:6]), pos=2)

sqrt(sum((x[1, ] - x[4, ])^2)) # 유클리드 거리계산법 수식으로 작성

getwd()
setwd("c:/work/rsou/pro01")
txt1 <- read.csv("testdata/cluster_ex.csv")
txt1

plot(txt1[,c(2:3)], xlab='국어', ylab='영어', main='학생점수 산포도', xlim=c(30,100),ylim=c(30,100))

# 홍길동과 이기자 두 학생의 거리 계산
text(txt1[,2],txt1[,3], lables<- abbreviate(rownames(txt1)), cex=0.8, pos=1, col='blue')
text(txt1[,2],txt1[,3], lables<- txt1[,1], cex=0.8, pos=2, col="blue")
points(txt1[1,2], txt1[1,3], col="orange", pch=19)
points(txt1[2,2], txt1[2,3], col="orange", pch=19)

dist_mht <- dist(txt1[c(1:2),c(2:3)],method="manhattan")
dist_mht

dist_euc <- dist(txt1[c(1:2),c(2:3)],method="euclidean")
dist_euc
