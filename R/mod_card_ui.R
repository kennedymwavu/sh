#' Module card UI
#'
#' @param id Module id
#' @param amount Numeric value to be shown in the card
#' @param title Title of the card
#' @param subtitle_front Subtitle to be shown in the front of the card
#' @param subtitle_back Subtitle to be shown in the back of the card
#' @param icon Icon to be shown in the card. Can also include other classes.
#' @return [shiny::tagList()]
mod_card_ui <- function(
    id,
    amount,
    title,
    subtitle_front = "Total Price",
    subtitle_back = "Net Price",
    icon) {
  shiny::tagList(
    shiny::tags$div(
      class = "col-xl-6 col-md-12 mb-4",
      shiny::tags$div(
        class = "card card-flip h-100",
        shiny::tags$div(
          class = "card-front text-white bg-dark",
          card_body(
            amount = amount,
            title = title,
            subtitle = subtitle_front,
            icon = icon
          )
        ),
        shiny::tags$div(
          class = "card-back text-white bg-dark",
          card_body(
            amount = amount * 0.65,
            title = title,
            subtitle = subtitle_back,
            icon = icon
          )
        )
      )
    )
  )
}
