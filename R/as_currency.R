#' Format a number and add currency string to it
#'
#' @param currency A string. The currency you wish to append to numbers.
#'
#' @return A function taking an argument "value"
#' @export
#'
#' @examples
#' as_currency("$")(3500)
#' as_currency("KES")(2000)
as_currency <- function(currency) {
  function(value) {
    paste0(currency, format(value, big.mark = ","))
  }
}
