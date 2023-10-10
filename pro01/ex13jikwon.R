# 원격 db의 jikwon 테이블을 이용해 근무년수에 대한 연봉 추론하는 선형회귀모델 작성
# 임의의 새로운 근무년수에 대한 연봉을 예측하기
library(DBI)
library(rJava)
library(RJDBC)

drv <- JDBC(driverClass="org.mariadb.jdbc.Driver", classPath="C:/work/mariadb-java-client-3.1.0.jar")

conn <- dbConnect(drv, "jdbc:mariadb://127.0.0.1:3306/test","root","seoho123")

dbListTables(conn) # table 목록

query <- "select jikwon_pay, date_format(now(),'%Y')-date_format(jikwon_ibsail,'%Y') +1 as jikibsa from jikwon"
datas = dbGetQuery(conn, query)
head(datas, 3)
is(datas)
str(datas)
table(datas$jikibsa) #입사년별 건수

cor(datas$jikibsa, datas$jikwon_pay) # 0.9196725 아주 강한 양의 상관관계

plot(datas$jikibsa, datas$jikwon_pay)
# 인과관계가 있다고 가정하고 선형회귀 모델 작성
model <- lm(formula = jikwon_pay ~ jikibsa, data = datas)
abline(model, col='blue')

summary(model) # p-value: 6.943e-13 < 0.05 유의한 모델
# 독립변수가 종속변수(분산)을 84.58%를 설명한다.

# 키보드로 미지의 근무년수 입력해 연봉 얻기
y_pred <-predict(model, newdata = data.frame(jikibsa=c(5,5.5,7)))
y_pred

go_func <- function() {
  y_num <- readline('근무년수 입력 : ')
  y_num <- as.numeric(y_num)
  new_data <- data.frame (jikibsa=y_num)
  return(predict(model, newdata = new_data))
}    
cat('예측결과는 ',go_func())
