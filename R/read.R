#' Read an delimited file with interlaced missing reasons into a tibble
#'
#' The `read_interlaced_*()`, family of functions extend `readr`'s
#' `read_delim()`, `read_csv`, etc. functions for use on data sources where
#' values are interlaced with missing reasons. These functions return a tibble
#' with two columns for each interlaced source column: a column with
#' values, and a column with missing reasons. Missing reason columns are named
#' by taking the value column name and surrounding it by dots
#' (e.g. missing reasons for "col_name" are read into a column named
#' ".col_name.")
#' @param file 	Either a path to a file, a connection, or literal data (either
#' a single string or a raw vector).
#' @param delim Single character used to separate fields within a record.
#' @param col_types One of `NULL`, a [cols()] specification, or a string. In
#' addition to the `col_*` specifiers provided by `readr`, `col_interlaced_*()`
#' specifiers may be used. See `vignette("interlacer")` for more details.
#' @param na Character vector of strings to interpret as missing values. These
#' values will become the factor levels of the missing reason column.
#' @param ... Additional parameters to pass to `read_delim`
#' @return A [tibble()]. If there are parsing problems, a warning will alert you.
#'   You can retrieve the full details by calling [problems()] on your dataset.
#' @export
#' @examples
#' # Beep boop
read_interlaced_delim <- function(
    file,
    delim = NULL,
    col_types = NULL,
    col_select = NULL,
    na = c("", "NA"),
    ...
) {
  read_delim(
    file, delim, col_types = cols(.default = "c"), na = NULL, ...
  ) |>
    read_interlaced_helper(col_types, {{ col_select }}, na)
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_csv <- function(
  file,
  col_types = NULL,
  col_select = NULL,
  na = c("", "NA"),
  ...
) {
  read_csv(
    file, col_types = cols(.default = "c"), na = character(), ...
  ) |>
    read_interlaced_helper(col_types, {{ col_select }}, na)
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_csv2 <- function(
  file,
  col_types = NULL,
  col_select = NULL,
  na = c("", "NA"),
  ...
) {
  read_csv2(
    file, col_types = cols(.default = "c"), na = character(), ...
  ) |>
    read_interlaced_helper(col_types, {{ col_select }}, na)
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_tsv <- function(
  file,
  col_types = NULL,
  col_select = NULL,
  na = c("", "NA"),
  ...
) {
  read_tsv(
    file, col_types = cols(.default = "c"), na = character(), ...
  ) |>
    read_interlaced_helper(col_types, {{ col_select }}, na)
}

read_interlaced_helper <- function(
  df,
  col_types,
  col_select,
  na
) {
  col_select <- enquo(col_select)
  if (quo_is_null(col_select)){
    col_select <- expr(everything())
  }

  deinterlace_type_convert(df, col_types, na) |>
    select(!!col_select) |>
    as_interlaced_df()
}
