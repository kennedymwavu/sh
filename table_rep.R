all <- readRDS(file = "orders.rds")

data.table::setorderv(all, cols = "order_id", order = -1)
all[, net_price := price * 0.65]

data.table::setcolorder(
  x = all,
  neworder = c("order_id", "price", "net_price", "deadline", "status")
)

as_currency <- function(currency) {
  function(value) {
    paste0(currency, format(value, big.mark = ","))
  }
}

# examples:
# as_currency("$")(3500)
# as_currency("KES")(2000)

# use custom rendering for "all"
reactable::reactable(
  all,
  columns = list(
    price = reactable::colDef(cell = as_currency("$")),
    net_price = reactable::colDef(cell = as_currency("$")),
    status = reactable::colDef(cell = function(value) {
      # Render X or tick:
      if (value == "Outstanding") "\u274c OS" else "\u2714\ufe0f Paid"
    })
  )
)

# use click selection for "outstanding" and "paid":
outstanding <- all[status %chin% "Outstanding"]

reactable::reactable(
  outstanding[, .SD, .SDcols = -c("status")],
  columns = list(
    price = reactable::colDef(cell = as_currency("$")),
    net_price = reactable::colDef(cell = as_currency("$"))
  ),
  selection = "multiple",
  onClick = "select"
)

paid <- all[status %chin% "Paid"]

reactable::reactable(
  paid[, .SD, .SDcols = -c("status")],
  columns = list(
    price = reactable::colDef(cell = as_currency("$")),
    net_price = reactable::colDef(cell = as_currency("$"))
  ),
  selection = "multiple",
  onClick = "select"
)

