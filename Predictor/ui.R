#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(shinydashboard)
library(DT)

dashboardPage(
  title = "Breast Cancer Prediction",
  header <- dashboardHeader(title = "Breast Cancer",dropdownMenu(type = "messages",
                                                       messageItem(
                                                         from = "Sales Dept",
                                                         message = "Sales are steady this month."
                                                       ),
                                                       messageItem(
                                                         from = "New User",
                                                         message = "How do I register?",
                                                         icon = icon("question"),
                                                         time = "13:45"
                                                       ),
                                                       messageItem(
                                                         from = "Support",
                                                         message = "The new server is ready.",
                                                         icon = icon("life-ring"),
                                                         time = "2014-12-01"
                                                       )
  )),
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("dashboard")),
      menuItem("Dimensions of tumour cells", tabName = "physical_dimensions" ,icon = icon("cog", lib = "glyphicon")),
      menuItem("Tumour Cell data", tabName = "cellular data", icon = icon("diagnoses")),
      menuItem("Github", icon = icon("send",lib='glyphicon'), 
               href = "https://github.com/SridharCR/Breast-Cancer-Predictor")
    )
  ),
  body <- dashboardBody(fluidPage(
    tabItems(
      tabItem(tabName = "home",
              fluidRow(
                # A static valueBox
                valueBox(10 * 2, "New Orders", icon = icon("credit-card")),
                
                # Dynamic valueBoxes
                valueBoxOutput("progressBox"))
              
              ),
      tabItem(tabName = "cellular data",
              
              fluidRow(
                # A static valueBox
                valueBox(10 * 2, "New Orders", icon = icon("credit-card")),
                
                # Dynamic valueBoxes
                valueBoxOutput("progressBox"))
      ),
      tabItem(tabName = "physical_dimensions",
    box(title = "Mean data", status = "primary", solidHeader = T, width = 12,
    frow1 <- fluidRow(
      tags$head(
        tags$style("
                     .input-sm,.selectize-input {
                     min-height: 34px;  font-size: 11.2px;
                    
                     }
                     ")),
      
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'radius_mean','Radius', 5)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'texture_mean','Texture', 1)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'perimeter_mean','Perimeter', 1)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'area_mean','Area', 1)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'smoothness_mean','Smoothness', 2)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'compactness_mean','Compactness', 1)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'concavity_mean','Concavity', 3)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'concave.points_mean','Concave Points', 1)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'symmetry_mean','Symmetry', 3)),
    column(2,offset = 0, style='padding:10px;', 
    numericInput(inputId = 'fractal_dimension_mean','Fractal Dimension', 3))
    )),
    box(title = "Standard Error", status = "primary", solidHeader = T, width = 12,
        frow1 <- fluidRow(
          tags$head(
            tags$style("
                     .input-sm,.selectize-input {
                     min-height: 34px;  font-size: 11.2px;
                    
                     }
                     ")),
          
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'radius_se','Radius', 5)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'texture_se','Texture', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'perimeter_se','Perimeter', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'area_se','Area', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'smoothness_se','Smoothness', 2)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'compactness_se','Compactness', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'concavity_se','Concavity', 3)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'concave.points_se','Concave Points', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'symmetry_se','Symmetry', 3)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'fractal_dimension_se','Fractal Dimension', 3))
        )),
    box(title = "Worst", status = "primary", solidHeader = T, width = 12,
        frow1 <- fluidRow(
          tags$head(
            tags$style("
                     .input-sm,.selectize-input {
                     min-height: 34px;  font-size: 11.2px;
                    
                     }
                     ")),
          
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'radius_worst','Radius', 5)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'texture_worst','Texture', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'perimeter_worst','Perimeter', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'area_worst','Area', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'smoothness_worst','Smoothness', 2)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'compactness_worst','Compactness', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'concavity_worst','Concavity', 3)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'concave.points_worst','Concave Points', 1)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'symmetry_worst','Symmetry', 3)),
          column(2,offset = 0, style='padding:10px;', 
                 numericInput(inputId = 'fractal_dimension_worst','Fractal Dimension', 3))
        )),
    actionButton("Run_model", "Run model"),
    valueBoxOutput("summary")
  )))
)
)
