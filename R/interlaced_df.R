
#' @export
tbl_format_footer.interlaced_df <- function(x, setup, ...) {
  probs <- interlaced_df_problems(x)

  if (length(probs) > 0) {
    format_bullets_raw(
      c(
        "x" = glue("Warning: {probs[[1]]}"),
        "i" = glue("Run `coalesce_missing_reasons()` to fix.")
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
      return(
        glue(
          paste(
            "Column `{missing_name}` implies `{value_name}` should exist, but",
            "`{value_name}` not found."
          )
        )
      )
    }
  })

  value_probs <- lapply(value_names(x), function(value_name) {
    values <- x[[value_name]]
    missing_name <- to_missing_name(value_name)

    if (is.null(x[[missing_name]])) {
      return(
        glue(
          paste(
            "Column `{value_name}` implies `{missing_name}` should exist, but",
            "`{missing_name}` not found."
          )
        )
      )
    }

    missing_values <- x[[missing_name]]

    if (any(is.na(values) & is.na(missing_values))) {
      return(
        glue(
          "Column `{value_name}` has rows without values or missing reasons"
        )
      )
    }

    if (any(!is.na(values) & !is.na(missing_values))) {
      return(
        glue(
          "Column `{value_name}` has rows with both values and missing reasons",
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
