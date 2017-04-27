  #
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
ui <- fluidPage(
   
   # Application title
   titlePanel("Rationalität unter VWL-Master-Studierenden"),
   
   sidebarLayout(
      sidebarPanel(
          numericInput("ac",
                       "Bevorzugen A & C:",
                       value = 0),
          numericInput("ad",
                       "Bevorzugen A & D:",
                       value = 0),
          numericInput("bc",
                       "Bevorzugen B & C:",
                       value = 0),
          numericInput("bd",
                       "Bevorzugen B & D:", 
                       value = 0),
          actionButton(label = "Rationalität Berechnen :)", inputId = "go" )),
   
mainPanel(
        splitLayout(
         plotOutput("rational"),
         tableOutput("rational_t")
         ),
        splitLayout(
          plotOutput("allais"),
          tableOutput("allais_t"))
       )
   )
)
server <- function(input, output) {
  
     observeEvent(input$go,{
       total <- input$ac+ input$ad+ input$bc + input$bd
       shares <- data.frame(ac = input$ac/total, ad = input$ad/total, bc =  input$bc/total, bd =  input$bd/total)
       plot_data <- data.frame(groups = c("Rational", "Irrational"), value = c((shares$ac+shares$bd)*100, (shares$ad+shares$bc)*100))
       plot1<- ggplot(data = plot_data, aes(x = "", y = value, fill = groups))+geom_bar(width = 1, stat = "identity")+coord_polar("y", start = 0)+ guides(fill=guide_legend(title=NULL))+ggtitle("Rationalität")+  theme(plot.title = element_text(lineheight=.8, face="bold")) + labs(x = NULL, y = NULL)
       
       shares_a <- data.frame(Gruppe = c("Richtig", "Falsch"), Anteil = c((input$ad/total*100), (1-(input$ad/total))*100))
       plot_a <- ggplot(data = shares_a, aes(x = "", y= Anteil, fill = Gruppe))+geom_bar(width = 1, stat = "identity")+coord_polar("y", start = 0)+ guides(fill=guide_legend(title=NULL))+ggtitle("Allais Vorhersage (A & D)")+  theme(plot.title = element_text(lineheight=.8, face="bold"))+ labs(x = NULL, y = NULL)
       
            output$rational <- renderPlot({plot1})
            
            output$rational_t <- renderTable({
              values_t <-  paste(round(plot_data$value,2), "%")
              data_t <- data.frame(Gruppe = c("Rational", "Irrational"), Anteil = c(values_t[[1]], values_t[[2]]), Anzahl = c(input$ac +input$bd, input$ad +input$bc))
              data_t
            })
            
            output$allais <- renderPlot({plot_a})
            
            output$allais_t <- renderTable({
              values_at <- paste(round(shares_a$Anteil,2), "%")
              data_at<- data.frame(Gruppe = c("Richtig", "Falsch"), Anteil = values_at, Anzahl = c(input$ad, total-input$ad))
              data_at
            })
       })
}

# Run the application 
shinyApp(ui = ui, server = server)

