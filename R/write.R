#' Interlace a deinterlaced data frame and write it to a file
#'
#' @description
#'
#' The `write_interlaced_*()` family of functions will take a deinterlaced
#' data frame, re-interlace it, and write it to a flie. The behavior of these
#' functions match their similarly named counterparts in [readr].
#'
#' @param x A data frame or tibble to write to disk
#' @param file File or connection to write to
#' @param delim Delimiter used to separate values. Defaults to " " for
#' `write_interlaced_delim()`, "," for `write_interlaced_excel_csv()` and ";"
#' for `write_interlaced_excel_csv2()`. Must be a single character.
#' @param ... Additional parameters to pass to [readr]
#'
#' @returns `write_interlaced_*` returns the input x invisibly
#' @export
write_interlaced_delim <- function(x, file, delim = " ", ...) {
  write_delim(
    interlace_channels(x),
    file,
    delim,
    ...
  )
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_csv <- function(x, file, ...) {
  write_csv(
    interlace_channels(x),
    file,
    ...
  )
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_csv2 <- function(x, file, ...) {
  write_csv2(
    interlace_channels(x),
    file,
    ...
  )
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_excel_csv <- function(x, file, ...) {
  write_excel_csv(
    interlace_channels(x),
    file,
    ...
  )
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_excel_csv2 <- function(x, file, ...) {
  write_excel_csv2(
    interlace_channels(x),
    file,
    ...
  )
}

#' @rdname write_interlaced_delim
#' @export
write_interlaced_tsv <- function(x, file, ...) {
  write_tsv(
    interlace_channels(x),
    file,
    ...
  )
}
