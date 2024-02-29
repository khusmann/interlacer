
interlaced_df_problems <- function(df) {
  probs <- lapply(value_names(df), function(value_name) {
    values <- df[[value_name]]
    missing_name <- to_missing_name(value_name)

    if (is.null(df[[missing_name]])) {
      return(glue("Missing reason column `{missing_name}` does not exist."))
    }

    missing_values <- df[[missing_name]]

    if (any(is.na(values) & is.na(missing_values))) {
      return(
        glue(
          paste(
            "Some missing values in column `{value_name}` do not have",
            "missing reasons in `{missing_name}`."
          )
        )
      )
    }

    if (any(!is.na(values) & !is.na(missing_values))) {
      return(
        glue(
          paste(
            "Some non-missing values in column `{value_name}` have missing",
            "reasons in `{missing_name}`."
          )
        )
      )
    }
  })
  is_prob <- sapply(probs, \(x) !is.null(x))
  probs[is_prob]
}

abort_if_interlace_df_problems <- function(df, call = caller_call()) {
  df_problems <- interlaced_df_problems(df)

  if (length(df_problems) > 0) {
    cli_abort(
      c(df_problems[[1]], "i" = "Run `coalesce_missing_reasons()` to fix."),
      call = call
    )
  }
}

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
