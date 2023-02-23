ui <- bslib::page(
  title = "Side Hustle",
  theme = bslib::bs_theme(version = 5),
  shiny::includeCSS(path = file.path("www", "styles.css")),
  shinyjs::useShinyjs(),
  shinytoastr::useToastr(),

  shiny::tags$body(
    class = "bg-light d-flex justify-content-center",
    shiny::tags$div(
    class = paste(
      "container m-3 p-5 bg-white shadow rounded",
      "d-flex justify-content-center"
    ),

    shiny::tabsetPanel(
      id = "tabs",
      type = "pills",
      header = shiny::tags$hr(),

      shiny::tabPanel(
        title = "New Order",
        value = "new_order",
        icon = shiny::icon(name = NULL, class = "bi bi-plus-circle"),
        mod_new_order_ui(id = "new_order")
      ),

      shiny::tabPanel(
        title = "Outstanding Orders",
        value = "os",
        icon = shiny::icon(name = NULL, class = "bi bi-exclamation-circle"),
        mod_table_ui(id = "os", status = "Outstanding"),
        mod_request_payments_ui(id = "payments")
      ),

      shiny::tabPanel(
        title = "All Orders",
        value = "all",
        icon = shiny::icon(name = NULL, class = "bi bi-card-list"),
        mod_table_ui(id = "all", status = NULL)
      ),

      shiny::tabPanel(
        title = "Paid Orders",
        value = "paid",
        icon = shiny::icon(name = NULL, class = "bi bi-check2-all"),
        mod_table_ui(id = "paid", status = "Paid")
      )
    )
  )
  )
)


