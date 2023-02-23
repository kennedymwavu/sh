mod_new_order_ui <- function(id) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$form(
        id = ns("form"),
        class = "d-flex flex-column p-5",
        
        tags$div(
          class = "mb-3",
          
          shiny::textInput(
            inputId = ns("order_id"),
            label = shiny::tagList(
              "Order ID",
              tags$span(
                id = ns("order_id_req"),
                class = "text-danger",
                "*"
              )
            ),
            placeholder = "Order ID",
            width = "100%"
          )
        ),
        
        
        tags$div(
          class = "mb-3",
          
          shiny::numericInput(
            inputId = ns("price"),
            label = shiny::tagList(
              "Price", 
              tags$span(
                id = ns("price_req"),
                class = "text-danger",
                "*"
              )
            ),
            value = NULL,
            width = "100%"
          )
        ),
        
        tags$div(
          class = "mb-3", 
          
          shinyWidgets::airDatepickerInput(
            inputId = ns("deadline"),
            label = tags$div(
              "Deadline",
              tags$span(
                id = ns("deadline_req"),
                class = "text-danger",
                "*"
              )
            ),
            value = NULL,
            timepicker = TRUE,
            addon = "none",
            width = "100%"
          )
        ),
        
        tags$div(
          class = "mb-3", 
          
          shiny::radioButtons(
            inputId = ns("status"), 
            label = "Status", 
            choices = c("Outstanding", "Paid"), 
            selected = "Outstanding", 
            inline = TRUE,
            width = "100%"
          )
        ),
        
        tags$div(
          id = ns("add_order"),
          type = "submit",
          class = "btn btn-primary",
          
          "Add Order"
        )
      )
  )
}
