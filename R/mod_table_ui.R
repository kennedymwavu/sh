#' Table of orders module ui
#'
#' @param id Module id
#' @param status Order status, whether "Outstanding" or "Paid". A value of 
#' `NULL` is same as all orders, both paid and outstanding.
#'
#' @return NULL
#' @noRd
mod_table_ui <- function(id, status = NULL) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$div(
      class = "mb-3 container",
      
      tags$h1(
        trimws(paste(status, "Orders")),
        class = "text-muted text-center"
      ),
      
      reactable::reactableOutput(outputId = ns("table")) |> 
        shinycssloaders::withSpinner(
          type = 2,
          color.background = "white"
        )
    )
  )
}