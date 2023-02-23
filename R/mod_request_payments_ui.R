mod_request_payments_ui <- function(id) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$div(
      class = "d-flex justify-content-center mb-3",
      
      shiny::downloadButton(
        outputId = ns("dnld"),
        icon = shiny::icon(name = NULL, class = "bi bi-download"),
        label = "Get xlsx file of outstanding orders",
        class = "btn btn-outline-dark"
      )
    )
  )
}
