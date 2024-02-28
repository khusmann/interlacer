collector_interlaced <- function(col_type, na) {
  col_type_name <- class(col_type)[[1]]
  class(col_type) <- c(col_type_name, "collector_interlaced", "collector")
  col_type$na <- na
  col_type
}

is_collector_interlaced <- function(x) inherits(x, "collector_interlaced")

#' @export
col_interlaced_logical = function(na) {
  collector_interlaced(col_logical(), na)
}

#' @export
col_interlaced_integer <- function(na) {
  collector_interlaced(col_integer(), na)
}

#' @export
col_interlaced_big_integer <- function(na) {
  collector_interlaced(col_big_integer(), na)
}

#' @export
col_interlaced_double <- function(na) {
  collector_interlaced(col_double(), na)
}

#' @export
col_interlaced_character <- function(na) {
  collector_interlaced(col_character(), na)
}

#' @export
col_interlaced_factor <- function(na, levels = NULL, ordered = FALSE) {
  collector_interlaced(col_factor(levels, ordered), na)
}

#' @export
col_interlaced_date <- function(na, format = "") {
  collector_interlaced(col_date(format), na)
}

#' @export
col_interlaced_time <- function(na, format = "") {
  collector_interlaced(col_time(format), na)
}

#' @export
col_interlaced_datetime <- function(na, format = "") {
  collector_interlaced(col_datetime(format), na)
}

#' @export
col_interlaced_number <- function(na) {
  collector_interlaced(col_number(), na)
}
