is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}

#' @importFrom vctrs vec_c
#' @export
vctrs::vec_c

is_syntactic <- function(x) make.names(x) == x

fix_non_syntactic <- function(x) {
  non_syntactic <- !is_syntactic(x)
  x[non_syntactic] <- paste0("`", gsub("`", "\\\\`", x[non_syntactic]), "`")
  x
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
  if (all(is.na(out)) && inherits(col, "collector_guess")) {
    unspecified(length(out))
  } else {
    out
  }
}
