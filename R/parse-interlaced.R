#' Parse a `character` vector into an `interlaced` vector type
#'
#' `parse_interlaced` converts a character vector to an `interlaced` vector
#' by parsing it with a readr `collector` type.
#'
#' @param x A character vector
#' @param na A missing reason collector (e.g. `na_col_integer()`), or one of
#' its shortcuts (e.g. a list of missing values)
#' @param .default A value collector to parse the character values (e.g.
#' `v_col_double()`, `v_col_integer()`, etc.)
#'
#' @returns An `interlaced` vector
#'
#' @export
parse_interlaced <- function(
  x, na,
  .default = v_col_guess()
) {
  if (!is.character(x)) {
    cli_abort("{.arg x} must be a character vector")
  }

  value_collector <- as.value_collector(.default)
  na_collector <- as.na_collector(na)

  v <- value_collector$value_fn(
    type_convert_col(x, value_collector$impl, na = na_collector$chr_values)
  )

  m <- na_collector$values[match(x, na_collector$chr_values)]

  new_interlaced(v, m)
}
