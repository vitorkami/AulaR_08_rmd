### Criando um aplicativo com Shiny:
# Carregar as bibliotecas
library(shiny)
library(ggplot2)

?shinyApp

# Interface do usuário (UI)
ui <- fluidPage(
  titlePanel("Gerador de Gráficos com Shiny e ggplot2"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "Variável do eixo X:", choices = names(mtcars)),
      selectInput("yvar", "Variável do eixo Y:", choices = names(mtcars)),
      selectInput("plotType", "Tipo de Gráfico:", 
                  choices = c("Pontos" = "point", 
                              "Linha" = "line", 
                              "Histograma" = "histogram")),
      checkboxInput("addRegression", "Adicionar Linha de Regressão", value = FALSE)
    ),
    
    mainPanel(
      plotOutput("plot")  # Área de saída para o gráfico
    )
  )
)

# Lógica do servidor
server <- function(input, output) {
  output$plot <- renderPlot({
    # Seleciona os dados para os eixos com base na entrada do usuário
    p <- ggplot(mtcars, aes_string(x = input$xvar, y = input$yvar))
    
    # Adiciona o tipo de gráfico escolhido
    if (input$plotType == "point") {
      p <- p + geom_point()
      # Adiciona a linha de regressão, se solicitado
      if (input$addRegression) {
        p <- p + geom_smooth(method = "lm", se = TRUE, color = "blue")
      }
    } else if (input$plotType == "line") {
      p <- p + geom_line()
    } else if (input$plotType == "histogram") {
      p <- ggplot(mtcars, aes_string(x = input$xvar)) + geom_histogram(binwidth = 1)
    }
    
    # Exibe o gráfico
    p + theme_minimal()
  })
}

# Rodar o aplicativo Shiny
shinyApp(ui = ui, server = server)

