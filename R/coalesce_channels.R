#' Coalesce missing reasons in a data frame
#'
#' @description
#'
#' Mutations of deinterlaced data frames can result in variables that either
#' have both values and missing reasons, or no values and no missing reasons.
#' `coalesce_channels()` takes care of both situations. In the case where
#' there is both a value and missing reason, it will choose which to keep based
#' on the `keep` paramter. In case where no value or missing reason exists, it
#' will fill the missing reason with the `default_reason` parameter.
#'
#' Mutations can also create new value columns without companion missing reason
#' columns. In that case, a new missing reason will be created and filled with
#' `default_reason` wherever there are missing values in the value column. (
#' This behavior can also be used to stub missing reason columns for value-only
#' data frames)
#'
#' @param x A data frame
#' @param keep When a variable has both a value and missing reason, choose which
#' to keep. (A properly formed deinterlaced data frame has values OR missing
#' reasons)
#' @param default_reason When a variable is missing a value and a missing
#' reason, the default missing reason to fill in.
#'
#' @return A deinterlaced tibble.
#'
#' @export
coalesce_channels <- function(
  x,
  default_reason = getOption("default_missing_reason"),
  keep = c("values", "missing")
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

    # Ensure missing reason column is always a factor
    if (!is.factor((missing_values))) {
      missing_values <- factor(missing_values)
    }

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
    as_deinterlaced_df()
}
