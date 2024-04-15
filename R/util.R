

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

#' @importFrom readr show_progress
#' @export
readr::show_progress

#' @importFrom readr should_show_types
#' @export
readr::should_show_types

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

## Misc internal functions from vroom

vroom_should_show_col_types <- function(has_col_types, show_col_types) {
  if (is.null(show_col_types)) {
    return(isTRUE(!has_col_types))
  }
  isTRUE(show_col_types)
}

vroom_show_col_types <- function(x, locale) {
  show_dims(x)
  summary(spec(x), locale = locale)
  cli_block(class = "vroom_spec_message", {
    cli::cli_verbatim("\n\n")
    cli::cli_alert_info("Use {.fn spec} to retrieve the full column specification for this data.")
    cli::cli_alert_info("Specify the column types or set {.arg show_col_types = FALSE} to quiet this message.")
  })
}

show_dims <- function(x) {
  cli_block(class = "vroom_dim_message", {
    cli::cli_text("
      {.strong Rows: }{.val {NROW(x)}}
      {.strong Columns: }{.val {NCOL(x)}}
      ")
  })
}


cli_block <- function(expr, class = NULL, type = rlang::inform) {
  msg <- ""
  withCallingHandlers(
    expr,
    message = function(x) {
      msg <<- paste0(msg, x$message)
      invokeRestart("muffleMessage")
    }
  )
  msg <- sub("^\n", "", msg)
  msg <- sub("\n+$", "", msg)

  type(msg, class = class)
}

vroom_col_select_map <- function(col_select, col_spec) {
  col_select <- vroom_enquo(enquo(col_select))
  if (inherits(col_select, "quosures") || !quo_is_null(col_select)) {
    if (inherits(col_select, "quosures")) {
      vars <- tidyselect::vars_select(
        names(col_spec$cols), !!!col_select
      )
    } else {
      vars <- tidyselect::vars_select(
        names(col_spec$cols), !!col_select
      )
    }
  } else {
    vars <- set_names(names(col_spec$cols), names(col_spec$cols))
  }
  vars
}

vroom_enquo <- function(x) {
  if (quo_is_call(x, "c") || quo_is_call(x, "list")) {
    return(as_quosures(get_expr(x)[-1], get_env(x)))
  }
  x
}
