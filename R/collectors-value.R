#' @export
as.value_collector <- function(x) {
  UseMethod("as.value_collector")
}

#' @export
as.value_collector.collector <- function(x) {
  type <- gsub("collector_", "", class(x)[[1]])
  value_collector(type, x, unclass(x), color = readr_col_color(type))
}

#' @export
as.value_collector.collector_factor <- function(x) {
  args <- unclass(x)
  if (args$include_na) {
    cli_warn("{.arg include_na} not supported by interlacer value collectors")
    x$include_na <- FALSE
  }
  args$include_na <- NULL
  value_collector("factor", x, args, color = readr_col_color("factor"))
}

#' @export
as.value_collector.interlacer_value_collector <- function(x) {
  x
}

value_collector <- function(
  type,
  impl,
  args = list(),
  value_fn = identity,
  color = col_none
) {
  structure(
    list(
      type = type,
      args = args,
      impl = impl,
      value_fn = value_fn,
      color = color
    ),
    class = "interlacer_value_collector"
  )
}

#' @export
format.interlacer_value_collector <- function(x, ...) {
  args <- fmt_vec_args(x$args)
  x$color(paste0("v_col_", x$type, "(", args, ")"))
}

#' @export
print.interlacer_value_collector <- function(x, ...) {
  cat(paste0("<interlacer_value_collector>\n", format(x)))
}

#' @export
v_col_cfactor <- function(codes, ordered = FALSE) {
  if (is.character(codes)) {
    impl <- readr::col_character()
  } else if (is.numeric(codes)) {
    impl <- readr::col_integer()
  } else {
    cli_abort("{.arg codes} must be character or numeric")
  }
  if (all(names2(codes) == "")) {
    cli_abort("codes must have labels")
  }
  # TODO: add more checks for valid values + labels (unique)

  value_collector(
    "cfactor",
    impl,
    value_fn = \(v) cfactor(v, codes, ordered),
    args = list(codes = codes, ordered = ordered),
    color = readr_col_color("factor")
  )
}

#' @export
v_col_character <- function() {
  value_collector(
    "character",
    readr::col_character(),
    color = readr_col_color("character")
  )
}

#' @export
v_col_date <- function(format = "") {
  value_collector(
    "date",
    readr::col_date(format),
    list(format = format),
    color = readr_col_color("date")
  )
}

#' @export
v_col_datetime <- function(format = "") {
  value_collector(
    "datetime",
    readr::col_datetime(format),
    list(format = format),
    color = readr_col_color("datetime")
  )
}

#' @export
v_col_double <- function() {
  value_collector(
    "double",
    readr::col_double(),
    color = readr_col_color("double")
  )
}

#' @export
v_col_factor <- function(levels = NULL, ordered = FALSE) {
  value_collector(
    "factor",
    readr::col_factor(levels, ordered),
    list(levels = levels, ordered = ordered),
    color = readr_col_color("factor")
  )
}

#' @export
v_col_guess <- function() {
  value_collector(
    "guess",
    readr::col_guess(),
    color = readr_col_color("guess")
  )
}

#' @export
v_col_integer <- function() {
  value_collector(
    "integer",
    readr::col_integer(),
    color = readr_col_color("integer")
  )
}

#' @export
v_col_logical <- function() {
  value_collector(
    "logical",
    readr::col_logical(),
    color = readr_col_color("logical")
  )
}

#' @export
v_col_number <- function() {
  value_collector(
    "number",
    readr::col_number(),
    color = readr_col_color("number")
  )
}

#' @export
v_col_skip <- function() {
  value_collector(
    "skip",
    readr::col_skip(),
    color = readr_col_color("skip")
  )
}

#' @export
v_col_time <- function(format = "") {
  value_collector("time", readr::col_time(format), list(format = format))
}