#' @export
type_convert_interlaced <- function(
    df,
    col_types = NULL,
    na = c("", "NA"),
    ...
) {
  col_spec <- as.col_spec(col_types)

  col_types <- set_names(names(df), names(df)) |>
    map(\(n) col_spec$cols[[n]] %||% col_spec$default)

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
interlace_columns <- function(df, default_na = "") {
  df |>
    transmute(
      across(
        !matches("\\..*\\."), function(col) {
          missing_name <- paste0(".", cur_column(), ".")
          if (missing_name %in% names(df)) {
            missing_col <- df[[missing_name]]
            case_when(
              !is.na(col) ~ as.character(col),
              !is.na(missing_col) ~ as.character(missing_col),
              T ~ default_na
            )
          } else {
            if_else(is.na(col), default_na, as.character(col))
          }
        }
      )
    )
}
