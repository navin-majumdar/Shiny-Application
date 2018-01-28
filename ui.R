library(shiny)


shinyUI(fluidPage(
    titlePanel("Prediction of Teenage gambling in Britain"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("sex", label = h3("Choose gender"),
                        choices = list("Male" = 0, "Female" = 1),
                        selected = 0),
            helpText(" '0' represents male and '1' represents female"),
            numericInput("status", label = h3("Socioeconomic status score based on parents' occupation"), 45, min = 15, max = 70),
            numericInput("income", label = h3("Income in pounds per week"), 4.5, min = 0, max = 20),
            sliderInput("verbal", label = h3("Verbal score in words out of 12 correctly defined"),
                        min = 1, max = 12, value = 6),
            submitButton('Submit'),
            helpText("Source: Ide-Smith & Lea, 1988, Journal of Gambling Behavior, 4, 110-118")
            
        ),
        mainPanel(
            h2('Results of the prediction'),
            h3('Based on your inputs below:'),
            verbatimTextOutput("select"),
            textOutput("text1"),
            verbatimTextOutput("status"),
            verbatimTextOutput("income"),
            verbatimTextOutput("verbal"),
            h4('Which resulted in a prediction of'),
            verbatimTextOutput("prediction"),
            h4('expenditure on gambling in pounds per year'),
            img(src="Poker.jpg", height = 300, width = 850)
            ) 
        
    )
))