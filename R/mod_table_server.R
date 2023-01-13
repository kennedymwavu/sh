#' Outstanding orders module server
#'
#' @param id Module id
#' @param orders A data.table containing the orders
#' @param status Status to be shown in the rendered table. Either "Paid" or 
#' "Outstanding". A value of `NULL` shows all orders.
#'
#' @return NULL
#' @noRd
mod_table_server <- function(id, orders, status) {
  stopifnot("`orders` must be reactive" = is.reactive(orders))
  
  envir <- environment()
  status_null <- is.null(status)
  
  tbl <- reactive({
    if (status_null) {
      return(orders())
    }
    
    # otherwise, filter those rows and drop the status column since 
    # it won't be necessary to show:
    orders()[
      data.table::`%chin%`(status, get("status", envir = envir))
    ][, .SD, .SDcols = -c("status")]
  })
  
  shiny::moduleServer(
    id = id,
    module = function(input, output, session) {
      output$table <- reactable::renderReactable({
        reactable::reactable(
          tbl(),
          columns = {
            lst <- list(
              price = reactable::colDef(cell = as_currency("$")),
              net_price = reactable::colDef(cell = as_currency("$")),
              status = reactable::colDef(cell = function(value) {
                # Render X or tick:
                if (value == "Outstanding") "\u274c OS" else "\u2714\ufe0f Paid"
              })
            )
            
            if (!status_null) {
              lst$status <- NULL
            }
            
            lst
          },
          selection = if (status_null) NULL else "multiple",
          onClick = if (status_null) NULL else "select",
          highlight = TRUE,
          outlined = TRUE,
          wrap = FALSE
        )
      })
    }
  )
}