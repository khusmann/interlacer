#' @export
interlace_missing_reasons <- function(df) {
  abort_if_interlace_df_problems(df)

  lapply(value_names(df), function(value_name) {
    values <- df[[value_name]]
    missing_name <- to_missing_name(value_name)
    missing_values <- df[[missing_name]]

    if_else(
      is.na(missing_values),
      as.character(values),
      as.character(missing_values),
    )
  }) |>
    set_names(value_names(df)) |>
    bind_cols()
}
