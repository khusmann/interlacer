interlaced_collector <- function(col_type, na) {
  col_type_name <- class(col_type)[[1]]
  class(col_type) <- c(col_type_name, "interlaced_collector", "collector")
  col_type$na <- na
  col_type
}

is_interlaced_collector <- function(x) inherits(x, "interlaced_collector")

#' Interlaced collectors for read_interlaced_*
#'
#' @description
#'
#' Interlaced collector extend `readr` collector types (e.g. `col_double()`) to
#' allow column-level missing value specifications.
#'
#' @param na Character vector of strings to interpret as column-level missing
#' values
#'
#' @export
icol_logical = function(na) {
  interlaced_collector(col_logical(), na)
}


#' @rdname icol_logical
#' @export
icol_integer <- function(na) {
  interlaced_collector(col_integer(), na)
}

#' @rdname icol_logical
#' @export
icol_big_integer <- function(na) {
  interlaced_collector(col_big_integer(), na)
}

#' @rdname icol_logical
#' @export
icol_double <- function(na) {
  interlaced_collector(col_double(), na)
}

#' @rdname icol_logical
#' @export
icol_character <- function(na) {
  interlaced_collector(col_character(), na)
}

#' @rdname icol_logical
#' @export
icol_factor <- function(na, levels = NULL, ordered = FALSE) {
  interlaced_collector(col_factor(levels, ordered), na)
}

#' @rdname icol_logical
#' @export
icol_date <- function(na, format = "") {
  interlaced_collector(col_date(format), na)
}

#' @rdname icol_logical
#' @export
icol_time <- function(na, format = "") {
  interlaced_collector(col_time(format), na)
}

#' @rdname icol_logical
#' @export
icol_datetime <- function(na, format = "") {
  interlaced_collector(col_datetime(format), na)
}

#' @rdname icol_logical
#' @export
icol_number <- function(na) {
  interlaced_collector(col_number(), na)
}
