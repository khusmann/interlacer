#' Read an delimited file with interlaced missing reasons into a tibble
#'
#' The `read_interlaced_*()`, family of functions extend `readr`'s
#' `read_delim()`, `read_csv`, etc. functions for use on data sources where
#' values are interlaced with missing reasons. These functions return a tibble
#' with two columns for each interlaced source column: a column with
#' values, and a column with missing reasons. Missing reason columns are named
#' by taking the value column name and surrounding it by dots
#' (e.g. missing reasons for "col_name" are read into a column named
#' ".col_name.")
#'
#' @param file 	Either a path to a file, a connection, or literal data (either
#' a single string or a raw vector).
#' @param delim Single character used to separate fields within a record.
#' @param col_types One of `NULL`, a [readr::cols()] specification, or a string. In
#' addition to the `col_*` specifiers provided by `readr`, `icol_*()`
#' specifiers may be used. See `vignette("interlacer")` for more details.
#' @param col_select Columns to include in the results. As with
#' [reader::read_delim], you can use the same mini-language as
#' [dplyr::select()] to refer to the columns by name.
#' @param na Character vector of strings to interpret as missing values. These
#' values will become the factor levels of the missing reason column.
#' @param ... Additional parameters to pass to `read_delim`
#'
#' @return A deinterlaced [tibble()], that is, a tibble with separate columns
#' for values and missing reasonskfor each variable.
#'
#' @export
#' @examples
read_interlaced_delim <- function(
    file,
    delim = NULL,
    col_types = NULL,
    col_select = NULL,
    na = c("", "NA"),
    ...
) {
  interlaced_vroom(
    file = file,
    delim = delim,
    col_types = col_types,
    na = na,
    col_select = {{ col_select }},
    ...
  )
}


#' @rdname read_interlaced_delim
#' @export
read_interlaced_csv <- function(
  file,
  col_types = NULL,
  col_select = NULL,
  na = c("", "NA"),
  ...
) {
  interlaced_vroom(
    file = file,
    delim = ",",
    col_types = col_types,
    na = na,
    col_select = {{ col_select }},
    ...
  )
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_csv2 <- function(
  file,
  col_types = NULL,
  col_select = NULL,
  na = c("", "NA"),
  ...
) {
  interlaced_vroom(
    file = file,
    delim = ";",
    col_types = col_types,
    na = na,
    col_select = {{ col_select }},
    ...
  )
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_tsv <- function(
  file,
  col_types = NULL,
  col_select = NULL,
  na = c("", "NA"),
  ...
) {
  interlaced_vroom(
    file = file,
    delim = "\t",
    col_types = col_types,
    na = na,
    col_select = {{ col_select }},
    ...
  )
}

interlaced_vroom <- function(col_types, na, col_select, ...) {
  col_spec <- as.col_spec(col_types)

  col_spec_names <- names(col_spec$cols) %||% rep_along(col_spec$cols, "")
  if (length(col_spec_names) > 0 && any(col_spec_names == "")) {
    cli_abort("`col_types` must include names")
  }

  # Step 1: Read everything as string

  df_chr <- vroom(
    ...,
    col_types = cols(.default = "c"),
    na = character(),
    col_select = {{ col_select }}
  )

  # Step 2: For each of the resulting columns, go back and convert values

  out <- parallel::mclapply(names(df_chr), function(i) {
    collector <- col_spec$cols[[i]] %||% col_spec$default

    all_na_values <- unique(c(collector$na, na))

    vroom_call <- withWarnings(
      vroom(
        ...,
        col_types = col_spec,
        na = all_na_values,
        col_select = i,
        num_threads = 1,
        show_col_types = FALSE,
        altrep = FALSE
      )
    )

    value_df <- vroom_call$value

    values <- value_df[[1]]

    na_values <- factor(
      ifelse(df_chr[[i]] %in% all_na_values, df_chr[[i]], NA),
      levels = all_na_values
    )

    spec <- attr(value_df, "spec")$cols

    spec_is_skip <- vapply(
      spec, \(x) inherits(x, "collector_skip"), logical(1)
    )

    vroom_collector <- spec[which(!spec_is_skip)][[1]]

    if (inherits(collector, "collector_guess")) {
      collector_used <- vroom_collector
    } else {
      collector_used <- collector
    }

    list(
      values = new_interlaced(values, na_values),
      problems = vroom_call$warnings,
      spec = collector_used
    )
  })

  out <- set_names(out, names(df_chr))

  df <- as_tibble(lapply(out, `[[`, "values"))

  attr(df, "spec") <- inject(cols(!!!lapply(out, `[[`, "spec")))

  # I'd like to hoover up all the vroom problems and put them together as a
  # `problems` attr on the result, but I can't because of this bug:
  # https://github.com/tidyverse/vroom/issues/534
  #
  # Instead, I just warn if there was an issue...
  for (i in names(df)) {
    for (w in out[[i]]$problems) {
      if (inherits(w, "vroom_parse_issue")) {
        cli_warn("column `{i}` had a vroom parse issue")
      } else {
        cli_warn(
          c(
            "unexpected vroom warning on column `{i}`",
            ">" = "{w}"
          )
        )
      }
    }
  }

  df
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
