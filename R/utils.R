#' The names of an deinterlaced data frame
#'
#' @description
#'
#' Functions to get the names of missing reason columns or value columns in
#' an deinterlaced data frame
#'
#' @param x A deinterlaced data frame
#' @return A vector of missing reason or value column names.
#'
#' @export
missing_names <- function(x) {
  names(x)[is_missing_name(names(x))]
}

#' @rdname missing_names
#' @export
value_names <- function(x) {
  names(x)[is_value_name(names(x))]
}

#' Selection helpers for deinterlaced data frames
#'
#' @description
#'
#' These tidy selection helpers match missing reason or value columns in an
#' deinterlaced data frame
#'
#' * `missing_cols()` selects missing reason columns.
#'
#' * `value_cols()` selects value columns.
#'
#' @inheritParams tidyselect::starts_with
#' @export
missing_cols <- function(vars = NULL) {
  vars <- vars %||% peek_vars(fn = "missing_cols")
  vars[is_missing_name(vars)]
}

#' @rdname missing_cols
#' @export
value_cols <- function(vars = NULL) {
  vars <- vars %||% peek_vars(fn = "value_cols")
  vars[is_value_name(vars)]
}

to_missing_name <- function(x) {
  if (!all(is_value_name(x))) {
    cli_abort(glue("Expected value column names, got: {x}"))
  }
  glue(".{x}.")
}

to_value_name <- function(x) {
  if (!all(is_missing_name(x))) {
    cli_abort(glue("Expected missing column names, got: {x}"))
  }
  gsub("^\\.(.*)\\.$", "\\1", x)
}

is_missing_name <- function(x) {
  grepl("^\\..*\\.$", x)
}

is_value_name <- function(x) {
  !is_missing_name(x)
}

#' Drop missing reasons from a deinterlaced data frame
#'
#' @description
#'
#' Drop the missing reason or value columns from a deinterlaced data frame,
#' turning it into a regular data frame with unlabelled `NA` values.
#'
#' @param x A data frame
#'
#' @return A tibble without missing reason columns.
#'
#' @export
drop_missing_cols <- function(x) {
  x |>
    select(value_cols()) |>
    as_tibble()
}

#' @rdname drop_missing_cols
#' @export
drop_value_cols <- function(x) {
  x |>
    select(missing_cols()) |>
    as_tibble()
}

