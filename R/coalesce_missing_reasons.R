
#' @export
coalesce_missing_reasons <- function(
  x,
  keep = c("values", "missing"),
  default_reason = getOption("default_missing_reason")
) {
  default_reason <- factor(default_reason %||% "UNKNOWN_REASON")
  keep <- match.arg(keep)

  for (missing_name in missing_names(x)) {
    value_name <- to_value_name(missing_name)
    if (is.null(x[[value_name]])) {
      cli_abort(
        glue(
          paste(
            "Column `{missing_name}` implies `{value_name}` should exist, but",
            "`{value_name}` not found."
          )
        )
      )
    }
  }

  lapply(value_names(x), function(value_name) {
    values <- x[[value_name]]

    missing_name <- to_missing_name(value_name)

    missing_values <- x[[missing_name]] %||%
      if_else(is.na(values), default_reason, NA)

    if (keep == "values") {
      new_values <- values

      new_missing_values <- case_when(
        !is.na(values) ~ NA,
        !is.na(missing_values) ~ missing_values,
        T ~ default_reason
      )
    } else {
      new_values <- if_else(
        !is.na(values) & !is.na(missing_values), NA, values
      )
      new_missing_values <- if_else(
        is.na(values) & is.na(missing_values), default_reason, missing_values
      )
    }

    set_names(
      list(new_values, new_missing_values),
      c(value_name, missing_name)
    )
  }) |>
    list_flatten() |>
    bind_cols() |>
    as_interlaced_df()
}
