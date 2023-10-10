#  ANN(인공신경망) : 뉴런이 하나이 경우 논리회로 중 XOR문제를 해결할 수 없다.
install.packages("nnet")
library(nnet)

input <- matrix(c(0,0,1,1,0,1,0,1), ncol=2)
input
output<- matrix(c(0,0,0,1)) # and, or, xor
output

ann <- nnet(input, output, maxit =1, size=1, decay=0.001)
ann
result <- predict(ann, input)
result
ifelse(result > 0.5, 1,0)
