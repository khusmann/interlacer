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
# TODO: Add vec_cast and vec_ptype2 fns
# TODO: Add tests that test for construction w names

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
  x_labels <- set_names(names(codes), codes)[as.character(x)]
  new_cfactor_from_labels(set_names(x_labels, names(x)), codes, ordered)
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
    codes <- set_names(vec_cast(codes, integer()), names(codes))
  }

  if (length(codes) != length(unique(codes))) {
    cli_abort("codes are not unique")
  }

  if (length(names(codes)) != length(unique(names(codes)))) {
    cli_abort("labels are not unique")
  }

  # We don't warn or error on unsorted codes because it allows users
  # to construct factors for graphing with missing values all at the
  # end, etc.

  codes
}

#' @export
is.cfactor <- function(x) {
  inherits(x, "interlacer_cfactor")
}

#' @export
is.cordered <- function(x) {
  is.cfactor(x) && is.ordered(x)
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
codes.default <- function(x, ...) {
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
as.cfactor <- function(x, codes = NULL, ordered = is.ordered(x)) {
  UseMethod("as.cfactor")
}

#' @export
as.cfactor.default <- function(x, codes, ordered) {
  obj_check_vector(x)

  if (is.null(codes)) {
    codes <- set_names(
      as.integer(seq_along(unique(na.omit(x)))-1),
      unique(na.omit(x))
    )
  } else {
    codes <- fix_codes_arg(codes)
    if (length(setdiff(na.omit(x), names(codes))) > 0) {
      cli_abort("some values in {.arg x} are not valid labels")
    }
  }

  new_cfactor_from_labels(x, codes, ordered)
}

#' @export
as.cfactor.factor <- function(x, codes, ordered) {
  if (is.null(codes)) {
    codes <- set_names(
      as.integer(seq_along(levels(x))-1),
      levels(x)
    )
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
  if (is.numeric(codes(x))) {
    cli_warn(c(
      "Converting cfactor to double: values will not necessarily match codes",
      i = "To obtain a coded representation, use as.codes() instead."
    ))
  }
  NextMethod()
}

#' @export
as.integer.interlacer_cfactor <- function(x, ...) {
  if (is.numeric(codes(x))) {
    cli_warn(c(
      "Converting cfactor to integer: values will not necessarily match codes",
      i = "To obtain a coded representation, use as.codes() instead."
    ))
  }
  NextMethod()
}

#' @export
as.codes <- function(x, ...) {
  UseMethod("as.codes")
}

#' @export
as.codes.data.frame <- function(x, ...) {
  x[] <- map(x, \(c) as.codes(c, ...))
  x
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
    prefix <- if (is.ordered(x)) "cordered" else "cfactor"
    paste0(
      prefix,
      "<",
      vec_ptype_abbr(codes(x)),
      "+",
      hash_label(codes(x)),
      ">"
    )
  }
}

#' @export
vec_ptype_abbr.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    vec_ptype_abbr(as.factor(x))
  } else {
    if (is.ordered(x)) {
      "cord"
    } else {
      "cfct"
    }
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

code_label_pairs <- function(x_codes) {
  map(seq_along(x_codes), function(i) {
    list(names(x_codes)[[i]], x_codes[[i]])
  })
}

#' @export
vec_ptype2.interlacer_cfactor.interlacer_cfactor <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  if (is.latent.cfactor(x) || is.latent.cfactor(y)) {
    return(
      vec_ptype2(as.factor(x), as.factor(y), x_arg = x_arg, y_arg = y_arg)
    )
  }

  x_codes <- codes(x)
  y_codes <- codes(y)

  if (identical(x_codes, y_codes) && is.ordered(x) == is.ordered(y)) {
    x
  } else if (!is.ordered(x) && !is.ordered(y)) {
    x_pairs <- code_label_pairs(x_codes)
    y_pairs <- code_label_pairs(y_codes)

    all_pairs <- unique(c(x_pairs, y_pairs))

    new_codes <- set_names(
      list_c(map(all_pairs, \(v) v[[2]])),
      map_chr(all_pairs, \(v) v[[1]])
    )

    if (
      length(unique(new_codes)) != length(new_codes) ||
      length(unique(names(new_codes))) != length(names(new_codes))
    ) {
      stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
    } else {
      cfactor(codes = new_codes, ordered = FALSE)
    }
  } else {
    stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
  }
}

#' @export
vec_cast.interlacer_cfactor.interlacer_cfactor <- function(
  x, to, ..., x_arg = "", to_arg = ""
) {
  if (is.latent.cfactor(x)) {
    stop_incompatible_cast(as.factor(x), to, x_arg = x_arg, to_arg = to_arg)
  }

  if (is.latent.cfactor(to)) {
    return(
      vec_cast(x, as.factor(to), x_arg = x_arg, to_arg = to_arg)
    )
  }

  x_codes <- codes(x)
  to_codes <- codes(to)

  x_pairs <- code_label_pairs(x_codes)
  to_pairs <- code_label_pairs(to_codes)

  if (length(setdiff(x_pairs, to_pairs)) != 0) {
    stop_incompatible_cast(x, to, x_arg = x_arg, to_arg = to_arg)
  }

  cfactor(as.codes(x), to_codes, is.ordered(to))
}
