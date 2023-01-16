mod_request_payments_ui <- function(id) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$div(
      class = "container",
      
      shiny::downloadButton(
        outputId = ns("dnld"),
        label = "Get xlsx file of OS orders",
        class = "btn btn-outline-dark"
      )
    )
  )
}
