mod_new_order_server <- function(id) {
  shiny::moduleServer(
    id = id, 
    module = function(input, output, session) {
      ns <- session$ns
      
      shinyjs::onclick(
        id = "add_order",
        {
          # show loading spinner on btn:
          shinyjs::html(
            id = "add_order",
            html = htmltools::doRenderTags(
              x = shiny::tagList(
                tags$span(
                  class = "spinner-border spinner-border-sm",
                  role = "status",
                  `aria-hidden` = "true"
                ),
                
                "Adding..."
              )
            )
          )
          
          # disable btn:
          shinyjs::disable(id = "add_order")
          
          # read previous orders, bind new order:
          orders <- rbind(
            readRDS(file = "orders.rds"), # this is a data.table
            list(
              order_id = input$order_id,
              price = as.integer(input$price),
              deadline = lubridate::ymd_hms(
                input$deadline, 
                tz = "Africa/Nairobi"
              ),
              status = input$status
            )
          )
          
          # save orders:
          saveRDS(object = orders, file = "orders.rds")
          
          # restore initial html on btn:
          shinyjs::html(
            id = "add_order",
            html = "Add Order"
          )
          
          # reset form:
          lapply(c("order_id", "price", "status"), shinyjs::reset)
          shinyWidgets::updateAirDateInput(
            session = session,
            inputId = "deadline",
            clear = TRUE
          )
          
          # show success:
          shinytoastr::toastr_success(
            message = paste0("Order ID ", input$order_id, " added")
          )
        }
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
