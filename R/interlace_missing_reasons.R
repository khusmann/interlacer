#' @export
interlace_missing_reasons <- function(x) {
  abort_if_interlace_df_problems(x)

  lapply(value_names(x), function(value_name) {
    values <- x[[value_name]]
    missing_name <- to_missing_name(value_name)
    missing_values <- x[[missing_name]]

    if_else(
      is.na(missing_values),
      as.character(values),
      as.character(missing_values),
    )
  }) |>
    set_names(value_names(x)) |>
    bind_cols()
}
