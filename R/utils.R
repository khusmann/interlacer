
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

#' @export
missing_names <- function(df) {
  names(df)[is_missing_name(names(df))]
}

#' @export
value_names <- function(df) {
  names(df)[is_value_name(names(df))]
}

#' @export
missing_cols <- function(vars = peek_vars(fn = "missing_cols")) {
  vars[is_missing_name(vars)]
}

#' @export
value_cols <- function(vars = peek_vars(fn = "value_cols")) {
  vars[is_value_name(vars)]
}
