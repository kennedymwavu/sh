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
              order_id = reactable::colDef(
                name = "Order ID"
              ),
              price = reactable::colDef(
                name = "Price",
                cell = as_currency("$")
              ),
              net_price = reactable::colDef(
                name = "Net Price",
                cell = as_currency("$")
              ),
              status = reactable::colDef(
                name = "Status",
                cell = function(value) {
                  label <- switch(value,
                    Paid = "Paid",
                    Outstanding = "Pending"
                  )

                  badge <- switch(value,
                    Paid = tags$i(
                      class = "bi bi-check-lg text-success pe-1"
                    ),
                    Outstanding = tags$i(
                      class = "bi bi-exclamation-circle-fill text-warning pe-1"
                    )
                  )

                  shiny::tagList(badge, label)
                }
              ),
              deadline = reactable::colDef(
                name = "Deadline"
              )
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

      selected <- reactive({
        reactable::getReactableState(
          outputId = "table",
          name = "selected",
          session = session
        )
      })

      # hide/show `change_status` btn:
      shiny::observeEvent(
        eventExpr = selected(),
        handlerExpr = {
          shinyjs::toggle(
            id = "change_status",
            condition = shiny::isTruthy(selected())
          )
        },
        ignoreNULL = FALSE
      )

      # change order status:
      shiny::observeEvent(
        eventExpr = input$change_status,
        handlerExpr = {
          order_ids <- tbl()$order_id[selected()]
          orders_copy <- data.table::copy(orders())
          new_status <- switch(status,
            Paid = "Outstanding",
            Outstanding = "Paid"
          )
          orders_copy[order_id %in% order_ids, status := new_status]

          # update file:
          saveRDS(object = orders_copy, file = "orders.rds")
        }
      )
    }
  )
}
