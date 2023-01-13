#' Status badge
#' 
#' @param color 
#' @param width 
#' @param height 
#'
#' @return [htmltools::span]
#' @export
status_badge <- function(color = "#aaa", width = "0.55rem", height = width) {
  htmltools::span(
    style = list(
      display = "inline-block",
      marginRight = "0.5rem",
      width = width,
      height = height,
      backgroundColor = color,
      borderRadius = "50%"
    )
  )
}
