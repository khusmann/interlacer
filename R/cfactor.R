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

# TODO: Make all attr calls exact = TRUE

#' @export
cfactor <- function(x=unspecified(), codes, ordered = FALSE) {
  obj_check_vector(x)

  codes <- fix_codes_arg(codes)

  if (is.factor(x)) {
    cli_abort(
      "add codes to factors using {.fn as.cfactor} instead"
    )
  }

  if (length(setdiff(na.omit(x), codes)) > 0) {
    cli_abort("some values in {.arg x} are not valid codes")
  }

  new_cfactor_from_codes(x, codes, ordered)
}

new_cfactor_from_codes <- function(x, codes, ordered) {
  x_labels <- set_names(names(codes), codes)[x]
  new_cfactor_from_labels(x_labels, codes, ordered)
}

new_cfactor_from_labels <- function(x, codes, ordered) {
  v <- factor(x, levels = names(codes), ordered = ordered)
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

  if (is.numeric(codes) && !identical(codes, sort(codes))) {
    cli_warn("codes are not in numerical order")
  }

  codes
}

#' @export
is.cfactor <- function(x) {
  inherits(x, "interlacer_cfactor")
}

#' @export
is.latent.cfactor <- function(x) {
  is.cfactor(x) && is.null(codes(x))
}

#' @export
levels.interlacer_cfactor <- function(x) {
  lvls <- attr(x, "levels")
  attributes(lvls) <- NULL
  lvls
}

#' @export
`levels<-.interlacer_cfactor` <- function(x, value) {
  x <- as.factor(x)
  levels(x) <- value
  x
}

#' @export
codes <- function(x, ...) {
  UseMethod("codes")
}

#' @export
codes.default <- function(x) {
  attr(attr(x, "levels"), "codes")
}

#' @export
set_codes <- function(x, value) {
  codes(x) <- value
  x
}

#' @export
`codes<-` <- function(x, value) {
  UseMethod("codes<-")
}

#' @export
`codes<-.default` <- function(x, value) {
  as.cfactor(x, value)
}

#' @export
`codes<-.cfactor` <- function(x, value) {
  if (is.null(value)) {
    as.factor(x)
  } else {
    as.cfactor(x, value)
  }
}


## Casting

#' @export
as.cfactor <- function(x, ...) {
  UseMethod("as.cfactor")
}

#' @export
as.cfactor.default <- function(x, codes = NULL, ordered = is.ordered(x)) {
  if (is.null(codes)) {
    codes <- set_names(seq_along(unique(na.omit(x))), unique(na.omit(x)))
  } else {
    codes <- fix_codes_arg(codes)
    if (length(setdiff(na.omit(x), names(codes))) > 0) {
      cli_abort("some values in {.arg x} are not valid codes")
    }
  }

  new_cfactor_from_labels(x, codes, ordered)
}

#' @export
as.cfactor.factor <- function(x, codes = NULL, ordered = is.ordered(x)) {
  if (is.null(codes)) {
    codes <- set_names(seq_along(levels(x)), levels(x))
  } else {
    codes <- fix_codes_arg(codes)
    if (!setequal(levels(x), names(codes))) {
      cli_abort("mismatch between factor levels and code labels")
    }
  }

  new_cfactor_from_labels(x, codes, ordered)
}

#' @importFrom generics as.factor
#' @export
as.factor.interlacer_cfactor <- function(x, ...) {
  if (is.cfactor(x)) {
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
  UseMethod("as.codes")
}

#' @export
as.codes.data.frame <- function(df, ...) {
  df[] <- map(df, \(c) as.codes(c, ...))
  df
}

#' @export
as.codes.interlacer_interlaced <- function(x, ...) {
  bimap_interlaced(x, as.codes)
}

#' @export
as.codes.default <- function(x, ...) {
  x
}

#' @export
as.codes.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    return(x)
  }

  unname(codes(x)[as.character(x)])
}

## Display ---------------------------------------------------------------

#' @export
print.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    NextMethod()
  } else {
    obj_print(x, ...)
  }
}

#' @export
vec_ptype_full.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    vec_ptype_full(as.factor(x))
  } else {
    paste0(
      "cfactor<",
      vec_ptype_full(codes(x)),
      ">"
    )
  }
}

#' @export
vec_ptype_abbr.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    vec_ptype_abbr(as.factor(x))
  } else {
    "cfct"
  }
}

#' @importFrom pillar type_sum
#' @export
type_sum.interlacer_cfactor <- function(x) {
  vec_ptype_abbr(x)
}

#' @export
obj_print_footer.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    obj_print_footer(as.factor(x))
  } else {
    lvls <- data.frame(
      label = levels(x),
      code = codes(x)
    )

    if (is.ordered(x)) {
      cat("\nOrdinal levels:\n")
    } else {
      cat("\nCategorical levels:\n")
    }

    print(lvls, row.names=FALSE)

    invisible(x)
  }
}
