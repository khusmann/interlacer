#' @export
type_convert_interlaced <- function(
    df,
    col_types = NULL,
    na = c("", "NA"),
    ...
) {
  col_spec <- as.col_spec(col_types)

  col_types <- set_names(names(df), names(df)) |>
    lapply(\(n) col_spec$cols[[n]] %||% col_spec$default)

  imap(col_types, function(col_type, col_name) {
    all_na_vals <- c(col_type$na, na)

    df_converted <- df |>
      transmute(
        across(
          all_of(col_name),
          \(x) if_else(x %in% all_na_vals, NA_character_, x)
        )
      ) %>%
      type_convert(
        col_types = set_names(list(col_type), col_name)
      )

    df_missing <- df |>
      transmute(
        across(
          all_of(col_name),
          \(x) if_else(x %in% all_na_vals, x, NA_character_)
        ),
        across(
          all_of(col_name),
          \(x) factor(x, levels = all_na_vals)
        )
      ) %>%
      rename_with(
        \(n) paste0(".", n, ".")
      )

    bind_cols(
      df_converted,
      df_missing,
    )
  }) |>
    bind_cols()
}

#' @export
interlace_columns <- function(df) {
  call = current_call()

  cli_abort_helper <- function(msg) {
    cli_abort(
      c(msg, "i" = "Try running `collect_missing()`."), call = call
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
