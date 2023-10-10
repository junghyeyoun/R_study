a = 1
b = 2
ls() # 변수들의 목록
rm(a) # 지우기
rm(list = ls()) # 다 지우기
gc() # 사용이 종료(어떤 변수도 주소를 참조하지 않는 상태)된 객체(instance)가 점유하고 있는 메모리 해제
# R에서 제공하는 자료구조 (Object type) 
# 원자값(scale) 자료형은 없다.

#  Vector : 1차원 배열 형태의 자료구조 (동일한 형태의 자료만 저장됨)
# - 벡터는 같은 자료형의 데이터를 정해진 갯수만큼 모아놓은 것이다. 
# - 생성 함수 : c(), seq(), rep()
# - 처리 함수 : setdiff(), intersect(), union()
year = 2023
is.vector(year) # year는 vector
# 타입확인
is(year)
class(year)
mode(year)
typeof(year)
year = as.integer(year) # 형변환
typeof(year)
year[1]

# 수열 만들기
seq(form= 1, to=5, by=1)
seq(1,5) # 1증가는 생략가능
1:5
aa = seq(1,10,2)
aa
seq(1,10,length.out=7) # length.out=절대적인 개수

rep(1:3, times=3) # 반복
reo(1:3, 3)
rep(1:3, each=3)
rep(1:3, each=3, times=2)

aa = c(1:10, 13, 20:25, -5:-8) # 제일 많이 쓰임
is.vector(aa) # TRUE

c(1,3.5,TRUE,F) # TRUE = 1, F = 0 / 배열이기 때문에 타입이 일정해야함 /우선순위 : character > double > integer > logical

age = c(10,20,30)
names(age)
age = c("홍길동","한국인","신기해") # 벡터의 칼럼명 부여
age
age[1] # = age["홍길동"]
age = c(age,40) # 값 하나 추가
age[10] = "tom"
age

age2 = append(age, 60, after=6)
age2
age2 = NULL # null은 자리값 없음
age

# 인덕셍, 슬라이싱 : 첨자 이용
v1 = c(13, -5, 20:23, 12, -2:3)
v1
v1[1]
v1[c(2,3,5,6:8)]
v1[-1] # -를 붙이면 여집합 출력 / 1번째 뺀 나머지
v1[-c(1,3,5:8)]
v1[2: (length(v1)-8)]

# 연산
a = 1:5
a
a + 5 # 각각의 벡터에 5를 더함
a ^ 2
a ** 2

a = 1:3
b = 4:6
a + b # 요소끼리 연산
a - b
a * b
a / b

a[4] =2 
b[4] = 2
union(a,b) # 합집합 - 중복 허용x
c(a,b) # 합집합 - 중복 허용
setdiff(a,b) # 차집합 
intersect(a,b) # 교집합


# Matrices : 2차원의 dataset 이다. 이는 매트릭스 함수에 벡터를 제공함으로써 만들 수 있다.
# 동일 데이터 타입을 갖는 2차원 배열(행렬 구조).
# 선형대수학 정리 http://kipid.tistory.com/entry/Linear-Algebra
# 생성 함수 : dim(), matrix(), rbind(), cbind()
# matrix: 긴 벡터를 잘라서 행렬로 변환
# cbind: 여러 개의 벡터를 좌우로 붙여서 행렬로 변환
# rbind: 여러 개의 벡터를 위아래로 붙여서 행렬로 변환
# 처리함수 : apply()

a=1:8
dim(a) 
dim(a) = c(2,4) # dim을 이용해서 매트릭스 만들기 / 2행 4열 
a
class(a)

m = base::matrix(1:5)
m
m = base::matrix(1:9, nrow = 3)
m
m = base::matrix(1:9, nrow = 3, byrow=T)
m
m2 = matrix(1:10, 2) # 하나만 쓰면 행을 뜻함
m2
dim(m2)
mode(m2)
m2
m2(2,)
m2(2:3,)
m2(c(1,3),)
m2[.1]
m2[1:3,c(1,3)]
m2[,-1]

matrix(c(1,2.2,'kbs'))

a = matrix(c(1:9), nrow=3, dimnames = list(c("r1","r2","r3")))
a
length(a)
ncol(a) # 열의 개수
nrow(a) # 행의 개수

rownames(a) = c("1행","2행","3행")
colnames(a) = C("1열","2열","3열")
a

a = matrix(C(1,2,3,4,),nrow=2, ncol=2)
a
b = matrix(5:8, 2,2)

a + b
a - b
a/b
a*b # 아다마르 곱
a%%b # 행렬의 곱

a
diag(a) # 대각요소각만 뽑기
diag(3) # 단위 행렬 : 주 대각이 1이고 나머지가 1임
a
t(a) # 전치행렬(행과 열의 위치를 변환)

x1 = c(5,40,50:52)
x1
x2 = c(30, 5 ,6:8)
mr = rbind(x1,x2) # 1차원 배열이 2차원 배열 합쳐짐 / 행을 기준으로
mr

mc = cbind(x1, x2) # 열을 기준으로
mc

x = matrix(1:9, 3, 3)
x
apply(x,1,max) # 행단위 최대값 구하기 함수
apply(x,2,max) # 열단위 최대값 구하기 함수

# Arrays : matrix는 2차원에 한정되지만 arrays는 어떠한 차원으로도 만들 수 있다. 
# 동일 데이터 타입을 갖는 다차원 배열. (활용도는 다소 낮다)
# matrix는 행과 열을 갖는 2차원 자료구조다.
# Array는 행과 열, page를 갖는 3차원 자료구조다.
# 생성 함수 : array(data, dim)

d = c(1:12)
d
class(d) #integer
arr1 = array(d) # 1차원 배열
arr1
class(arr1) # array

arr2 = array(1:12, dim = c(6,2))
arr2 # 2차원 배열

arr3 = array(1:12, dim = c(3,2,2)) # dim(행, 열, 면)
arr3 # 3차원 배열

# 배열 조회
arr3[,,1] # 1면
arr3[,1,2] # 2면 1행
arr3[1,,2] # 2면 1열
arr3[1,1,2]

# List : 서로 다른 타입의 데이터를 기억할 수 있다.
# - 성격이 다른 데이터(벡터, 행렬, 데이터프레임 등 모든 데이터)의 기억이 가능,
# c의 구조체, java의 레코드형 기억장소와 유사
# - 생성 함수 : list()
# - 처리 함수 : unlist(), lapply(), sapply()

li = list("1", "한국인", 95, "2", "tom", 88)
li
class(li)
unli = unlist(li)
unli
class(unli)

datas = list(x=1:5, y=6:10) # key, value 형식으로 리스트 생성
datas
datas$x
datas$y


# Data Frames : 구조화된 데이터 오브젝트다. 
# 데이터베이스의 테이블 구조와 유사, 칼럼 단위로 type이 달라도 됨
# - 가장 많이 사용되는 객체 타입
# - 데이터프레임과 행렬은 모두 2차원 데이터이지만 다음과 같은 점이 다르다.
# 데이터프레임의 각 열은 서로 다른 자료형이 될 수 있다.
# 데이터프레임은 열 이름, 행 이름을 가질 수 있다.
# - 생성 함수 : data.frame(열이름1=요소, 열이름2=요소, …)
# - 처리 함수 : apply(), str(), ncol(), nrow(), summary()

# 방법 1 : vector를 이용해 data.frame 작성
no = c(1,2,3)
name= c('hong','lee','kim')
pay = c(200,500,300)
df = data.frame(bunho=no,irum=name,pay=pay)
df
class(df) # "data.frame"
mode(df)
is(df)

df = data.frame(irum=c('james','oscar','tom'), nai=c(34,23,42))
df
nrow(df)
bcol(df)
str(df)
summary(df)
head(df, n=2)
tail(df,n=2)
names(df)

# 방법2 : matrix를 이용해 data.frame 작성
m <- matrix(c(1,'hong',400,2,'lee',500,3,'kim',350), 3, by=T)
m

mdf <- data.frame(m)
mdf
cikbenas(mdf) <- c('번호', '이름', '급여')

type(mdf$번호)

typeof(mdf['번호'])
mdf[1]
mdf[-1]
mdf[1,c(1,3)]

# 조건을 지정해 특정 행 출력
mdf[mdf$번호 == 2 & mdf$이름 == 'lee', ]
subset(mdf, 번호 == 2 & 이름 == 'lee')

mdf[mdf$번호 == 2 | mdf$번호 == 1, ]
subset(mdf, 번호 == 2 | 번호 == 1)

mdf[mdf$번호 == 1, C(1,2)]
subset(mdf, 번호 == 1, select = c(1,2))

# 행, 열 추가
mdf
mdfr = rbind(mdf, c("4",'park','550'))
mdfr
mdfc = cbind(mdf, 번호=c("5"),이름=('choi'),급여=c('550'))
mdfc
# 행 삭제
mdfc[-1,]
# 열 삭제
mdfc[,"번호"] =NULL
mdfc

# base package가 제공하는 iris dataset 사용
head(iris, n=3)
class(iris)
str(iris)
mean(iris$Sepal.Length)
apply(iris[1:4], 1, mean) 
apply(iris[1:4], 2, mean) 

#data.table type : data.frame을 개선한 package 제공
install.packages("data.table")
library(data.table)
dt = as.data.table(mdf)
dt
class(dt)
 
idata = as.data.table(iris)
head(idata, 3)

# merge : data.frame 들을 합성
height = data.frame(id=c(1,2,2),h=c(180,175,178))
height
weight = data.frame(id=c(1,2,3), w=c(80,75,88))
weight

merge(height, weight)

merge(height, weight, by.x="id", by.y = "id") # id를 기준으로 병합 ( 기본값)
merge(height, weight, all = T) # data없어도 병합에 참여

aa = merge(height, weight, all = T)

subset(aa, h >= 175)
subset(aa, h >= 175, select = c(1,w) )
subset(aa, h >= 175, select = c(-1,-w) )
