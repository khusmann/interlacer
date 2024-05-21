#' @export
as.na_col_spec <- function(x) {
  UseMethod("as.na_col_spec")
}

#' @export
as.na_col_spec.default <- function(x) {
  na_col_spec(list(), default = x)
}

#' @export
as.na_col_spec.interlacer_na_col_spec <- function(x) {
  x
}

#' @export
as.na_col_spec.list <- function(x) {
  do.call(na_cols, x)
}

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

  default <- output$.default
  output$.default <- NULL
  na_col_spec(output, default)
}

na_col_spec <- function(na_list, default) {
  structure(
    list(cols = map(na_list, na_collector), default = na_collector(default)),
    class = "interlacer_na_col_spec"
  )
}

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
      col_value <- format(cols[[i]])
      col_name <- names(cols)[[i]] %||% ""

      if (col_name != "") {
        col_name <- paste0(fix_non_syntactic(col_name), " = ")
      }

      paste0(col_name, col_value)
    })
  )

  if (!is.null(x$default$value)) {
    cols_args <- c(
      paste0(".default = ", format(x$default)), cols_args
    )
  }

  out <- paste0(
    "na_cols(\n",
    "  ", paste0(cols_args, collapse = ",\n  "),
    "\n)\n"
  )
}

#' @export
na_collector <- function(values) {
  UseMethod("na_collector")
}

#' @export
na_collector.default <- function(values) {
  if (any(is.na(values))) {
    cli_abort("na_collectors cannot contain missing values")
  }

  cli_abort("na_collector type not supported: {class(values)[[1]]}")
}

#' @export
na_collector.NULL <- function(values) {
  new_na_collector("skip", NULL, character())
}

#' @export
na_collector.integer <- function(values) {
  new_na_collector("integer", values, as.character(values))
}

#' @export
na_collector.double <- function(values) {
  new_na_collector(
    "integer", vec_cast(values, integer()), as.character(values)
  )
}

#' @export
na_collector.character <- function(values) {
  new_na_collector("character", values, values)
}

#' @export
na_collector.factor <- function(values) {
  new_na_collector(
    "factor",
    factor(levels(values), levels(values), ordered = is.ordered(values)),
    levels(values)
  )
}

#' @export
format.interlacer_na_collector <- function(x, ...) {
  if (is.null(x$values)) {
    col_red("NULL")
  } else if (is.integer(x$values)) {
    col_green(fmt_vec(x$chr_values, quote = FALSE))
  } else if (is.character(x$values)) {
    col_red(fmt_vec(x$chr_values, quote = TRUE))
  } else if (is.factor(x$values)) {
    col_red(
      paste0(
        "factor(levels = ",
        fmt_vec(x$chr_values, quote = TRUE),
        ", ordered = ", is.ordered(x$value),
        ")"
      )
    )
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

#' @export
print.interlacer_na_collector <- function(x, ...) {
  cat(paste0("<", class(x)[[1]], ">\n"))
  cat(format(x), "\n")
  invisible(x)
}

new_na_collector <- function(type, values, chr_values) {
  if (any(is.na(values))) {
    cli_abort("na_collectors cannot contain missing values")
  }

  structure(
    list(
      values = values,
      chr_values = chr_values
    ),
    class = c("interlacer_na_collector")
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
