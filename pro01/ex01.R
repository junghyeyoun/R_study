# ctrl + enter : script에 있는 명령어 console로 이동
# crtl + shift + c : 주석

# 변수(데이터 유형) 
# r에는 데이터 치환 밑에와 같이 세가지 있음 마지막꺼는 안쓰는게 좋음
va <- 1
va = 2
3 -> va
va

# print 하는 방법
print(va)
cat(va)
print(1,2) # 변수값 하나만 찍힘
cat(1,2) # 변수 여러개 찍힘
va[1]

# 이름에 . _ 사용 가능
.a = 5
a.b = 5
a_b = 5

a = 5
b = 3
v =  6
c = a+b

a=5
b=6
(c = a+b)

# 데이터 유형(문자형, 숫자형, 복소수형, 논리형)
ss = "홍길동" # 작은 따옴표, 큰 따옴표 구분 없음
typeof(ss) # character

kbs = 9
typeof(kbs) # double

zz = 5.5 - 31
typeof(zz)
Re(zz)
is.logical(bb) #  이타입이 맞니? / true

bb = TRUE
typeof(bb)

# 결측값
aa = NA 
sum(2,3)
syn(2,3,NA) # NA 있으면 에러
sum(2,3,NA,na.rm = T) # na.rm = T 있으면 결측값 제거

typeof(NA) # logical
typeof(NULL) # NULL
typeof(NaN) # double

length(NA) # 1
length(NULL) # 0
length(NaN) # 1
0/0
Inf = 0

# 참고 -----------------
# package : 데이터셋(dataset) + 함수 + 알고리즘 구러미(컬렉션, R패키지가 저장된 폴더는 라이브러리 함)
install.packages("plyr") # 패키지 설치
library(plyr) # 메모리에 로딩
search() # 로딩된 패키지의 목록 확인
plyr::ddply() # 패키지명::함수 (함수이름 겹칠때 사용)
help("ddply")
# 도움말 사용
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)
ddply(dfx, .(group, sex), summarize,
      mean = round(mean(age), 2),
      sd = round(sd(age), 2))

remove.packages("plyr")

data() # 현재 지원하는 data set 목록보기
Nile # 나일강 데이터 조회
head(Nile, 3) # 세개만 보기
hist(Nile) # 히스토그램
lines(density(Nile))

example("head")
help("mean")
example("mean")
x <- c(0:10, 50, 100)
c(xm, mean(x, trim = 0.10)) # outlier 제거
mean(x)

head(iris, 3)
mean(iris$Sepal.Length)
