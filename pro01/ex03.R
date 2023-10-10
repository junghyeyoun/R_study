# 데이터 입출력
# 키보드 입력
n = scan() # 숫자 입력
n
sum(1:n)

ss = scan(what="") # 문자열 입력
ss

# edit 함수를 이용해 다량의 데이터 입력
df = data.frame() # 빈 데이터프레임 생성
df1 = edit(df)
df1

# 파일 읽기
getwd() # 현재 경로 보기
setwd("경로") # 경로 바꾸기

help("read.table")
? read.table

student = read.table("testdata/student.txt")
student
is(student)
str(student)

student = read.table("testdata/student1.txt", header = TRUE) # 칼럼명이 있는 경우
student

student = read.table("testdata/student2.txt", header = TRUE, sep = ";") # ;으로 구분된 데이터 
student

student = read.table("testdata/student3.txt", header = TRUE, sep=" ", na.strings = "-") # -으로 된 데이터 NA로 바꾸기
student
sum(student$total, na.rm=T) # 결측치 NA 처리 방안 : 해당 행 삭제, 평균으로 대체, 0으로 대체 ...

student = read.csv("testdata/student4.txt", header = TRUE, na.strings = "-") # csv : ,로 나눠져 있는 문서
student

# excel 문서 읽기

install.packages("xlsx")
Sys.setenv("JAVA_HOME='경로'") # 생략 가능
library(xlsx)
student_ex = read.xlsx2("testdata/student.xlsx", sheetIndex = 1)
student_ex

# 저장 ---------------------------------------------------------
aa = 10
cat('aa는 ', aa,"이 저장됨") # console로 출력
print(aa) # 한개만 출력

data = read.csv(file.choose(), encoding = "utf-8") # 파일 선택 창 출력해서 읽기
data

imsi = head(data, n=5)
imsi

write.table(imsi, "output/my1.txt", fileEncoding = "utf-8")
write.table(imsi, "output/my2.txt", row.names = T, fileEncoding = "utf-8")

write.csv(imsi, "output/my3.csv",  row.names = T, fileEncoding = "utf-8")
write.csv(imsi, "output/my4.csv",  row.names = T, fileEncoding = "utf-8", quote = F)











