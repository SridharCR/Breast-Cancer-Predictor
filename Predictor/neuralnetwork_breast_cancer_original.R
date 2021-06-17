# This file is used to create the neural network for original breast cancer data as a serialized object file.

# Load required libraries
library("neuralnet")
library("caret")

# Load data
data <- read.csv("Data/breast-cancer-original.csv", header = FALSE)
# Set the attribute names
colnames(data) <-
  c(
    "sample_code_number",
    "clump_thickness",
    "uniformity_of_cell_size",
    "uniformity_of_cell_shape",
    "marginal_adhesion",
    "single_epithelial_cell_size",
    "bare_nuclei",
    "bland_chromatin",
    "normal_nucleoli",
    "mitosis",
    "classes"
  )


samplesize = 0.60 * nrow(data)
set.seed(80)
index = sample(seq_len (nrow (data)), size = samplesize)

# Creating training and test set
trainNN = data[index ,]
testNN = data[-index ,]

# Creating neural network
# Algorithm = Resilient Backpropagation with weight backtracking

set.seed(2)
formula = classes ~ clump_thickness + uniformity_of_cell_size + uniformity_of_cell_shape +
  marginal_adhesion + single_epithelial_cell_size + bland_chromatin + normal_nucleoli +
  mitosis

NN = neuralnet(
  formula = formula,
  data = trainNN ,
  hidden = c(5, 5, 5),
  rep = 3,
  algorithm = "rprop+",
  act.fct = "logistic",
  linear.output = T,
)

# Plot neural network
plots <- plot(NN)

testNN <- testNN[, -ncol(testNN)]
testNN <- testNN[, -1]

# Prediction using neural network
pred <- predict(NN, testNN, type = "class")

# Saving the trained model as serialized object file
save(NN , file = 'Predictor/Neuralnetwork1.rda')
