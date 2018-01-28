library(faraway)
library(shiny)
data("teengamb")
model <- lm(gamble ~ sex + status + income + verbal, data = teengamb)

gamblePredict <- function(sex, status, income, verbal)
    predict(model, data.frame(sex = sex, status = status,
                              income = income,
                              verbal = verbal), type
            = "response", interval = "prediction")[1]

shinyServer(
    function(input, output){
        output$select <- renderPrint({input$sex})
        output$status <- renderPrint({input$status})
        output$income <- renderPrint({input$income})
        output$verbal <- renderPrint({input$verbal})
        output$prediction <- renderPrint({gamblePredict(as.numeric(input$sex), 
                                                        input$status, input$income,
                                                        input$verbal)})
    }
)