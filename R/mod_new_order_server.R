mod_new_order_server <- function(id) {
  shiny::moduleServer(
    id = id, 
    module = function(input, output, session) {
      shinyjs::onclick(
        id = "add_order",
        print("Adding order...")
      )
      
      observeEvent(
        eventExpr = c(input$order_id, input$price), 
        handlerExpr = {
          shinyjs::toggleState(
            id = "add_order", 
            condition = isTruthy(input$order_id) && isTruthy(input$price)
          )
        }
      )
    }
  )
}
