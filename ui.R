library(shiny)
library(rbokeh)

shinyUI(fluidPage(
  titlePanel("UADY Forest Diversity Plots"),
  
                mainPanel(
                  rbokeh::rbokehOutput("divplot",width=1300,height=800)
                )
  ))