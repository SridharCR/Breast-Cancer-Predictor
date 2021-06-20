# This file is used to create the neural network for diagnostic breast cancer data as a serialized object file.

# Load required libraries
library(NeuralNetTools)
library(caret)
library(nnet)
library(funModeling)

# Load data
cancerdata <- read.csv("data/breast-cancer-diagnostic.csv")
cancerdata <- subset(cancerdata, select = -c(X))

cancerdata$diagnosis<-as.factor(cancerdata$diagnosis) 
cancerdata_status=df_status(cancerdata)

set.seed(1234)

# 80:20 data partition
dataindex <- createDataPartition(cancerdata$diagnosis, p=0.8, list = FALSE) 
# 80% train data  
train_data <- cancerdata[dataindex, -1] 
# Rest 20% validation data
test_data <-  cancerdata[-dataindex, -1]

model_nnet <- nnet(diagnosis ~ .,data=train_data,size= 20, decay= 0.01, rang=0.6,trace=TRUE,maxit=200 )

save(model_nnet , file = 'Predictor/Neuralnetwork.rda')
class_pred <- predict(model_nnet,test_data[,-1],type="class")

# rel_imp <- garson(model_nnet, bar_plot = FALSE)$rel_imp
# cols <- colorRampPalette(c('lightgreen', 'darkgreen'))(3)[rank(rel_imp)]
# plotnet(model_nnet, cex_val = .5,circle_col = list(cols, 'lightblue'))