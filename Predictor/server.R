
library(shinyjs)
library(shiny)
library(knitr)
library(corrplot)
library(NeuralNetTools)
library(caret)
library(nnet)
load("Neuralnetwork.rda")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  observeEvent(input$close, {
    js$closeWindow()
    stopApp()
  })
  output$attribute <- renderUI(HTML("
<h2>Metadata:</h2>
<div style='font-size:18px'>
Ten real-valued features are computed for each cell nucleus:<br>
	<ul>
  <li>Radius (mean of distances from center to points on the perimeter)</li>
	<li>Texture (standard deviation of gray-scale values)</li>
	<li>Perimeter</li>
	<li>Area</li>
	<li>Smoothness (local variation in radius lengths)</li>
	<li>Compactness (perimeter^2 / area - 1.0)</li>
	<li>Concavity (severity of concave portions of the contour)</li>
	<li>Concave points (number of concave portions of the contour)</li>
	<li>Symmetry</li>
	<li>Fractal dimension (coastline approximation - 1)</li></div>"))
  test <- reactive({
    # this is how you fetch the input variables from ui component
    
    radius_mean <- as.numeric(input$radius_mean)
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
    predict(model_nnet, newdata = test(), type = "class")
  })
  output$summary <- renderValueBox({
    res <- pred()
    if(is.null(res))
      res <- "Results"
    
    valueBox(
      
      renderText(res), "Result", icon = icon("flash", lib = "glyphicon"),
      color = "yellow"
    )
  })
  corr <- renderPlot({
    corrplot(corrplot, order = "hclust", tl.cex = 0.65, addrect = 8)
  })
  test1 <- reactive({
    clump_thickness <- as.numeric(input$clump_thickness)
    uniformity_of_cell_size <- as.numeric(input$uniformity_of_cell_size)
    uniformity_of_cell_shape <- as.numeric(input$uniformity_of_cell_shape)
    marginal_adhesion <- as.numeric(input$marginal_adhesion)
    single_epithelial_cell_size <- as.numeric(input$single_epithelial_cell_size)
    bare_nuclei <- as.numeric(input$bare_nuclei)
    bland_chromatin <- as.numeric(input$bland_chromatin)
    normal_nucleoli <- as.numeric(input$normal_nucleoli)
    mitosis <- as.numeric(input$mitosis)
  })
  pred1 <- eventReactive(input$Run_model, {
    predict(model_nnet, newdata = test(), type = "class")
  })
  output$summary1 <- renderValueBox({
    valueBox(
      renderText(pred()), "Result", icon = icon("heartbeat"),
      color = "yellow"
    )
  })
})
