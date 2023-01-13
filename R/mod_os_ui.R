mod_os_ui <- function(id) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$div(
      class = "mb-3 container",
      
      tags$h1(
        "Outstanding Orders", 
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
