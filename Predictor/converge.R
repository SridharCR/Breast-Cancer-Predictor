library("caret")
data <- read.csv("~/Desktop/BreastCancer/Data/breast-cancer-wisconsin.data.csv", header = FALSE)
colnames(data) <- c("sample_code_number", "clump_thickness", "uniformity_of_cell_size", "uniformity_of_cell_shape", "marginal_adhesion", "single_epithelial_cell_size", 
                              "bare_nuclei", "bland_chromatin", "normal_nucleoli", "mitosis", "classes")
samplesize = 0.60 * nrow(data)
set.seed(80)
index = sample( seq_len ( nrow ( data ) ), size = samplesize )

# Create training and test set
datatrain = data[ index, ]
datatest = data[ -index, ]

## Scale data for neural network


## Fit neural network 


# load library
library(neuralnet)

# creating training and test set
trainNN = data[index , ]
testNN = data[-index , ]

# fit neural network
set.seed(2)
NN = neuralnet(classes~ clump_thickness+uniformity_of_cell_size+uniformity_of_cell_shape+marginal_adhesion+single_epithelial_cell_size+bland_chromatin+normal_nucleoli+mitosis,data = trainNN ,hidden = 8, linear.output = TRUE)

# plot neural network
plot(NN)

testNN <- testNN[,-ncol(testNN)]
testNN <- testNN[,-1]
## Prediction using neural network
pred <- predict(NN, testNN, type = "class")
save(NN , file = 'Neuralnetwork1.rda')
