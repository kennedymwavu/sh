server <- function(input, output, session) {
  mod_new_order_server(id = "new_order")
  
  observeEvent(input$fav_language, {
    print(input$fav_language)
  })
}
