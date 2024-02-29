#' @export
interlaced_type_convert <- function(
    df,
    col_types = NULL,
    na = c("", "NA"),
    ...
) {
  col_spec <- as.col_spec(col_types)

  lapply(names(df), function(value_name) {
    curr_column <- df[[value_name]]

    missing_name <- to_missing_name(value_name)

    value_collector <- col_spec$cols[[value_name]] %||% col_spec$default

    all_na_values <- c(value_collector$na, na)

    values <- if_else(curr_column %in% all_na_values, NA, curr_column)

    missing_values <- if_else(curr_column %in% all_na_values, curr_column, NA)

    set_names(
      list2(
        type_convert_col(values, value_collector),
        factor(missing_values, levels = all_na_values),
      ),
      c(value_name, missing_name)
    )
  }) |>
    list_flatten() |>
    bind_cols()
}

type_convert_col <- function(x, col, ...) {
  type_convert(tibble(x), col_types = cols(x = col), ...)$x
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
