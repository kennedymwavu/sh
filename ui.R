ui <- bslib::page(
  title = "Side Hustle", 
  theme = bslib::bs_theme(version = 5),
  
  shiny::includeCSS(path = file.path("www", "styles.css")),
  
  shinyjs::useShinyjs(),
  shinytoastr::useToastr(),
  
  mod_new_order_ui(id = "new_order")
)
