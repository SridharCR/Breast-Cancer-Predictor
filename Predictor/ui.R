#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Breast Cancer Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      tags$h3("Mean"),
      numericInput(inputId = 'radius_mean','Radius', 5),
      numericInput(inputId = 'texture_mean','Texture', 1),
      numericInput(inputId = 'perimeter_mean','Perimeter', 1),
      numericInput(inputId = 'area_mean','Area', 1),
      numericInput(inputId = 'smoothness_mean','Smoothness', 2),
      numericInput(inputId = 'compactness_mean','Compactness', 1),
      numericInput(inputId = 'concavity_mean','Concavity', 3),
      numericInput(inputId = 'concave.points_mean','Concave Points', 1),
      numericInput(inputId = 'symmetry_mean','Symmetry', 3),
      numericInput(inputId = 'fractal_dimension_mean','Fractal Dimension', 3),
      tags$h3("Standard Error"),
      numericInput(inputId = 'radius_se','Radius', 5),
      numericInput(inputId = 'texture_se','Texture', 1),
      numericInput(inputId = 'perimeter_se','Perimeter', 1),
      numericInput(inputId = 'area_se','Area', 1),
      numericInput(inputId = 'smoothness_se','Smoothness', 2),
      numericInput(inputId = 'compactness_se','Compactness', 1),
      numericInput(inputId = 'concavity_se','Concavity', 3),
      numericInput(inputId = 'concave.points_se','Concave Points', 1),
      numericInput(inputId = 'symmetry_se','Symmetry', 3),
      numericInput(inputId = 'fractal_dimension_se','Fractal Dimension', 3),
      tags$h3("Worst"),
      numericInput(inputId = 'radius_worst','Radius', 5),
      numericInput(inputId = 'texture_worst','Texture', 1),
      numericInput(inputId = 'perimeter_worst','Perimeter', 1),
      numericInput(inputId = 'area_worst','Area', 1),
      numericInput(inputId = 'smoothness_worst','Smoothness', 2),
      numericInput(inputId = 'compactness_worst','Compactness', 1),
      numericInput(inputId = 'concavity_worst','Concavity', 3),
      numericInput(inputId = 'concave.points_worst','Concave Points', 1),
      numericInput(inputId = 'symmetry_worst','Symmetry', 3),
      numericInput(inputId = 'fractal_dimension_worst','Fractal Dimension', 3),
      actionButton("Run_model", "Run model")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("model summary", verbatimTextOutput('summary'))
      )
    )
  )
))
