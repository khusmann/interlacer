
#' @export
collect_missing <- function(
  df,
  default_reason = getOption("default_missing_reason")
) {
  default_reason <- default_reason %||% factor("UNSPECIFIED_REASON")

  lapply(value_names(df), function(value_name) {
    values <- df[[value_name]]

    missing_name <- to_missing_name(value_name)

    missing_values <- df[[missing_name]] %||%
      if_else(is.na(values), default, NA)

    new_values <- if_else(
      !is.na(values) & !is.na(missing_values), NA, values
    )

    new_missing_values <- if_else(
      is.na(values) & is.na(missing_values), default, missing_values
    )

    set_names(
      list(new_values, new_missing_values),
      c(value_name, missing_name)
    )
  }) |>
    list_flatten() |>
    bind_cols()
}
