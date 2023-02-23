mod_request_payments_ui <- function(id) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$div(
      class = "d-flex justify-content-center",
      
      shiny::downloadButton(
        outputId = ns("dnld"),
        label = "Get xlsx file of outstanding orders",
        class = "btn btn-outline-dark"
      )
    )
  )
}
