#' Module card UI
#'
#' @param id Module id
#' @param amount Amount to be shown in the card, including currency
#' @param title Title of the card
#' @param subtitle Subtitle of the card
#' @param icon Icon to be shown in the card. Can also include other classes.
#' @return [shiny::tagList()]
mod_card_ui <- function(id, amount, title, subtitle = "Total Price", icon) {
  shiny::tagList(
    shiny::tags$div(
        class = "col-xl-6 col-md-12 mb-4",
        shiny::tags$div(
          class = "card",
          shiny::tags$div(
            class = "card-body",
            shiny::tags$div(
              class = "d-flex justify-content-between p-md-1",
              shiny::tags$div(
                class = "d-flex flex-row",
                shiny::tags$div(
                  class = "align-self-center",
                  shiny::tags$h2(
                    class = "h1 mb-0 me-4",
                    amount
                  )
                ),
                shiny::tags$div(
                  shiny::tags$h4(
                    title
                  ),
                  shiny::tags$p(
                    class = "mb-0",
                    subtitle
                  )
                )
              ),
              shiny::tags$div(
                class = "align-self-center",
                shiny::tags$i(
                  class = paste("bi", icon, "h1")
                )
              )
            )
          )
        )
      )
  )
}
