
setwd("C:/Users/kotak/Downloads")
getwd()
install.packages("plyr")
install.packages("rpart.plot")
install.packages("caret")
install.packages("gridExtra")
install.packages("tidyverse")
install.packages("rsample")
install.packages("e1071")
install.packages("GGally")
install.packages("data.table")
install.packages("readr")
install.packages("DT")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("corrplot")
install.packages("corrplot")
install.packages("rms")
install.packages("MASS")
install.packages("ROCR")
install.packages("gplots")
install.packages("pROC")
install.packages("rpart")
install.packages("randomForest")
install.packages("ggpubr")
#import all the library
library(plyr)
library(rpart.plot)
library(caret)
library(gridExtra)
library(tidyverse)
library(rsample)
library(e1071)
library(GGally)
library(data.table)
library(DT)
library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)
library(rms)
library(MASS)
library(ROCR)
library(gplots)
library(pROC)
library(rpart)
library(randomForest)
library(ggpubr)
#reading the data
churn_data<-read.csv("churn_data.csv")
head(churn_data)
customer_data<-read.csv("customer_data.csv")
head(customer_data)
internet_data<-read.csv("internet_data.csv")
head(internet_data)
#combining all the data
data1<-merge(churn_data, customer_data, how='inner', on='customerID')
data<-merge(data1, internet_data, how='inner', on='customerID')
#dimensions of the data
dim(data)
#visualize the data
head(data)
tail(data)
#structure
str(data)
#summary statistics
summary(data)
#Data Preprocessing
sapply(data, function(x) sum(is.na(x)))
data[is.na(data$TotalCharges),]
#Checking proportion
sum(is.na(data$TotalCharges))/nrow(data)
telecom<-data[complete.cases(data), ]
telecom$SeniorCitizen<-as.factor(mapvalues(telecom$SeniorCitizen,
from=c("0","1"),
to=c("No", "Yes")))
telecom$MultipleLines<-as.factor(mapvalues(telecom$MultipleLines,
from=c("No phone service"),
to=c("No")))
for(i in 10:15){
telecom[,i]<-as.factor(mapvalues(telecom[,i],
from= c("No internet service"), to= c("No")))
}
telecom$customerID <- NULL
#Data Visualization
#Demographic Data
#Gender plot
p1 <- ggplot(telecom, aes(x = gender)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Senior citizen plot
p2 <- ggplot(telecom, aes(x = SeniorCitizen)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Partner plot
p3 <- ggplot(telecom, aes(x = Partner)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Dependents plot
p4 <- ggplot(telecom, aes(x = Dependents)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Plot demographic data within a grid
grid.arrange(p1, p2, p3, p4, ncol=2)
#Offered Services
#Phone service plot
p5 <- ggplot(telecom, aes(x = PhoneService)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Multiple phone lines plot
p6 <- ggplot(telecom, aes(x = MultipleLines)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Internet service plot
p7 <- ggplot(telecom, aes(x = InternetService)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Online security service plot
p8 <- ggplot(telecom, aes(x = OnlineSecurity)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Online backup service plot
p9 <- ggplot(telecom, aes(x = OnlineBackup)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Device Protection service plot
p10 <- ggplot(telecom, aes(x = DeviceProtection)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Tech Support service plot
p11 <- ggplot(telecom, aes(x = TechSupport)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Streaming TV service plot
p12 <- ggplot(telecom, aes(x = StreamingTV)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Streaming Movies service plot
p13 <- ggplot(telecom, aes(x = StreamingMovies)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Plot service data within a grid
grid.arrange(p5, p6, p7,p8, p9, p10,p11, p12, p13,ncol=3)
#Other Categorical Variables
#Contract status plot
p14 <- ggplot(telecom, aes(x = Contract)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Paperless billing plot
p15 <- ggplot(telecom, aes(x = PaperlessBilling)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Payment method plot
p16 <- ggplot(telecom, aes(x = PaymentMethod)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
#Plot contract data within a grid
grid.arrange(p14, p15, p16, ncol=1)
#Quantitative Variables
#Tenure histogram
p17 <- ggplot(data = telecom, aes(tenure, color = Churn))+
geom_freqpoly(binwidth = 5, size = 1)
#Monthly charges histogram
p18 <- ggplot(data = telecom, aes(MonthlyCharges, color = Churn))+
geom_freqpoly(binwidth = 5, size = 1)
#Total charges histogram
p19 <- ggplot(data = telecom, aes(TotalCharges, color = Churn))+
geom_freqpoly(binwidth = 200, size = 1)
#Plot quantitative data within a grid
grid.arrange(p17, p18, p19, ncol=1)
#Churn : variable of interest
p20 <- ggplot(telecom, aes(x = Churn)) +
geom_bar(aes(fill = Churn)) +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3)
p20
#Checking Correlation
telecom %>%
dplyr::select (TotalCharges, MonthlyCharges, tenure) %>%
cor() %>%
corrplot.mixed(upper = "circle", tl.col = "black", number.cex = 0.7)
set.seed(56)
split_train_test <- createDataPartition(telecom$Churn,p=0.7,list=FALSE)
dtrain<-telecom[split_train_test,]
dtest<-telecom[-split_train_test,]
# Remove Total Charges from the training dataset
dtrain <- dtrain[,-19]
dtest <- dtest[,-19]
## Decision tree analysis
tr_fit <- rpart(as.factor(Churn )~., data = dtrain, method="class")
rpart.plot(tr_fit)
tr_prob1 <- predict(tr_fit, dtest)
tr_pred1 <- ifelse(tr_prob1[,2] > 0.5,"Yes","No")
table(Predicted = tr_pred1, Actual = dtest$Churn)
tr_prob2 <- predict(tr_fit, dtrain)
tr_pred2 <- ifelse(tr_prob2[,2] > 0.5,"Yes","No")
tr_tab1 <- table(Predicted = tr_pred2, Actual = dtrain$Churn)
tr_tab2 <- table(Predicted = tr_pred1, Actual = dtest$Churn)
# Train
confusionMatrix(
as.factor(tr_pred2),
as.factor(dtrain$Churn),
positive = "Yes"
)
# Test
confusionMatrix(
as.factor(tr_pred1),
as.factor(dtest$Churn),
positive = "Yes"
)
tr_acc <- sum(diag(tr_tab2))/sum(tr_tab2)
tr_acc
#Set control parameters for random forest model selection
ctrl <- trainControl(method = "cv", number=5,
classProbs = TRUE, summaryFunction = twoClassSummary)
#Exploratory random forest model selection
rf_fit1 <- train(Churn ~., data = dtrain,
method = "rf",
ntree = 75,
tuneLength = 5,
metric = "ROC",
trControl = ctrl)
saveRDS(rf_fit1, "Churn.RDS")
#Run optimal model
rf_fit2 <- randomForest(as.factor(Churn )~., data = dtrain,
ntree = 75, mtry = 2,
importance = TRUE, proximity = TRUE)
#Display variable importance from random tree
varImpPlot(rf_fit2, sort=T, n.var = 10,
main = 'Top 10 important variables')
rf_pred1 <- predict(rf_fit2, dtest)
table(Predicted = rf_pred1, Actual = dtest$Churn)
plot(rf_fit2)
rf_pred2 <- predict(rf_fit2, dtrain)
rf_tab1 <- table(Predicted = rf_pred2, Actual = dtrain$Churn)
rf_tab2 <- table(Predicted = rf_pred1, Actual = dtest$Churn)
# Train
confusionMatrix(
as.factor(rf_pred2),
as.factor(dtrain$Churn),
positive = "Yes"
)
# Test
confusionMatrix(
as.factor(rf_pred1),
as.factor(dtest$Churn),
positive = "Yes"
)
rf_acc <- sum(diag(rf_tab2))/sum(rf_tab2)
rf_acc
lr_fit <- glm(as.factor(Churn )~., data = dtrain,
family=binomial(link='logit'))
summary(lr_fit)
lr_prob1 <- predict(lr_fit, dtest, type="response")
lr_pred1 <- ifelse(lr_prob1 > 0.5,"Yes","No")
table(Predicted = lr_pred1, Actual = dtest$Churn)
lr_prob2 <- predict(lr_fit, dtrain, type="response")
lr_pred2 <- ifelse(lr_prob2 > 0.5,"Yes","No")
lr_tab1 <- table(Predicted = lr_pred2, Actual = dtrain$Churn)
lr_tab2 <- table(Predicted = lr_pred1, Actual = dtest$Churn)
# Train
confusionMatrix(
as.factor(lr_pred2),
as.factor(dtrain$Churn),
positive = "Yes"
)
# Test
confusionMatrix(
as.factor(lr_pred1),
as.factor(dtest$Churn),
positive = "Yes"
)
lr_acc <- sum(diag(lr_tab2))/sum(lr_tab2)
lr_acc
p21 <- ggplot(telecom, aes(x = Contract, fill = Churn)) +
geom_bar() +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3) +
labs(title="Churn rate by contract status")
p21
p22 <- ggplot(telecom, aes(x = InternetService, fill = Churn)) +
geom_bar() +
geom_text(aes(y = ..count.. -200,
label = paste0(round(prop.table(..count..),4) * 100, '%')),
stat = 'count',
position = position_dodge(.1),
size = 3) +
labs(title="Churn rate by internet service status")
p22
p23 <- ggplot(telecom, aes(x = tenure, fill = Churn)) +
geom_histogram(binwidth = 1) +
labs(x = "Months",
title = "Churn rate by tenure")
p23
p24 <- ggplot(telecom, aes(x = TotalCharges, fill = Churn)) +
geom_histogram(binwidth = 100) +
labs(x = "Dollars (binwidth=100)",
title = "Churn rate by tenure")
p24
