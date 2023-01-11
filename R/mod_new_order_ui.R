mod_new_order_ui <- function(id) {
  ns <- shiny::NS(id)
  
  shiny::tagList(
    tags$div(
      class = "d-flex flex-column justify-content-center align-items-center", 
      
      tags$form(
        class = paste(
          "d-flex flex-column justify-content-center p-5",
          "border border-1 border-light"
        ), 
        
        tags$h1(
          "New Order", 
          class = "mb-0 mt-0 p-0 text-muted"
        ),
        
        tags$hr(class = "mb-4 mt-0"),
        
        tags$div(
          class = "mb-3",
          
          tags$label(
            "for" = ns("order_id"), 
            class = "form-label",
            
            tags$div(
              "Order ID", 
              tags$span(
                id = ns("order_id_req"),
                class = "text-danger",
                "*"
              )
            )
          ),
          
          tags$input(
            id = ns("order_id"),
            type = "text", 
            class = "form-control form-control-lg",
            placeholder = "Order ID", 
            `aria-label` = "Order ID"
          )
        ),
        
        tags$div(
          class = "mb-3",
          
          tags$label(
            "for" = ns("price"), 
            class = "form-label",
            
            tags$div(
              "Price", 
              tags$span(
                id = ns("price_req"),
                class = "text-danger",
                "*"
              )
            )
          ),
          
          tags$input(
            id = ns("price"),
            type = "number",
            class = "form-control form-control-lg",
            placeholder = 125,
            `aria-label` = "Price",
            step = "1"
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
  )
}
