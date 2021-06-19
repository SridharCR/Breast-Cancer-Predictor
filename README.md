# Prediction of Cancer
The breast cancer is becoming a serious issue between the women. One woman will die of breast cancer every 13 minutes. The diagnosis of the breast cancer is a complex task and takes time for the doctor to chack and analyze the lab results. Here we predict the breast cancer on its initial stages, with the lab results. This repo can be categorized to be
- Research
     It comprises of analyzing the data with various methodologies and applying different algorithms to improve the
     efficieny of the requirement.
- Web Application
     Based on the research, the web application is created.
## Getting Started
Clone this repository and get started
```sh
$ git clone https://github.com/SridharCR/Breast-Cancer-Predictor.git
```

### Prerequisties
Your workstation should have the following tools and softwares
- R 3.5.x
- RStudio
- Install required packages

## Directory Breakdown
* data - Breast cancer data set in Comma Separated Values(CSV) format.
* Predictor - Web application to predict the breast cancer both original and diagnostic.
* resources - System generated figures and other stuff required in RMD.

## Exploratory Data Analysis Summary:
This project focussed on 2 relevant datasets related to breast cancer. They belong from Wisconsin medical center.
The summary for the exploratory data analysis are as follows,
- ### Breast cancer Original data:
  The attributes information of the dataset are as follows,
    - sample_code_number
    - clump_thickness
    - uniformity_of_cell_size
    - uniformity_of_cell_shape
    - marginal_adhesion
    - single_epithelial_cell_size
    - bare_nuclei
    - bland_chromatin
    - normal_nucleoli
    - mitosis
    - result
  ### Data insights:
     None
  ### Model Info:   
     The neural network is used to classify the result from the input attributes.
     
     - Input layer = 1 layer with 1d of input attributes
     - Hidden layer = 1 layer with 1d of 20 neurons
     - Output layer = 1 layer with 1 neuron

     Neural network visualization:
     ![NN Diagnostic ](resources/nn_diagnostic.png "NN Diagnostic")

- ### Breast cancer Diagnostic data
  - radius (mean of distances from center to points on the perimeter)
  - texture (standard deviation of gray-scale values)
  - perimeter
  - area
  - smoothness (local variation in radius lengths)
  - compactness (perimeter^2 / area - 1.0)
  - concavity (severity of concave portions of the contour)
  - concave points (number of concave portions of the contour)
  - symmetry
  - fractal dimension ("coastline approximation" - 1)

  ### Data insights:
     Visualization of correlation matrix
     ![Corrplot ](resources/plot_correlation_matrix.png "Corr plot Diagnostic")

  ### Model Info:   
     The neural network is used to classify the result from the input attributes.
     
     - Input layer = 1 layer with 1d of input attributes
     - Hidden layer = 1 layer with 1d of 20 neurons
     - Output layer = 1 layer with 1 neuron

     Neural network visualization:
     ![NN Diagnostic ](resources/nn_diagnostic.png "NN Diagnostic")

  Check ./research/diagnostic data/breast-cancer-dataset-analysis-diagnostic-data.Rmd file for more explained EDA.

## Web Application

## Screenshots of the web app
![Screenshot1 ](resources/Selection_154.png "Screenshot 1")



![Screenshot2](resources/Selection_153.png "Screenshot 2")


## Version
- Version 1.0 - Jan 2019
- Version 2.0 - Jun 2021

