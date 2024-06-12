is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}

fmt_vec <- function(x) {
  flat_x <- paste0(fmt_vec_args(x), collapse = ", ")
  if (length(x) > 1 || !is.null(names(x))) {
    paste0("c(", flat_x, ")")
  } else {
    flat_x
  }
}

fmt_vec_args <- function(vec) {
  if (is.null(vec)) {
    return("NULL")
  }

  if (is.list(vec)) {
    vals <- map_chr(vec, fmt_vec)
  } else if (is.character(vec)) {
    vals <- paste0("\"", unname(vec), "\"")
  } else {
    vals <- format(unname(vec))
  }

  paste0(
    map_chr(seq_along(vec), function(i) {
      arg_name <- names2(vec)[[i]]
      if (arg_name == "") {
        vals[[i]]
      } else {
        paste0(fix_non_syntactic(arg_name), " = ", vals[[i]])
      }
    }), collapse = ", "
  )
}

readr_col_color <- function(fname) {
  switch(
    fname,
    skip = ,
    guess = col_none,

    character = ,
    factor = col_red,

    logical = col_yellow,

    double = ,
    integer = ,
    number = col_green,

    date = ,
    datetime = ,
    time = col_blue,
  )
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

hash_label <- function (x, length = 5) {
  if (length(x) == 0) {
    ""
  }
  else {
    substr(rlang::hash(x), 1, length)
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

type_convert_col <- function(x, col, na) {
  out <- readr::type_convert(tibble(x), col_types = list(x = col), na=na)$x
  if (all(is.na(out)) && inherits(col, "collector_guess")) {
    unspecified(length(out))
  } else {
    out
  }
}
