# 인공신경망
df <- data.frame(
  x1=c(1:6),
  x2=c(6:1),
  y=factor(c('n','n','n','y','y','y'))
)
df
str(df)
# x1,x2:독립변수, y:종속변수

library(nnet)
model <- nnet(y ~., df, size=2) # nnet(formula,dataset,size=hidden수)
model
summary(model)

install.packages("devtools")
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
plot.nnet(summary(model))

# 분류 모형 예측
model$fitted.values # 분류 모델 적합값
predict(model,df)
ifelse(predict(model,df) > 0.5,1,0)
ifelse(predict(model,df) > 0.5,"y","n")

pre = predict(model,df,type = "class") # 범주형인 경우엔 굳이 25번처럼 안 써도 됨
pre

table(pre,df$y)