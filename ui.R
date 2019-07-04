library(ggplot2)
library(shiny)
library(plotly)
library(DT)
library(rsconnect)
sth<-read.csv("./Data/dataset.csv",header=TRUE)
marker_list<-list("BIOMARKER.A","BIOMARKER.B")
shinyUI(fluidPage(
    navbarPage("A shiny app",
               tabPanel("Patient demographic",
                        sidebarLayout(
                          sidebarPanel("Filterable table:Please select your filters on top of each column names"),
                          mainPanel("Result",
                                    DT::dataTableOutput("gapminder_table"),
                                    plotlyOutput('plot1')
                          )
                        )
               )
               ,
               tabPanel("Explore variable relationship",
                        sidebarLayout(
                          sidebarPanel(
                            p("select phenotypic variable 1"),
                            selectInput('xcol', 'X Variable', names(sth), selected =
                                          names(sth)[[3]]),
                            p("select phenotypic variable 2"),
                            selectInput('ycol', 'Y Variable', names(sth), selected =
                                          names(sth)[[4]]),
                            p("select phenotypic variable 3 (categary datatype) for faceting capabilities"),
                            selectInput('zcol', 'Z Variable', names(sth), selected =
                                          names(sth)[[5]])
                          ),
                          mainPanel(
                            plotlyOutput('plot2')
                          )
                        )
               ),
               tabPanel("Time Trajectory",
                        sidebarPanel(
                          selectInput('treatment', 'Treatment', unique(sth[,6]), selected =
                                        unique(sth[,6])[[1]]),
                          selectInput('biomarker', 'Biomarker', marker_list, selected =
                                        marker_list[[1]])
                        ),
                        mainPanel(
                          plotlyOutput('plot3')
                        )
               )
    )
  )
)
  