

#' @export
tbl_format_setup.interlaced_df <- function(x, width, ...) {
  setup <- NextMethod()
  setup$interlaced_probs <- interlaced_df_problems(x)
  setup
}

#' @export
tbl_format_header.interlaced_df <- function(x, setup, ...) {
  pillar::style_subtle(
    glue("# An interlaced tibble: {nrow(x)} {symbol$times} {ncol(x)}")
  )
}

#' @export
tbl_format_footer.interlaced_df <- function(x, setup, ...) {
  default_footer <- NextMethod()

  if (length(setup$interlaced_probs) > 0) {
    extra <- format_bullets_raw(
      c(
        "x" = glue("Warning: {interlaced_probs[[1]]}"),
        "i" = glue("Run `coalesce_missing_reasons()` to fix.")
      )
    )
  } else {
    extra <- NULL
  }

  c(default_footer, extra)
}

interlaced_df <- function(x) {
  if (inherits(x, "interlaced_df")) {
    x
  }

  result <- new_tibble(x, class = "interlaced_df")

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
    missing_name <- to_missing_name(value_name)

    if (!(missing_name %in% names(x))) {
      return(
        glue(
          paste(
            "Column `{value_name}` implies `{missing_name}` should exist, but",
            "`{missing_name}` not found."
          )
        )
      )
    }

    # This check is surprisingly expensive!
    # Consider writing a native function here to speed things up
    if (any(is.na(x[[value_name]]) & is.na(x[[missing_name]]))) {
      return(
        glue(
          "Column `{value_name}` has rows without values or missing reasons"
        )
      )
    }

    # This check is surprisingly expensive!
    # Consider writing a native function here to speed things up
    if (any(!is.na(x[[value_name]]) & !is.na(x[[missing_name]]))) {
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

#' @export
drop_missing_reasons <- function(x) {
  x |>
    select(all_of(value_names(x))) |>
    as_tibble()
}
