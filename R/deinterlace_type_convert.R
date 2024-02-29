#' @export
deinterlace_type_convert <- function(
    x,
    col_types = NULL,
    na = c("", "NA"),
    ...
) {
  col_spec <- as.col_spec(col_types)

  lapply(names(x), function(value_name) {
    curr_column <- x[[value_name]]

    missing_name <- to_missing_name(value_name)

    value_collector <- col_spec$cols[[value_name]] %||% col_spec$default

    all_na_values <- c(value_collector$na, na)

    values <- if_else(curr_column %in% all_na_values, NA, curr_column)

    missing_values <- if_else(curr_column %in% all_na_values, curr_column, NA)

    converted_values <- type_convert_col(values, value_collector, ...)

    if (is.numeric(all_na_values)) {
      converted_missing_values <- as.numeric(missing_values)
    } else {
      converted_missing_values <- factor(missing_values, levels = all_na_values)
    }

    set_names(
      list2(converted_values, converted_missing_values),
      c(value_name, missing_name)
    )
  }) |>
    list_flatten() |>
    bind_cols()
}

type_convert_col <- function(x, col, ...) {
  type_convert(tibble(x), col_types = cols(x = col), ...)$x
}

