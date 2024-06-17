#' Apply a function across the value or missing reason channels of multiple
#' columns
#'
#' `across_value_channels()` and `across_na_channels()` are simple wrappers
#' `dplyr::across()` that applies transformations to value or missing reason
#' channels, respectively.
#'
#' @inheritParams dplyr::across
#'
#' @returns like `dplyr::across()`, `across_value_channels()` and
#' `across_na_channels()` return a tibble with one column for each column in
#' `.cols` and each function in `.fns`
#'
#' @export
across_value_channels <- function(.cols, .fns, .names = NULL, .unpack = FALSE) {
  across_lift(map_value_channel, {{.cols}}, {{.fns}}, .names, .unpack)
}

#' @rdname across_value_channels
#' @export
across_na_channels <- function(.cols, .fns, .names = NULL, .unpack = FALSE) {
  across_lift(map_na_channel, {{.cols}}, {{.fns}}, .names, .unpack)
}

across_lift <- function(
  lift_fn, .cols, .fns, .names, .unpack, error_call = caller_env()
) {
  .fns <- eval_tidy({{.fns}})

  do_lift <- function(x) {
    if (is_formula(x) || is_function(x)) {
      \(w) lift_fn(w, as_function(x, arg = ".fns", call = error_call))
    } else {
      abort(
        "`.fns` must be a function, a formula, or a list of functions/formulas.",
        call = error_call
      )
    }
  }

  if (is_list(.fns)) {
    wrapped_fns <- map(.fns, do_lift)
  } else {
    wrapped_fns <- do_lift(.fns)
  }

  dplyr::across({{.cols}}, wrapped_fns, .names = .names, .unpack = .unpack)
}

#' Select variables with a function applied on value or missing reason channels
#'
#' `where_value_channel()` and `where_na_channel()` are simple wrappers for
#' `tidyselect::where()` that apply the selection function to the value or
#' missing reason channel of columns, respectively.
#'
#' @inheritParams tidyselect::where
#'
#' @export
where_value_channel <- function(fn) {
  \(x) tidyselect::where(fn)(value_channel(x))
}

#' @rdname where_value_channel
#' @export
where_na_channel <- function(fn) {
  \(x) tidyselect::where(fn)(na_channel(x))
}
