#' @export
as.na_collector <- function(x) {
  UseMethod("as.na_collector")
}

#' @export
as.na_collector.default <- function(x) {
  cli_abort("Cannot convert {class(x)[[1]]} to na collector")
}

#' @export
as.na_collector.interlacer_na_collector <- function(x) x

#' @export
as.na_collector.NULL <- function(x) {
  na_col_none()
}

#' @export
as.na_collector.character <- function(x) {
  if (is.null(names(x))) {
    inject(na_col_factor(!!!x))
  } else {
    inject(na_col_cfactor(!!!x))
  }
}

#' @export
as.na_collector.integer <- function(x) {
  if (is.null(names(x))) {
    inject(na_col_integer(!!!x))
  } else {
    inject(na_col_cfactor(!!!x))
  }
}

#' @export
as.na_collector.double <- function(x) {
  if (is.null(names(x))) {
    inject(na_col_integer(!!!x))
  } else {
    inject(na_col_cfactor(!!!x))
  }
}

#' @export
na_collector <- function(type, values, chr_values, args, color) {
  structure(
    list(
      type = type,
      values = values,
      chr_values = chr_values,
      args = args,
      color = color
    ),
    class = "interlacer_na_collector"
  )
}

#' @export
na_col_default <- function() {
  na_collector(
    "default",
    values = NULL,
    chr_values = NULL,
    args = list(),
    color = readr_col_color("guess")
  )
}

is.na_collector <- function(x) {
  inherits(x, "interlacer_na_collector")
}

is.na_col_default <- function(x) {
  is.na_collector(x) && x$type == "default"
}

is.na_col_none <- function(x) {
  is.na_collector(x) && x$type == "none"
}

#' @export
na_col_none <- function() {
  na_collector(
    "none",
    values = character(),
    chr_values = character(),
    args = list(),
    color = readr_col_color("skip")
  )
}

#' @export
na_col_integer <- function(...) {
  values <- list_c(list2(...))
  if (!is.numeric(values)) {
    cli_abort("expected numeric values for integer na collector")
  }
  if (length(unique(values)) != length(values)) {
    cli_abort("na collector values must be unique")
  }
  if (!is.null(names(values))) {
    cli_abort("integer na values cannot be named")
  }
  na_collector(
    "integer",
    values = as.integer(values),
    chr_values = as.character(values),
    args = values,
    color = readr_col_color("integer")
  )
}

#' @export
na_col_factor <- function(...) {
  values <- list_c(list2(...))
  if (!is.character(values)) {
    cli_abort("expected character values for factor na collector")
  }
  if (length(unique(values)) != length(values)) {
    cli_abort("na collector values must be unique")
  }
  if (!is.null(names(values))) {
    cli_abort("levels cannot be named")
  }
  na_collector(
    "factor",
    values = factor(values, levels=values),
    chr_values = values,
    args = values,
    color = readr_col_color("character")
  )
}

#' @export
na_col_cfactor <- function(...) {
  values <- list_c(list2(...))
  if (!is.character(values) && !is.numeric(values)) {
    cli_abort("expected character or numeric values for factor na collector")
  }
  if (length(unique(values)) != length(values)) {
    cli_abort("na collector values must be unique")
  }

  na_collector(
    "cfactor",
    values = cfactor(unname(values), codes=values),
    chr_values = unname(as.character(values)),
    args = values,
    color = readr_col_color("factor")
  )
}

#' @export
format.interlacer_na_collector <- function(x, ...) {
  x$color(paste0("na_col_", x$type, "(", fmt_vec_args(x$args), ")"))
}

#' @export
print.interlacer_na_collector <- function(x, ...) {
  cat(paste0("<interlacer_na_collector>\n", format(x)))
}

#' @export
x_spec <- function(x) {
  stopifnot(inherits(x, "tbl_df"))
  attr(x, "x_spec")
}
