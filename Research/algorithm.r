library(dplyr)
library(ggplot2)
library(corrplot)
library(gridExtra)
library(lattice)
library(C50)
library(caret)
library(purrr)
library(ggfortify)
library(gmodels)
library(nnet)
library(vcd)
library(NeuralNetTools)
cancer_data <- read.csv("Research/data.csv")
map_int(cancer_data, function(.x) sum(is.na(.x)))
cancer_data<- cancer_data[,-c(1,33)]
dim(cancer_data)

cancer_data2<- cancer_data[,-findCorrelation(data_corr,cutoff = 0.9)]

#Number of columns for our new data frame

ncol(cancer_data2)

prepro_pca_cancerdata<- prcomp(cancer_data[,-1],scale = TRUE, center = TRUE)
summary(prepro_pca_cancerdata)
data_corr<- cor(cancer_data[,-1])
corrplot::corrplot(data_corr, order = "hclust", tl.cex = 1, addrect = 8)


pca_data_var<- prepro_pca_cancerdata$sdev^2
pv_data<-pca_data_var/sum(pca_data_var)
cum_pv<- cumsum(pv_data)
pv_table<- tibble(comp= seq(1:ncol(cancer_data[-1])),pv_data,cum_pv)

#Let's plot the graph

ggplot(pv_table,aes(x=comp,y=cum_pv))+ geom_point(col= "red")+ geom_abline(intercept = 0.95,slope = 0)
