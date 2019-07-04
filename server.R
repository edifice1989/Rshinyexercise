library(ggplot2)
library(shiny)
library(plotly)
library(DT)
library(rsconnect)
sth<-read.csv("./Data/dataset.csv",header=TRUE)
marker_list<-list("BIOMARKER.A","BIOMARKER.B")
  shinyServer(function(input, output) {
  output$gapminder_table <- renderDataTable({sth},
                                            filter = 'top',
                                            rownames = FALSE)
  #==== TASK 1 (DONE) =======
  output$plot1 = renderPlotly({
    filtered_data <- input$gapminder_table_rows_all
    p<-ggplot(sth[filtered_data,], aes(x=GENDER)) + 
      geom_bar(stat="count", width=0.7, fill="steelblue")+theme_minimal()
    ggplotly(p)
  })
  
  selectedData <- reactive({
    sth[, c(input$xcol, input$ycol, input$zcol)]
  })
  
  #===== TASK 2 ===== (DONE)
  output$plot2 <- renderPlotly({
    
    if(class(sth[,input$xcol]) == "factor" && class(sth[,input$ycol]) != "factor"){ 
      p<-ggplot(sth, aes(x=sth[,input$xcol], y=sth[,input$ycol])) +
        geom_boxplot() + facet_grid(sth[,input$zcol] ~ .)+
        xlab(input$xcol)+ylab(input$ycol)
      ggplotly(p)
    }
    
    else if(class(sth[,input$xcol]) != "factor" && class(sth[,input$ycol]) == "factor"){ 
      p<-ggplot(sth, aes(x=sth[,input$ycol], y=sth[,input$xcol])) +
        geom_boxplot()+xlab(input$xcol)+ylab(input$ycol)
      ggplotly(p)
    }
    else if(class(sth[,input$xcol]) != "factor" && class(sth[,input$ycol]) != "factor" ){ 
      p<-ggplot(sth,aes(x=sth[,input$xcol], y=sth[,input$ycol]))+geom_point()+
        xlab(input$xcol)+ylab(input$ycol)
      ggplotly(p)
    }
  })
  
  #===== TASK 3 ===== (DONE)
  output$plot3 <- renderPlotly({
    flt<-subset(sth,sth[,6]==input$treatment)
    p<-ggplot(data=flt, aes(x=DAY, y=flt[,input$biomarker], group=PATIENT)) +
      geom_line()+
      geom_point()+ylab(input$biomarker)
    ggplotly(p)
  })
})