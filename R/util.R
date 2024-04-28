is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
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

type_convert_col <- function(x, col, na) {
  out <- readr::type_convert(tibble(x), col_types = list(x = col), na=na)$x
  if (all(is.na(out))) {
    unspecified(length(out)) # TODO: only do this if col_guess
  } else {
    out
  }
}
