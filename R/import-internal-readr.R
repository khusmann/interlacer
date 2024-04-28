## Misc internal functions from readr

# nocov start

type_to_col <- function(x, ...) UseMethod("type_to_col")
#' @export
type_to_col.default <- function(x, ...) col_character()
#' @export
type_to_col.logical <- function(x, ...) col_logical()
#' @export
type_to_col.integer <- function(x, ...) col_integer()
#' @export
type_to_col.double <- function(x, ...) col_double()
#' @export
type_to_col.factor <- function(x, ...) {
  col_factor(
    levels = levels(x),
    ordered = is.ordered(x),
    include_na = any(is.na(levels(x)))
  )
}
#' @export
type_to_col.Date <- function(x, ...) col_date()
#' @export
type_to_col.POSIXct <- function(x, ...) col_datetime()
#' @export
type_to_col.hms <- function(x, ...) col_time()

# nocov end
