#' @export
x_cols <- function(..., .default = v_col_guess()) {
  col_types <- list2(...)
  x_col_spec(col_types, .default)
}

#' @export
x_cols_only <- function(...) {
  col_types <- list2(...)
  x_col_spec(col_types, v_col_skip())
}

#' @export
as.x_col_spec <- function(x) {
  UseMethod("as.x_col_spec")
}

#' @export
as.x_col_spec.default <- function(x) {
  cli_abort("{.fn as.x_col_spec} not implemented for {class(x)[[1]]}")
}

#' @export
as.x_col_spec.interlacer_x_col_spec <- function(x) {
  x
}

#' @export
as.x_col_spec.col_spec <- function(x) {
  x_col_spec(x$cols, x$default)
}

#' @export
as.x_col_spec.list <- function(x) {
  inject(x_cols(!!!x))
}

#' @importFrom vroom as.col_spec
#' @export
as.col_spec.interlacer_x_col_spec <- function(x) {
  has_col_level_na <- map_lgl(x$cols, \(v) !is.na_col_default(v$na_collector))
  if (any(has_col_level_na)) {
    cli_warn("column-level na values lost in conversion from extended col types")
  }
  inject(
    vroom::cols(
      !!!map(x$cols, \(v) v$value_collector$impl),
      .default = x$default$impl
    )
  )
}

x_col_spec <- function(col_types, default) {
  col_types <- map(col_types, as.x_collector)
  default <- as.value_collector(default)
  if (any(names2(col_types) == "")) {
    cli_abort("All {.arg col_types} must be named")
  }
  structure(
    list(cols = col_types, default = default),
    class = "interlacer_x_col_spec"
  )
}

indent_tail_lines <- function(s, n = 2) {
  val_lines <- strsplit(s, "\n")[[1]]
  val_lines[-1] <- paste0(
    paste0(rep(" ", n), collapse=""), val_lines[-1]
  )
  paste0(val_lines, collapse = "\n")
}

#' @export
format.interlacer_x_col_spec <- function(x, ...) {
  cols_fmt <- map_chr(seq_along(x$cols), function(i) {
    nm <- names2(x$cols)[[i]]
    val <- indent_tail_lines(format(x$cols[[i]]))
    paste0(style_bold(nm), " = ", val)
  })

  if (x$default$type == "skip") {
    header <- "x_cols_only(\n"
  } else {
    header <- "x_cols(\n"
  }

  if (x$default$type != "guess" && x$default$type != "skip") {
    default_line <- paste0(
      "  ", style_bold(".default"), " = ", format(x$default), ",\n"
    )
  } else {
    default_line <- NULL
  }

  paste0(
    header,
    default_line,
    "  ", paste0(cols_fmt, collapse = ",\n  "),
    "\n)\n"
  )
}

#' @export
print.interlacer_x_col_spec <- function(x, ...) {
  cat(format(x))
}

#' @export
as.x_collector <- function(x) {
  UseMethod("as.x_collector")
}

#' @export
as.x_collector.default <- function(x) {
  cli_abort("Cannot convert {class(x)[[1]]} to x collector")
}

#' @export
as.x_collector.interlacer_x_collector <- function(x) {
  x
}

#' @export
as.x_collector.collector <- function(x) {
  x_col(x)
}

#' @export
as.x_collector.interlacer_value_collector <- function(x) {
  x_col(x)
}

#' @export
x_col <- function(value_collector, na_collector = na_col_default()) {
  x_collector(
    as.value_collector(value_collector),
    as.na_collector(na_collector)
  )
}

x_collector <- function(value_collector, na_collector) {
  structure(
    list(
      value_collector = value_collector,
      na_collector = na_collector
    ),
    class = "interlacer_x_collector"
  )
}

is.x_collector <- function(x) {
  inherits(x, "interlacer_x_collector")
}

#' @export
format.interlacer_x_collector <- function(x, indent = 0, ...) {
  if (is.na_col_default(x$na_collector)) {
    format(x$value_collector)
  } else {
    paste0(
      "x_col(\n",
      "  ", format(x$value_collector), ",\n",
      "  ", format(x$na_collector), "\n",
      ")"
    )
  }
}

#' @export
print.interlacer_x_collector <- function(x, ...) {
  cat(paste0("<interlacer_x_collector>\n", format(x)))
}
