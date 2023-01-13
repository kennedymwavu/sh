#' Outstanding orders module server
#'
#' @param id Module id
#' @param os A data.table containing the outstanding orders
#'
#' @return NULL
#' @noRd
mod_os_server <- function(id, os) {
  stopifnot("`os` must be reactive" = is.reactive(os))
  
  shiny::moduleServer(
    id = id,
    module = function(input, output, session) {
      output$table <- reactable::renderReactable({
        reactable::reactable(
          os()[, .SD, .SDcols = -c("status")],
          columns = list(
            price = reactable::colDef(cell = as_currency("$")),
            net_price = reactable::colDef(cell = as_currency("$"))
          ),
          selection = "multiple",
          onClick = "select",
          highlight = TRUE,
          outlined = TRUE,
          wrap = FALSE
        )
      })
    }
  )
}
