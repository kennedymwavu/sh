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
        
        tags$h3(
          "New Order", 
          class = "mt-0 p-0 mb-3"
        ),
        
        tags$div(
          class = "mb-3 form-floating",
          
          tags$input(
            id = ns("order_id"),
            type = "text", 
            class = "form-control form-control-lg",
            placeholder = "Order ID", 
            `aria-label` = "Order ID"
          ),
          
          tags$label(
            "for" = ns("order_id"), 
            class = "form-label", 
            "Order ID"
          )
        ),
        
        tags$div(
          class = "mb-3 form-floating",
          
          tags$input(
            id = ns("price"),
            type = "number",
            class = "form-control form-control-lg",
            placeholder = "Price",
            `aria-label` = "Price"
          ),
          
          tags$label(
            "for" = ns("price"), 
            class = "form-label",
            "Price"
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
