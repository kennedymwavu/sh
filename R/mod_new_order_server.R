mod_new_order_server <- function(id) {
  shiny::moduleServer(
    id = id, 
    module = function(input, output, session) {
      shinyjs::onclick(
        id = "add_order",
        print("Adding order...")
      )
      
      # add class to "deadline" so it looks same as other inputs:
      shinyjs::addClass(
        id = "deadline",
        class = "form-control-lg"
      )
      
      observeEvent(
        eventExpr = c(input$order_id, input$price, input$deadline), 
        handlerExpr = {
          # show/hide * in req fields:
          shinyjs::toggle(
            id = "order_id_req", 
            condition = !isTruthy(input$order_id)
          )
          
          shinyjs::toggle(
            id = "price_req",
            condition = !isTruthy(input$price)
          )
          
          shinyjs::toggle(
            id = "deadline_req",
            condition = !isTruthy(input$deadline)
          )
          
          # enable/disable `add_order` btn:
          shinyjs::toggleState(
            id = "add_order", 
            condition = isTruthy(input$order_id) && 
              isTruthy(input$price) && 
              isTruthy(input$deadline)
          )
        }
      )
    }
  )
}
