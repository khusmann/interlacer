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
#' @inheritParams readr::col_factor
#' @inheritParams readr::col_date
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

#' @importFrom readr col_character
#' @export
readr::col_character

#' @importFrom readr col_date
#' @export
readr::col_date

#' @importFrom readr col_datetime
#' @export
readr::col_datetime

#' @importFrom readr col_double
#' @export
readr::col_double

#' @importFrom readr col_factor
#' @export
readr::col_factor

#' @importFrom readr col_guess
#' @export
readr::col_guess

#' @importFrom readr col_integer
#' @export
readr::col_integer

#' @importFrom readr col_logical
#' @export
readr::col_logical

#' @importFrom readr col_number
#' @export
readr::col_number

#' @importFrom readr col_skip
#' @export
readr::col_skip

#' @importFrom readr col_time
#' @export
readr::col_time

#' @importFrom readr cols_condense
#' @export
readr::cols_condense

#' @importFrom readr cols_only
#' @export
readr::cols_only

#' @importFrom readr cols
#' @export
readr::cols

#' @importFrom readr as.col_spec
#' @export
readr::as.col_spec

#' @importFrom readr spec
#' @export
readr::spec
