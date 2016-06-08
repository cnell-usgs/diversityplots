library(shiny)
library(rbokeh)
library(dplyr)
library(reshape2)
library(ggplot2)

plot<-read.csv("mex_design.csv")
plot$row<-as.character(plot$row)
plot$col<-as.character(plot$col)
plot$rowp<-as.character(plot$rowp)
plot$colp<-as.character(plot$colp)

plot$symx<-paste(plot$col,":0.1",sep="")
plot$numbery<-paste(plot$row,"0.1",sep="")
plot$divy<-paste(plot$Tree.Diversity,"0.1",sep="")
plot$geny<-paste(plot$Caoba.Diversity,"0.1",sep="")

shinyServer(function(input, output) {
  output$divplot<-rbokeh::renderRbokeh({
    # create figure
    k<-figure(tools=c("hover","save"),
              ylim= as.character(c(1:7)), xlim=as.character(1:14),
              xgrid=F,ygrid=F,xlab="",ylab="",
              height=445,width=700,logo=NULL,outline_line_color="white")%>%
      # plot rectangles
      ly_crect(col, row, data = plot, 0.9, 0.9,color=plot$Diversity,
               fill_alpha = 0.6,
               hover = c(Diversity,Species),legend="Diversity") %>%
      # add symbol text
      ly_text(col, row, text = Plot, data = plot,
              font_style = "bold", font_size = "10pt",
              align = "center", baseline = "center")
    k
  })
})