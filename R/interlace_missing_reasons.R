

#' @export
interlace_missing_reasons <- function(df) {
  call = current_call()

  cli_abort_helper <- function(msg) {
    cli_abort(
      c(msg, "i" = "Try running `coalesce_missing_reasons()`."), call = call
    )
  }

  lapply(value_names(df), function(value_name) {
    values <- df[[value_name]]

    missing_name <- to_missing_name(value_name)

    if (is.null(df[[missing_name]])) {
      cli_abort_helper(
        glue("Missing column `{missing_name}` does not exist.")
      )
    }

    missing_values <- df[[missing_name]]

    if (any(is.na(values) & is.na(missing_values))) {
      cli_abort_helper(
        glue(
          paste(
            "Some missing values in column `{value_name}` do not have",
            "missing reasons in `{missing_name}`."
          )
        )
      )
    }

    if (any(!is.na(values) & !is.na(missing_values))) {
      cli_abort_helper(
        glue(
          paste(
            "Some non-missing values in column `{value_name}` have missing",
            "reasons in `{missing_name}`."
          )
        )
      )
    }

    if_else(
      is.na(missing_values),
      as.character(values),
      as.character(missing_values),
    )
  }) |>
    set_names(value_names(df)) |>
    bind_cols()
}
