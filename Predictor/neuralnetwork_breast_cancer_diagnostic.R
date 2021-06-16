# This file is used to create the neural network for diagnostic breast cancer data as a serialized object file.

# Load required libraries
library(knitr)
library(corrplot)
library(funModeling)
library(gmodels)
library(C50)
library(NeuralNetTools)
library(caret)
library(nnet)
library(partykit)
library(gridExtra)
library(devtools)

# Load data
cancerdata <- read.csv("Data/data.csv")
cancerdata <- subset(cancerdata, select = -c(X))

cancerdata$diagnosis<-as.factor(cancerdata$diagnosis) 
cancerdata_status=df_status(cancerdata)
corrplot <- cor(cancerdata[,3:ncol(cancerdata)])
# corrplot(corrplot, order = "hclust", tl.cex = 0.65, addrect = 8)

set.seed(1234)

dataindex <- createDataPartition(cancerdata$diagnosis, p=0.8, list = FALSE)   # 80:20 data partition
train_data <- cancerdata[dataindex, -1]         # 80% train data
test_data <-  cancerdata[-dataindex, -1]       # Rest 20% validation data

model<-C5.0(diagnosis ~ ., data=train_data)     # Decision tree model  We use DEFAULT parameter values
result<-predict(model, test_data[,-1])           # 1st column is held back. It is diagnosis 
(accuracy<-sum(result == test_data$diagnosis)/nrow(test_data))        # decision tree Accuracy

model_nnet<-nnet(diagnosis ~. ,data= train_data, size=10)
result1<-predict(model_nnet, test_data[,-1], type = c("class") )       # Prediction on validation set
(accuracy<-sum(result1 == test_data$diagnosis)/nrow(test_data))        # nnet Accuracy


columncol<-hcl(c(270, 260, 250), 200, 30, 0.6)
labelcol<-hcl(200, 200, 50, 0.2)
indexcol<-hcl(150, 200, 50, 0.4)
model_tree=C50:::as.party.C5.0(model)

model_nnet <- nnet(diagnosis ~ .,data=train_data,size= 20, decay= 0.01, rang=0.6,trace=TRUE,maxit=200 )

save(model_nnet , file = 'Predictor/Neuralnetwork.rda')
class_pred <- predict(model_nnet,test_data[,-1],type="class")

rel_imp <- garson(model_nnet, bar_plot = FALSE)$rel_imp
cols <- colorRampPalette(c('lightgreen', 'darkgreen'))(3)[rank(rel_imp)]
plotnet(model_nnet, cex_val = .5,circle_col = list(cols, 'lightblue'))