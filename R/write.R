#' Interlace a deinterlaced data frame and write it to a file
#'
#' @description
#'
#' The `write_interlaced_*()` family of functions will take a data frame
#' with interlaced columns, flatten all interlaced columns, then write it to
#' a file. Non-interlaced columns just pass through. The behavior of these
#' functions match their similarly named counterparts in [readr].
#'
#' @inheritParams readr::write_delim
#'
#' @param empty String used for empty values (or `NA` values in non-interlaced
#' columns). Defaults to NA.
#'
#' @returns `write_interlaced_*` returns the input x invisibly
#' @export
write_interlaced_delim <- function(
  x,
  file,
  delim = " ",
  empty = "NA",
  append = FALSE,
  col_names = !append,
  quote = c("needed", "all", "none"),
  escape = c("double", "backslash", "none"),
  eol = "\n",
  num_threads = readr::readr_threads(),
  progress = readr::show_progress()
) {
  readr::write_delim(
    x = flatten_channels(x),
    delim = delim,
    na = empty,
    append = append,
    col_names = col_names,
    quote = quote,
    escape = escape,
    eol = eol,
    num_threads = num_threads,
    progress = progress
  )
  invisible(x)
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_csv <- function(
    x,
    file,
    empty = "NA",
    append = FALSE,
    col_names = !append,
    quote = c("needed", "all", "none"),
    escape = c("double", "backslash", "none"),
    eol = "\n",
    num_threads = readr::readr_threads(),
    progress = readr::show_progress()
) {
  readr::write_csv(
    x = flatten_channels(x),
    file = file,
    na = empty,
    append = append,
    col_names = col_names,
    quote = quote,
    escape = escape,
    eol = eol,
    num_threads = num_threads,
    progress = progress
  )
  invisible(x)
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_csv2 <- function(
    x,
    file,
    empty = "NA",
    append = FALSE,
    col_names = !append,
    quote = c("needed", "all", "none"),
    escape = c("double", "backslash", "none"),
    eol = "\n",
    num_threads = readr::readr_threads(),
    progress = readr::show_progress()
) {
  readr::write_csv2(
    x = flatten_channels(x),
    file = file,
    na = empty,
    append = append,
    col_names = col_names,
    quote = quote,
    escape = escape,
    eol = eol,
    num_threads = num_threads,
    progress = progress
  )
  invisible(x)
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_excel_csv <- function(
    x,
    file,
    empty = "NA",
    append = FALSE,
    col_names = !append,
    quote = c("needed", "all", "none"),
    escape = c("double", "backslash", "none"),
    eol = "\n",
    num_threads = readr::readr_threads(),
    progress = readr::show_progress()
) {
  readr::write_excel_csv(
    x = flatten_channels(x),
    file = file,
    na = empty,
    append = append,
    col_names = col_names,
    quote = quote,
    escape = escape,
    eol = eol,
    num_threads = num_threads,
    progress = progress
  )
  invisible(x)
}


#' @rdname write_interlaced_delim
#' @export
write_interlaced_excel_csv2 <- function(
    x,
    file,
    empty = "NA",
    append = FALSE,
    col_names = !append,
    quote = c("needed", "all", "none"),
    escape = c("double", "backslash", "none"),
    eol = "\n",
    num_threads = readr::readr_threads(),
    progress = readr::show_progress()
) {
  readr::write_excel_csv2(
    x = flatten_channels(x),
    file = file,
    na = empty,
    append = append,
    col_names = col_names,
    quote = quote,
    escape = escape,
    eol = eol,
    num_threads = num_threads,
    progress = progress
  )
  invisible(x)
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_tsv <- function(
    x,
    file,
    empty = "NA",
    append = FALSE,
    col_names = !append,
    quote = c("needed", "all", "none"),
    escape = c("double", "backslash", "none"),
    eol = "\n",
    num_threads = readr::readr_threads(),
    progress = readr::show_progress()
) {
  readr::write_tsv(
    x = flatten_channels(x),
    file = file,
    na = empty,
    append = append,
    col_names = col_names,
    quote = quote,
    escape = escape,
    eol = eol,
    num_threads = num_threads,
    progress = progress
  )
  invisible(x)
}
