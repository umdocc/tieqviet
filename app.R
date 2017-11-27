## app.R ##
server <- function(input, output) {
  convertTieqViet <- function(cqn,cgt){
    # the order is important
    cgt <- gsub("c|q","k",cqn,ignore.case = T)
    cgt <- gsub("ch|tr","c",cgt,ignore.case = T)
    cgt <- gsub("d|gi|r","z",cgt,ignore.case = T)
    cgt <- gsub("th","w",cgt,ignore.case = T)
    cgt <- gsub("kh","x",cgt,ignore.case = T)
    cgt <- gsub("ngh","q",cgt,ignore.case = T)
    cgt <- gsub("ng","q",cgt,ignore.case = T)
    cgt <- gsub("nh","n'",cgt,ignore.case = T)
    cgt <- gsub("ph","f",cgt,ignore.case = T)
    cgt <- gsub("gh","g",cgt,ignore.case = T)
    cgt <- gsub("đ","d",cgt,ignore.case = T)
    # too lazy to handle capital letters
    return(cgt)
    }
  
  output$value <- renderText({ convertTieqViet(input$tiengviet) })
}

ui <- fluidPage(
  # sidebarLayout(
  #   sidebarPanel(
  #     sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
  #   ),
  #   mainPanel(plotOutput("distPlot"))
  # )
  h2("Bộ chuyển tiếng Việt – Shiny"),
  textInput("tiengviet", "TiengViet", "Đang có trục trặc"),
  h2(""),
  verbatimTextOutput("value")
)

shinyApp(ui = ui, server = server)