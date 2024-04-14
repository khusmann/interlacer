

#' Determine how many threads interlacer should use when processing. If not
#' running on a Unix-based system (like Windows), return 1 because they do not
#' support [parallel::mclapply()], which is what is currently being used for
#' parallel processing.
#'
#' The number of threads returned can be set by
#' - If `.Platform$OS.type != "unix"`, return `1`
#' - The global option `interlacer.num_threads`
#' - The environment variable `VROOM_THREADS`
#' - The value of [parallel::detectCores()]
#' @export
interlacer_threads <- function() {
  if (.Platform$OS.type != "unix") {
    return(1)
  }

  res <- getOption("interlacer.num_threads")

  if (is.null(res)) {
    res <- as.integer(Sys.getenv("VROOM_THREADS", parallel::detectCores()))
    options("interlacer.num_threads" = res)
  }

  if (is.na(res) || res <= 0) {
    res <- 1
  }

  res
}

#' Determine whether progress bars should be shown
#'
#' By default, interlacer shows progress bars. However, progress reporting is
#' suppressed if any of the following conditions hold:
#' - The bar is explicitly disabled by setting
#'   `options(interlacer.show_progress = FALSE)`.
#' - The code is run in a non-interactive session, as determined by
#'   [rlang::is_interactive()].
#' - The code is run in an RStudio notebook chunk, as determined by
#'   `getOption("rstudio.notebook.executing")`.
#' @export
interlacer_progress <- function() {
  isTRUE(getOption("interlacer.show_progress")) && rlang::is_interactive() &&
    !isTRUE(getOption("rstudio.notebook.executing"))
}

#' Determine whether column types should be shown
#'
#' Wrapper around `getOption("interlacer.show_col_types")` that implements
#' some fall back logic if the option is unset. This returns:
#' * `TRUE` if the option is set to `TRUE`
#' * `FALSE` if the option is set to `FALSE`
#' * `FALSE` if the option is unset and we appear to be running tests
#' * `NULL` otherwise, in which case the caller determines whether to show
#'   column types based on context, e.g. whether `interlacer_show_col_types` or
#'   actual `col_types` were explicitly specified
#' @export
interlacer_show_col_types <- function() {
  opt <- getOption("interlacer.show_col_types", NA)
  if (isTRUE(opt)) {
    TRUE
  }
  else if (identical(opt, FALSE)) {
    FALSE
  }
  else if (is.na(opt) && is_testing()) {
    FALSE
  }
  else {
    NULL
  }
}

# Source:
# https://stackoverflow.com/questions/3903157/how-can-i-check-whether-a-function-call-results-in-a-warning
withWarnings <- function(expr) {
  myWarnings <- list()
  wHandler <- function(w) {
    myWarnings <<- c(myWarnings, list(w))
    invokeRestart("muffleWarning")
  }
  val <- withCallingHandlers(expr, warning = wHandler)
  list(value = val, warnings = myWarnings)
}


interlacer_enquo <- function(x) {
  if (quo_is_call(x, "c") || quo_is_call(x, "list")) {
    return(as_quosures(get_expr(x)[-1], get_env(x)))
  }
  x
}
