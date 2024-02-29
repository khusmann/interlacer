
#' @export
tbl_format_footer.interlaced_df <- function(x, setup, ...) {
  probs <- interlaced_df_problems(x)

  if (length(probs) > 0) {
    style_subtle(
      c(
        glue("{symbol$cross} Warning: {probs[[1]]}"),
        glue("{symbol$info} Run `coalesce_missing_reasons()` to fix.")
      )
    )
  }
}

interlaced_df <- function(x) {
  if (inherits(x, "interlaced_df")) {
    x
  }

  result <- new_tibble(x, class = "interlaced_df")

  abort_if_interlace_df_problems(result)

  result
}

as_interlaced_df <- function(x) {
  interlaced_df(x)
}

is_interlaced_df <- function(x) {
  inherits(x, "interlaced_df")
}

interlaced_df_problems <- function(x) {
  missing_probs <- lapply(missing_names(x), function(missing_name) {
    value_name <- to_value_name(missing_name)
    if (is.null(x[[value_name]])) {
      return(glue("Value column `{value_name}` does not exist."))
    }
  })

  value_probs <- lapply(value_names(x), function(value_name) {
    values <- x[[value_name]]
    missing_name <- to_missing_name(value_name)

    if (is.null(x[[missing_name]])) {
      return(glue("Missing reason column `{missing_name}` does not exist."))
    }

    missing_values <- x[[missing_name]]

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

  probs <- c(value_probs, missing_probs)
  is_prob <- sapply(probs, \(x) !is.null(x))
  probs[is_prob]
}

abort_if_interlace_df_problems <- function(x, call = caller_call()) {
  df_problems <- interlaced_df_problems(x)

  if (length(df_problems) > 0) {
    cli_abort(
      c(df_problems[[1]], "i" = "Run `coalesce_missing_reasons()` to fix."),
      call = call
    )
  }
}
