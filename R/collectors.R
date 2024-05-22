#' Create an NA column specification
#'
#' `na_cols()` creates a specification for the NA channel missing reason when
#' loading data with the `read_interlaced_*()` family of functions.
#'
#' @param ... Named vectors to use as missing reasons when loading interlaced
#' columns. Use name `.default` to set default `NA` values for the columns.
#' @param x Named list to construct a NA spec with, or a vector of values that
#' should be used in a spec with `.default` equal to those values.
#'
#' @export
na_cols <- function(...) {
  xs <- quos(...)

  col_names <- names2(xs)

  output <- set_names(rep_along(xs, list()), col_names)

  env <- new_environment()
  mask <- new_data_mask(env)

  for (j in seq_along(xs)) {
    res <- eval_tidy(xs[[j]], mask)

    output[j] <- list(res)

    if (col_names[[j]] != "") {
      env[[col_names[[j]]]] <- res
    }
  }

  na_col_spec(output)
}

#' @rdname na_cols
#' @export
as.na_col_spec <- function(x) {
  UseMethod("as.na_col_spec")
}

#' @export
as.na_col_spec.default <- function(x) {
  na_col_spec(list(.default = x))
}

#' @export
as.na_col_spec.interlacer_na_col_spec <- function(x) {
  x
}

#' @export
as.na_col_spec.list <- function(x) {
  do.call(na_cols, x)
}


na_col_spec <- function(na_list) {
  for (j in seq_along(na_list)) {
    if (!is.numeric(j) && !is.character(j)) {
      cli_abort(
        paste0(
          "na collector `{names(na_list)[[j]]}` is not a numeric",
          " or character vector"
        )
      )
    }
  }

  default <- na_list$.default
  na_list$.default <- NULL

  structure(
    list(cols = na_list, default = default),
    class = "interlacer_na_col_spec"
  )
}

#' @rdname na_cols
#' @export
is.na_col_spec <- function(x) {
  inherits(x, "interlacer_na_col_spec")
}

#' @export
print.interlacer_na_col_spec <- function (x, ...) {
  cat(format(x))
  invisible(x)
}

#' @export
format.interlacer_na_col_spec <- function (x, ...) {
  cols <- x$cols

  cols_args <- c(
    map_chr(seq_along(cols), function(i) {
      col_value <- format_na_collector(cols[[i]])
      col_name <- names(cols)[[i]] %||% ""

      if (col_name != "") {
        col_name <- paste0(fix_non_syntactic(col_name), " = ")
      }

      paste0(col_name, col_value)
    })
  )

  if (!is.null(x$default)) {
    cols_args <- c(
      paste0(".default = ", format_na_collector(x$default)), cols_args
    )
  }

  out <- paste0(
    "na_cols(\n",
    "  ", paste0(cols_args, collapse = ",\n  "),
    "\n)\n"
  )
}

format_na_collector <- function(x, ...) {
  if (is.null(x)) {
    col_red("NULL")
  } else if (is.numeric(x)) {
    col_green(fmt_vec(x, quote = FALSE))
  } else if (is.character(x)) {
    col_magenta(fmt_vec(x, quote = TRUE))
  } else {
    "???"
  }
}

fmt_vec <- function(x, quote) {
  if (quote) {
    x <- paste0("\"", x, "\"")
  }
  paste0(
    "c(", paste0(x, collapse= ", "), ")"
  )
}

#' @importFrom readr col_character
#' @export
readr::col_character

#' @importFrom readr col_date
#' @export
readr::col_date

#' @importFrom readr col_datetime
#' @export
readr::col_datetime

#' @importFrom readr col_double
#' @export
readr::col_double

#' @importFrom readr col_factor
#' @export
readr::col_factor

#' @importFrom readr col_guess
#' @export
readr::col_guess

#' @importFrom readr col_integer
#' @export
readr::col_integer

#' @importFrom readr col_logical
#' @export
readr::col_logical

#' @importFrom readr col_number
#' @export
readr::col_number

#' @importFrom readr col_skip
#' @export
readr::col_skip

#' @importFrom readr col_time
#' @export
readr::col_time

#' @importFrom readr cols_condense
#' @export
readr::cols_condense

#' @importFrom readr cols_only
#' @export
readr::cols_only

#' @importFrom readr cols
#' @export
readr::cols

#' @importFrom readr as.col_spec
#' @export
readr::as.col_spec

#' @importFrom readr spec
#' @export
readr::spec
