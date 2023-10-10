# 시각화 (그래프 출력)
# 이산변수(등간척도:절대적0점o, 정수로 표현 o) : 막대, 점, 원형 차트 등을 사용
# 연속변수(비율척도:절대적0점x, 정수로 표현 x) : 상자박스, 히스토그램, 산점도 등을 사용
# 차트의 종류 무지 많음, 중요한 것은 내 데이터에 맞는 차트 그리기

getwd()
stu = read.csv("testdata/ex_studentlist.csv", fileEncoding = "utf-8")
stu
head(stu, n=3)
str(stu) # 구조 확인

# 세로 막대
graphics::barplot(stu$grade, col=c(1,2,5))
barplot(stu$grade, col=rainbow(3), main='세로막대', xlab='학생', ylab='점수')

# 가로 막대 
barplot(stu$grade, horiz = T)

par(mfrow=c(1,2)) # 그림 영역 1행 2열
barplot(stu$grade, horiz = T)
graphics::barplot(stu$grade, color=c(1,2,5))

par(mfrow=c(1,1))

# 점차트
dotchart(stu$grade)
dotchart(stu$grade, color = 2:5, cex=1.5, pch=1:3) # cex: 점크기, pch : 모양

# 파이차트
df = na.omit(stu) # na값 제거
df
pie(df$age)
pie(df$age, labels = df$age, lty = 5)

# box plot : 연속형 데이터의 분포를 표현
mean(stu$height)
boxplot(stu$height, range=0) # range = 0이 기본값
boxplot(stu$height, range=1)
boxplot(stu$height, range=1, notch = T) # notch 
abline(h=mean(stu$height), lty=3, col='blue') # 평균값 표시

hist(stu$height)
hist(stu$height, breaks =3) # 막대의 간격 바꾸기

hist(stu$height, breaks =3, prob=TRUE)
lines(density(stu$height)) # 밀도 곡선도 추가하기

plot(x=stu$height, y=stu$weight) 

head(iris)
plot(iris$Sepal.Length, iris$Petal.Length)