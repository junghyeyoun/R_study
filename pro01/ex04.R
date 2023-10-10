# 산술(+,-,*,/,%%,^,**), 관계 (==,!=,>,>=,<,<=), 논리(&, |, !, xor())

# 제어문 : 조건 판단문 
# if()
x = 10;
y =5;

if(x+y >= 10) {
  cat("결과는 ", x+y)
  cat("\n참일 때 수행")
} else {
  print("거짓일 때 수행")
}

# elseif 가능

# 삼항연산자

ifelse(x>=5,'good','bad')

# dataset을 사용해서 if 연습

mpg # Error: object 'mpg' not found / ggplot2에 들어있는 dataset
install.packages("ggplot2")
library(ggplot2)
head(mpg, n=2) # spss로 만들어 저장했기 때문에 자료형이 있음
mpg = as.data.frame(ggplot2::mpg)
dim(mpg)
str(mpg)
summary(mpg)
mpg$total = (mpg$cty + mpg$hwy) /2 # 열 추가
mean(mpg$total) # 20.14957
head(mpg, n=2)

if(mean(mpg$total) >= 20) {
  cat('우수 연비')
} else {
  cat('일반 연비')
}
summary(mpg$total)
hist(mpg$total)

mpg$test = ifelse(mpg$total >= 20, '합격', '불합격')
head(mpg)
tail(mpg)

mpg$grade = ifelse(mpg$total >= 30, 'A', ifelse(mpg$total >= 20, 'B', 'C'))
head(mpg)

# switch 조건문
# switch(비교구문, 실행1, 실행2...)
switch("age",id="hong",age=33, name="홍길동")
a = 2 
switch (a, mean(1:10), sd(1:10))

# 반복문
# for(변수 in 값) {표현식}
i = 1:5
for(n in i) {
  print(n)
}

for(su in 1:9) {
  res = 2*su
  cat(2, '*', su, '=', res ,'\n')
}

for(n in i) {
  if(n %% 2 == 0) print(n)
}

for(n in i) { # for문 안에 if문
  if(n %% 2 == 1) {
    next
  } else {
    print(n)
  }
}

# while(조건) {표현식}
i = 0
while(i < 10) {
  i = i+1
  print(i)
}

i =0
while(T) {
  i = i+1
  print(i)
  if(i ==3) break
}

# repeat
cnt = 1
repeat{
  print(cnt)
  cnt = cnt +2
  if(cnt > 5) break
}



