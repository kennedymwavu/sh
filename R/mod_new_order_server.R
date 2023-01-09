mod_new_order_server <- function(id) {
  shiny::moduleServer(
    id = id, 
    module = function(input, output, session) {
      shinyjs::onclick(
        id = "add_order",
        print("Adding order...")
      )
    }
  )
}
