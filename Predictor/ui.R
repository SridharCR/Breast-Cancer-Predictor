#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shinyjs)
library(shiny)
library(shinydashboard)
library(DT)
jscode <- "shinyjs.closeWindow = function() { window.close(); }"
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
      menuItem("Tumour Nuclei Data", tabName = "nuclei_data" ,icon = icon("cog", lib = "glyphicon"),
               menuSubItem("Input", tabName = "get_input", icon = icon("table")),
               menuSubItem("Results", tabName = "get_output", icon = icon("bar-chart-o"))),
      menuItem("Tumour Cell Data", tabName = "cellular_data", icon = icon("diagnoses")),
      menuItem("About", tabName = "about", icon = icon("info-circle")),
      menuItem("Github", icon = icon("send",lib='glyphicon'), 
               href = "https://github.com/SridharCR/Breast-Cancer-Predictor")
    )
  ),
  body <- dashboardBody(fluidPage(
    
    tabItems(
      tabItem(tabName = "home",
              box(width = 12,
              h1("Prediction of Breast Cancer"),
              p("The breast cancer is becoming a serious issue between the women. One woman will die of breast cancer every 13 minutes. 
                The diagnosis of the breast cancer is a complex task and takes time for the doctor to check and analyze the lab results.
                Here we predict the breast cancer on its initial stages, with the lab results.
                This web application can predict whether the tumour mass is malignant or benign. In case of malignant, the patient should take 
                effective treatments accordingly.
                ", style='font-size: 18px'),
              img(src='Malignant and benign breast masses.png',width='40%')),
              useShinyjs(),
              extendShinyjs(text = jscode, functions = c("closeWindow")),
              actionButton("close", "Close window")
              ),
      
      tabItem(tabName = "get_input",
              frow2 <- fluidRow(
                tags$head(
                  tags$style("
                     font-size: 15px;
                      
                     }
                     ")),
                  box(width = 12,
                  htmlOutput("attribute")
                  )
              ),
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
    
      
  ),
  tabItem(tabName = "cellular_data",
          # "clump_thickness", "uniformity_of_cell_size", "uniformity_of_cell_shape", "marginal_adhesion", "single_epithelial_cell_size", "bare_nuclei", "bland_chromatin", "normal_nucleoli", "mitosis"
          fluidRow(
            box(title = "Cellular Data", status = "primary", solidHeader = T, width = 12,
                frow1 <- fluidRow(
                  tags$head(
                    tags$style("
                     .input-sm,.selectize-input {
                     min-height: 34px;  font-size: 11.2px;
                    
                     }
                     ")),
                  
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = "clump_thickness",'Clump Thickness', 5)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = "uniformity_of_cell_size",'Uniformity of Cell Size', 1)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'uniformity_of_cell_shape','Uniformity of Cell Shape', 1)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'marginal_adhesion','Marginal Adhesion', 1)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'single_epithelial_cell_size','Single Epithelial Cell Size', 2)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'bare_nuclei','Bare Nuclei', 1)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'bland_chromatin','Bland Chromatin', 3)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'normal_nucleoli','Normal Nucleoli', 1)),
                  column(2,offset = 0, style='padding:10px;', 
                         numericInput(inputId = 'mitosis','Mitosis', 3))
                  
                ),
                actionButton("Run_cellular_model", "Run model"),
                valueBoxOutput("summary1")))
  ),
  tabItem(tabName = "about"
          
  )
  ))
)
)
