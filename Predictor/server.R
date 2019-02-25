

library(shiny)
load("Neuralnetwork.rda")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  test <- reactive({
    # this is how you fetch the input variables from ui component
    
    radius_mean <- input$radius_mean
    texture_mean <- as.numeric(input$texture_mean)
    perimeter_mean <- as.numeric(input$perimeter_mean)
    area_mean <- as.numeric(input$area_mean)
    smoothness_mean <- as.numeric(input$smoothness_mean)
    compactness_mean <- as.numeric(input$compactness_mean)
    concavity_mean <- as.numeric(input$concavity_mean)
    concave.points_mean <- as.numeric(input$concave.points_mean)
    symmetry_mean <- as.numeric(input$symmetry_mean)
    fractal_dimension_mean <- as.numeric(input$fractal_dimension_mean)
    
    radius_se <- as.numeric(input$radius_se)
    texture_se <- as.numeric(input$texture_se)
    perimeter_se <- as.numeric(input$perimeter_se)
    area_se <- as.numeric(input$area_se)
    smoothness_se <- as.numeric(input$smoothness_se)
    compactness_se <- as.numeric(input$compactness_se)
    concavity_se <- as.numeric(input$concavity_se)
    concave.points_se <- as.numeric(input$concave.points_se)
    symmetry_se <- as.numeric(input$symmetry_se)
    fractal_dimension_se <- as.numeric(input$fractal_dimension_se)
    
    radius_worst <- as.numeric(input$radius_worst)
    texture_worst <- as.numeric(input$texture_worst)
    perimeter_worst <- as.numeric(input$perimeter_worst)
    area_worst <- as.numeric(input$area_worst)
    smoothness_worst <- as.numeric(input$smoothness_worst)
    compactness_worst <- as.numeric(input$compactness_worst)
    concavity_worst <- as.numeric(input$concavity_worst)
    concave.points_worst <- as.numeric(input$concave.points_worst)
    symmetry_worst <- as.numeric(input$symmetry_worst)
    fractal_dimension_worst <- as.numeric(input$fractal_dimension_worst)
    
    test <- cbind(radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean, concavity_mean, concave.points_mean, symmetry_mean, fractal_dimension_mean,radius_se, texture_se, perimeter_se, area_se, smoothness_se, compactness_se, concavity_se, concave.points_se, symmetry_se, fractal_dimension_se,radius_worst, texture_worst, perimeter_worst, area_worst, smoothness_worst, compactness_worst, concavity_worst, concave.points_worst, symmetry_worst, fractal_dimension_worst)
    test <- as.data.frame(test)
    
  })
  pred <- eventReactive(input$Run_model, {
    predict(model_nnet, newdata = test())
  })
  output$summary <- renderText(pred())
})
