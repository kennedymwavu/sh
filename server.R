server <- function(input, output, session) {
  all <- shiny::reactiveFileReader(
    intervalMillis = 1000,
    session = session,
    filePath = "orders.rds",
    readFunc = function(filepath) {
      all <- readRDS(file = filepath)
      
      data.table::setorderv(all, cols = "order_id", order = -1)
      all[, net_price := price * 0.65]
      
      data.table::setcolorder(
        x = all,
        neworder = c("order_id", "price", "net_price", "deadline", "status")
      )
    }
  )
  
  mod_table_server(id = "all", orders = all, status = NULL)
  mod_table_server(id = "os", orders = all, status = "Outstanding")
  mod_request_payments_server(id = "payments", orders = all)
  mod_table_server(id = "paid", orders = all, status = "Paid")
  mod_new_order_server(id = "new_order")
}
