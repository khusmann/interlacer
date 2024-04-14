#' Convert character columns into interlaced values and missing reasons
#'
#' @description
#'
#' This is a simple wrapper for `readr::type_convert()` that converts character
#' columns into columns with interlaced values and missing reasons
#'
#' @param x A data frame
#' @param col_types One of `NULL`, a [readr::cols()] specification, or a string.
#' @param na Character vector of strings to interpret as missing values.
#' @param ... additional parameters to pass to `readr::type_convert()`
#'
#' @return A [tibble()] with interlaced columns
#'
#' @export
interlaced_type_convert <- function(
    df,
    col_types = NULL,
    na = c("", "NA"),
    trim_ws = TRUE,
    locale = default_locale()
) {
  # I thought about adding an `na_labels` to this API, but decided against it
  # because col_factor() doesn't provide `labels`. It's probably because it's
  # considered better to explicitly `fct_recode` instead.

  stopifnot(is.data.frame(df))
  is_character <- vapply(df, is.character, logical(1))

  if (!any(is_character)) {
    warning("`type_convert()` only converts columns of type 'character'.\n- `df` has no columns of type 'character'", call. = FALSE)
  }

  col_spec <- as.col_spec(col_types)

  col_spec_names <- names(col_spec$cols) %||% rep_along(col_spec$cols, "")
  if (length(col_spec_names) > 0 && any(col_spec_names == "")) {
    cli_abort("`col_types` must include names")
  }

  for (i in names(df)) {

    if (is.character(df[[i]])) {
      collector <- col_spec$cols[[i]] %||% col_spec$default

      all_na_values <- unique(c(collector$na, na))

      values <- if_else(df[[i]] %in% all_na_values, NA, df[[i]])

      missing_values <- if_else(df[[i]] %in% all_na_values, df[[i]], NA)

      converted_values <- convert_helper(
        values,
        collector,
        na,
        trim_ws,
        locale
      )

      converted_missing_values <- factor(missing_values, levels = all_na_values)

      df[[i]] <- new_interlaced(converted_values, converted_missing_values)
    }
  }

  df
}


convert_helper <- function(x, col, na, trim_ws, locale) {
  col_str <- vroom::vroom_format(
    tibble(row = seq_along(x), x),
    delim = "\t",
    na = "",
    escape = "double",
    quote = "all",
    num_threads = 1
  )
  vroom::vroom(
    I(col_str),
    delim = "\t",
    na = "",
    escape_double = TRUE,
    quote = "\"",
    col_types = cols(row = col_integer(), x = col),
    num_threads = 1,
    progress = FALSE
  )$x
}

