# 내장 함수
seq(1,5, by=1.5)

set.seed(123) # random number 고정 / 난수표 12(seed number)3번 패턴 발생시키기
aa = rnorm(5000, mean=10, sd=1) # rnorm : 정규분포를 따르는 난수 생성
aa 
mean(aa)
hist(aa)

bb= runif(5000, min=0, max=100) # 균등분포를 따르는 난수 생성
mean(bb)
hist(bb)

sample(1:100, 10)

vec = 1:10
min(vec) # 최소값
max(vec) # 최대값
range(vec) # 범위
mean(vec) #평균
median(vec) #중앙값
var(vec) # 분산
sqrt(var(vec)) # 분산에 루트 = 표준편차
sd(vec) # 표준편차
quantile(vec) # 4분위수
table(vec)

# 사용자 정의 함수
func1 = function() {
  print("사용자 만세")
}
func1()
typeof(func1) # "closure" : 함수의 주소 가지고 있는거

func2 = function(arg1) {
  print(arg1)
  return(arg1 +10)
}
func2(10)

# 구구단 출력
gugu_func <- function(dan) {
  for(d in dan){
    for(i in 1:9) {
      cat(d, '*', i, '=', d*i, ' ')
    }
    cat('\n')
  }
}
gugu_func(2:5)

















