interlaced_collector <- function(col_type, na) {
  col_type_name <- class(col_type)[[1]]
  class(col_type) <- c(col_type_name, "interlaced_collector", "collector")
  col_type$na <- na
  col_type
}

is_interlaced_collector <- function(x) inherits(x, "interlaced_collector")

#' @export
icol_logical = function(na) {
  interlaced_collector(col_logical(), na)
}

#' @export
icol_integer <- function(na) {
  interlaced_collector(col_integer(), na)
}

#' @export
icol_big_integer <- function(na) {
  interlaced_collector(col_big_integer(), na)
}

#' @export
icol_double <- function(na) {
  interlaced_collector(col_double(), na)
}

#' @export
icol_character <- function(na) {
  interlaced_collector(col_character(), na)
}

#' @export
icol_factor <- function(na, levels = NULL, ordered = FALSE) {
  interlaced_collector(col_factor(levels, ordered), na)
}

#' @export
icol_date <- function(na, format = "") {
  interlaced_collector(col_date(format), na)
}

#' @export
icol_time <- function(na, format = "") {
  interlaced_collector(col_time(format), na)
}

#' @export
icol_datetime <- function(na, format = "") {
  interlaced_collector(col_datetime(format), na)
}

#' @export
icol_number <- function(na) {
  interlaced_collector(col_number(), na)
}
