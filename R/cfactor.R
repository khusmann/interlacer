# cfactor(codes = c(OMITTED = ".", REFUSED = ".a")) -> na_col_cfactor_chr(na_codes=c(OMITTED = ".", REFUSED = ".a"))
# cfactor(codes = c(OMITTED = -99L, REFUSED = -98L)) -> na_col_cfactor_int(na_codes=c(OMITTED = -99L, REFUSED = -98L))
# cfactor(codes = c(OMITTED = -99, REFUSED = -98)) -> na_col_cfactor_dbl(na_codes=c(OMITTED = -99, REFUSED = -98))
#
# c("OMITTED", "REFUSED") -> na_col_character(na=c("OMITTED", "REFUSED"))
# c(-99, -98) -> na_col_numeric(na=c(-99, -98))
# c(-99L, -98L) -> na_col_integer(na=c(-99L, -98L))
# factor(levels = c("OMITTED", "REFUSED")) -> na_col_factor(na_levels=c("OMITTED", "REFUSED"))
#
# na = na_cols(
#   person_id = c(-98, -99),
#   favorite_color = factor(levels = c("OMITTED", "REFUSED")),
#   favorite_color = cfactor(codes = c(OMITTED = -99, REFUSED = -98)),
#   .default = c(-99, -98)
# )
#
# na = na_cols_only(
#   favorite_color = factor(levels = c("OMITTED", "REFUSED"))
# )
#

#' @export
cfactor <- function(x=unspecified(), codes, ordered = FALSE) {
  obj_check_vector(x)

  codes <- fix_codes_arg(codes)

  if (length(setdiff(na.omit(x), codes)) > 0) {
    cli_abort("some values in {.arg x} are not valid codes")
  }

  v <- factor(x, codes, names(codes), ordered = ordered)

  attr(attr(v, "levels"), "codes") <- codes

  class(v) <- c("interlacer_cfactor", class(v))

  v
}

fix_codes_arg <- function(codes) {
  # TODO: Don't allow NA levels / codes

  if (is.null(names(codes))) {
    cli_abort("codes are missing labels")
  }

  empty_labels <- names(codes) == ""
  names(codes)[empty_labels] <- codes[empty_labels]

  if (is.numeric(codes)) {
    codes[] <- vec_cast(codes, integer())
  }

  if (length(codes) != length(unique(codes))) {
    cli_abort("codes are not unique")
  }

  if (length(names(codes)) != length(unique(names(codes)))) {
    cli_abort("labels are not unique")
  }

  codes
}

#' @export
is.cfactor <- function(x) {
  inherits(x, "interlacer_cfactor") && !is.null(codes(x))
}

#' @export
levels.interlacer_cfactor <- function(x) {
  lvls <- attr(x, "levels")
  attributes(lvls) <- NULL
  lvls
}

#' @export
codes <- function(x) {
  attr(attr(x, "levels"), "codes")
}

#' @export
`codes<-` <- function(x, new_codes) {
  as.cfactor(x, new_codes)
}

#' @export
print.interlacer_cfactor <- function(x, ...) {
  if (is.cfactor(x)) {
    obj_print(x, ...)
  } else {
    NextMethod()
  }
}

## Casting

#' @export
as.cfactor <- function(x, ...) {
  UseMethod("as.cfactor")
}

#' @export
as.cfactor.default <- cfactor

#' @export
as.cfactor.factor <- function(x, codes, ordered = is.ordered(x)) {
  codes <- fix_codes_arg(codes)

  if (!setequal(levels(x), names(codes))) {
    cli_abort("mismatch between factor levels and supplied codes")
  }

  attr(attr(x, "levels"), "codes") <- codes

  if (!inherits(x, "interlacer_cfactor")) {
    class(x) <- c("interlacer_cfactor", class(x))
  }

  x
}

#' @importFrom generics as.factor
#' @export
as.factor.interlacer_cfactor <- function(x, ...) {
  if (inherits(x, "interlacer_cfactor")) {
    attr(attr(x, "levels"), "codes") <- NULL
    class(x) <- class(x)[-1]
  }
  x
}

#' @export
as.double.interlacer_cfactor <- function(x, ...) {
  if (is.cfactor(x)) {
    stop_incompatible_cast(
      x,
      double(),
      x_arg = "",
      to_arg = "",
      details = "To obtain a coded representation, use as.codes() instead."
    )
  } else {
    NextMethod()
  }
}

#' @export
as.integer.interlacer_cfactor <- function(x, ...) {
   if (is.cfactor(x)) {
     stop_incompatible_cast(
      x,
      integer(),
      x_arg = "",
      to_arg = "",
      details = "To obtain a coded representation, use as.codes() instead."
    )
  } else {
    NextMethod()
  }
}

#' @export
as.codes <- function(x, ...) {
  if (is.null(codes(x))) {
    cli_abort("no codes avilable")
  }
  unname(codes(x)[as.character(x)])
}

## Display ---------------------------------------------------------------

#' @export
vec_ptype_full.interlacer_cfactor <- function(x, ...) {
  if (is.cfactor(x)) {
    paste0(
      "cfactor<",
      vec_ptype_full(codes(x)),
      ">"
    )
  } else {
    vec_ptype_full(as.factor(x))
  }
}

#' @export
vec_ptype_abbr.interlacer_cfactor <- function(x, ...) {
  "cfct"
}

#' @importFrom pillar type_sum
#' @export
type_sum.interlacer_cfactor <- function(x) {
  vec_ptype_abbr(x)
}

#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.interlacer_cfactor <- function(x, ...) {
  items <- paste0(
    as.character(x), pillar::style_subtle(paste0(" [", as.codes(x), "]"))
  )
  pillar::new_pillar_shaft_simple(items, align = "left")
}


#' @export
obj_print_footer.interlacer_cfactor <- function(x, ...) {
  if (all(levels(x) == codes(x))) {
    return(obj_print_footer(as.factor(x)))
  }

  lvls <- data.frame(
    label = levels(x),
    code = codes(x)
  )

  cat("\nLevels:\n")
  print(lvls, row.names=FALSE)

  invisible(x)
}
