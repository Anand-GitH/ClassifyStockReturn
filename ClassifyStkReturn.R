################################################################################
#Classification using logistic regression,LDA and k-NN 
#
#Modified by : Anand
#Modified on : 10-22-2020
################################################################################

rm(list=ls())

library("ISLR")
library("corrplot")
library("caret")
library("MASS")
library("class")

set.seed(22102020)

data(Weekly)
dim(Weekly)
head(Weekly)

x11()
plot(Weekly$Year,Weekly$Today)
table(Weekly$Direction)
summary(Weekly$Today)
x11()
hist(Weekly$Volume)
x11()
plot(Weekly$Year,Weekly$Volume)

#No much correlations between variables
cormat<-cor(Weekly[2:8])
x11()
corrplot(cormat,method="number",type="upper")

##################################################################################
log.fit<-glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Weekly,family="binomial")
summary(log.fit)

#Lag2 has some influence on the response variable direction.
#Lets predict and see how it behaves in classification
log.pred <- predict(log.fit, newdata = Weekly, type = "response")
true.response<-as.numeric(Weekly$Direction)-1
pred.response<-round(log.pred)

log.confmat<-confusionMatrix(as.factor(pred.response),as.factor(true.response))
log.confmat

head(Weekly$Direction)
head(true.response)
#################################################################################
trainindex<-Weekly$Year<=2008
traindata<-Weekly[trainindex,]
testindex<-Weekly$Year>=2009
testdata<-Weekly[testindex,]
table(traindata$Year)
table(testdata$Year)

dim(traindata)
dim(testdata)
names(Weekly)
log.fit<-glm(Direction ~ Lag2,data=traindata,family = "binomial")
summary(log.fit)

test.true<-as.numeric(testdata$Direction)-1
head(test.true)
head(testdata$Direction)
log.pred<-round(predict(log.fit,testdata))

conflog<-confusionMatrix(as.factor(log.pred),as.factor(test.true))
conflog
##################################################################################
lda.fit<-lda(Direction ~ Lag2,data = traindata)

lda.predict<-predict(lda.fit,newdata = testdata)

conflda<-confusionMatrix(lda.predict$class,testdata$Direction)
conflda

#################################################################################
#k-Nearest Neighbors

applyknn<-function(k,tdata,testdata,responsevar){
  knn(train=tdata,
      test=testdata,
      cl=as.factor(responsevar),
      k=k)
} 

predict.knn.test<-applyknn(1,data.frame(traindata$Lag2),data.frame(testdata$Lag2),traindata$Direction)

confknn<-confusionMatrix(predict.knn.test,testdata$Direction)
confknn

#############################################################################################