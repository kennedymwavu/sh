#' Create a card body
#'
#' @param amount Numeric. Amount to display.
#' @param title Character. Title of the card.
#' @param subtitle Character. Subtitle of the card.
#' @param icon Character. Icon to display.
#' @return [shiny::tagList()]
card_body <- function(amount, title, subtitle, icon) {
  shiny::tagList(
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
              as_currency("$")(amount)
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
}
