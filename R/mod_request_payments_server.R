mod_request_payments_server <- function(id, orders) {
  stopifnot("`orders` must be a reactive" = shiny::is.reactive(orders))
  
  shiny::moduleServer(
    id = id,
    module = function(input, output, session) {
      os <- reactive({
        
        x <- orders()[
          status %chin% "Outstanding", 
          .SD, 
          .SDcols = -c("status", "deadline")
        ]
        
        # total:
        y <- rbind(
          # add an empty row to x:
          rbind(x, list("", "", "")),
          # Total:
          list(
            order_id = "Total",
            price = x[, sum(price)],
            net_price = x[, sum(net_price)]
          )
        )
        
        data.table::setnames(
          x = y,
          old = c("Order-ID", "Price", "How Much I Get")
        )
        
        y
      })
      
      output$dnld <- shiny::downloadHandler(
        filename = function() {
          "kennedymwavu-homeworkhelponline.xlsx"
        },
        content = function(file) {
          writexl::write_xlsx(x = os(), path = file)
        }
      )
    }
  )
}
