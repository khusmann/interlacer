#' @export
as.x_collector <- function(x) {
  UseMethod("as.x_collector")
}

#' @export
as.x_collector.default <- function(x) {
  cli_abort("Cannot convert {class(x)[[1]]} to x collector")
}

#' @export
as.x_collector.interlacer_x_collector <- function(x) {
  x
}

#' @export
as.x_collector.collector <- function(x) {
  x_col(x)
}

#' @export
as.x_collector.interlacer_value_collector <- function(x) {
  x_col(x)
}

#' @export
x_col <- function(value_collector, na_collector = na_col_default()) {
  x_collector(
    as.value_collector(value_collector),
    as.na_collector(na_collector)
  )
}

x_collector <- function(value_collector, na_collector) {
  structure(
    list(
      value_collector = value_collector,
      na_collector = na_collector
    ),
    class = "interlacer_x_collector"
  )
}

is.x_collector <- function(x) {
  inherits(x, "interlacer_x_collector")
}

#' @export
format.interlacer_x_collector <- function(x, indent = 0, ...) {
  if (x$na_collector$type == "default") {
    format(x$value_collector)
  } else {
    paste0(
      "x_col(\n",
      "  ", format(x$value_collector), ",\n",
      "  ", format(x$na_collector), "\n",
      ")"
    )
  }
}

#' @export
print.interlacer_x_collector <- function(x, ...) {
  cat(paste0("<interlacer_x_collector>\n", format(x)))
}
