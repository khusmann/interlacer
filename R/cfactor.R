# TODO: Make all attr calls exact = TRUE?
# TODO: Add tests that test for construction w names

#' Coded factors
#'
#' TODO: Write this
#'
#' @param x a vector of character or numeric codes
#' @param codes named vector of unique codes that declares the mapping of labels
#' to codes
#' @param ordered logical flag to determine if the codes should be regarded as
#' ordered (in the order given).
#'
#' @returns a new `cfactor`
#'
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

#' @rdname cfactor
#' @export
cordered <- function(x, codes) {
  cfactor(x, codes, ordered = TRUE)
}

#' @rdname cfactor
#' @export
is.cfactor <- function(x) {
  inherits(x, "interlacer_cfactor") && !is.null(codes(x))
}

#' @rdname cfactor
#' @export
is.cordered <- function(x) {
  is.cfactor(x) && is.ordered(x)
}

is.latent.cfactor <- function(x) {
  inherits(x, "interlacer_cfactor") && is.null(codes(x))
}


#' `cfactor` attributes
#'
#' Return the levels or codes of a `cfactor`
#'
#' @param x a `cfactor`
#' @param ... additional arguments (not used)
#'
#' @returns `levels()` returns the levels of the `cfactor` (as a vector of
#' character labels); `codes()` returns a named vector representing the codes
#' for the `cfactor`
#'
#' @export
codes <- function(x, ...) {
  UseMethod("codes")
}

#' @export
codes.default <- function(x, ...) {
  attr(attr(x, "levels"), "codes")
}

#' Set the codes for a `cfactor``
#'
#' Set the codes for a `cfactor`, similar to `levels<-()`
#'
#' @keywords internal
#' @param value a named vector of codes for the `cfactor`
#'
#' @export
`codes<-` <- function(x, value) {
  UseMethod("codes")
}

#' @export
`codes<-.default` <- function(x, value) {
  as.cfactor(x, codes)
}

#' @rdname codes
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

## Casting

#' `cfactor` coercion
#'
#' Add codes to a vector of labels
#'
#' @param x a vector of values representing labels for factor levels
#' @param codes named vector of unique codes that declares the mapping of labels
#' to codes
#' @param ordered logical flag to determine if the codes should be regarded as
#' ordered (in the order given).
#
#' @returns a new `cfactor`
#'
#' @export
as.cfactor <- function(x, codes = NULL, ordered = is.ordered(x)) {
  UseMethod("as.cfactor")
}

#' @export
as.cfactor.default <- function(x, codes = NULL, ordered = is.ordered(x)) {
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

#' @rdname as.cfactor
#' @export
as.cfactor.factor <- function(x, codes = NULL, ordered = is.ordered(x)) {
  if (is.null(codes)) {
    codes <- set_names(
      as.integer(seq_along(levels(x))-1),
      levels(x)
    )
  } else {
    codes <- fix_codes_arg(codes)
    if (!all(levels(x) %in% names(codes))) {
      cli_abort("mismatch between factor levels and code labels")
    }
  }

  new_cfactor_from_labels(x, codes, ordered)
}

#' @importFrom generics as.factor
#' @export
as.factor.interlacer_cfactor <- function(x, ...) {
  attr(attr(x, "levels"), "codes") <- NULL
  class(x) <- discard(class(x), \(v) v == "interlacer_cfactor")
  x
}

#' @rdname as.cfactor
#' @export
as.cordered <- function(x, codes = NULL) {
  UseMethod("as.cordered")
}

#' @export
as.cordered.default <- function(x, codes = NULL) {
  as.cfactor(x, codes, ordered = TRUE)
}

## I used to warn on conversion to double / integer, but this created annoying
## messages with functions like fct_drop() because it uses table() under the
## hood which calls as.integer(). ggplot's geom_histogram() also converts to
## integer
## as.integer.interlacer_cfactor <- ...
## as.double.interlacer_cfactor <- ...

#' Convert a `cfactor` vector into a vector of its codes
#'
#' TODO: Write this
#'
#' @param x a `cfactor()`
#' @param ... additional arguments (not used)
#'
#' @returns a vector of coded values
#'
#' @export
as.codes <- function(x, ...) {
  UseMethod("as.codes")
}

#' @export
as.codes.default <- function(x, ...) {
  cli_abort("{.fn as.codes} not implemented for type {class(x)[[1]]}")
}

#' @rdname as.codes
#' @export
as.codes.interlacer_interlaced <- function(x, ...) {
  as.codes(value_channel(x))
}

#' @rdname as.codes
#' @export
as.codes.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    as.codes(as.factor(x))
  }
  unname(codes(x)[as.character(x)])
}

## Display ---------------------------------------------------------------

#' @export
print.interlacer_cfactor <- function(x, ...) {
  if (is.latent.cfactor(x)) {
    print(as.factor(x), ...)
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
vec_ptype2.interlacer_cfactor.character <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  character()
}

#' @export
vec_ptype2.character.interlacer_cfactor <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  character()
}

#' @export
vec_ptype2.interlacer_cfactor.factor <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  if (is.latent.cfactor(x)) {
    return(vec_ptype2(as.factor(x), y, ..., x_arg = x_arg, y_arg = y_arg))
  }

  if (identical(levels(x), levels(y)) && is.ordered(x) == is.ordered(y)) {
    x
  } else if (!is.ordered(x) && !is.ordered(y)) {
    if (all(levels(y) %in% levels(x))) {
      x
    } else {
      vec_ptype2(as.factor(x), y, x_arg = x_arg, y_arg = y_arg)
    }
  } else {
    stop_incompatible_type(x, y, x_arg = x_arg, y_arg = y_arg)
  }
}

#' @export
vec_ptype2.factor.interlacer_cfactor <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  vec_ptype2.interlacer_cfactor.factor(y, x, ..., y_arg, x_arg)
}

#' @export
vec_ptype2.ordered.interlacer_cfactor <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  vec_ptype2.interlacer_cfactor.factor(y, x, ..., y_arg, x_arg)
}

#' @export
vec_ptype2.interlacer_cfactor.ordered <- function(
  x, y, ..., x_arg = "", y_arg = ""
) {
  vec_ptype2.interlacer_cfactor.factor(x, y, ..., x_arg, y_arg)
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
vec_cast.character.interlacer_cfactor <- function(
  x, to, ..., x_arg = "", to_arg = ""
) {
  as.character(x)
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

#' @export
vec_cast.factor.interlacer_cfactor <- function(
  x, to, ..., x_arg = "", to_arg = ""
) {
  if (is.latent.cfactor(x)) {
    return(vec_cast(as.factor(x), to, ..., x_arg = x_arg, to_arg = to_arg))
  }

  # On the one hand, stripping codes is technically a lossy cast because
  # we lose the codes, but on the other hand, vctrs allows casting from
  # regular factors to character, and you could consider that lossy as well
  # because we lose information captured by the levels() attribute!
  #
  # So I think we interpret "lossy" here in the same way; that is, we're not
  # losing any information in the data (as you do when casting double->int),
  # instead when we lose codes ore levels we're losing information about the
  # *representation* of the data, which we care less about.
  vec_cast(as.factor(x), to, ..., x_arg = x_arg, to_arg = to_arg)
}

#' @export
vec_cast.ordered.interlacer_cfactor <- function(
  x, to, ..., x_arg = "", to_arg = ""
) {
  vec_cast.factor.interlacer_cfactor(x, to, ..., x_arg = x_arg, to_arg = to_arg)
}

#' @export
vec_cast.interlacer_cfactor.factor <- function(
  x, to, ..., x_arg = "", to_arg = ""
) {
  if (is.latent.cfactor(to)) {
    return(vec_cast(x, as.factor(to), ..., x_arg = x_arg, to_arg = to_arg))
  }

  if (
    (identical(levels(x), levels(to)) && (is.ordered(x) == is.ordered(to))) ||
    (!is.ordered(x) && !is.ordered(to) && all(levels(x) %in% levels(to)))
  ) {
    as.cfactor(as.character(x), codes = codes(to), ordered = is.ordered(to))
  } else {
    stop_incompatible_cast(x, to, x_arg = x_arg, to_arg = to_arg)
  }
}

#' @export
vec_cast.interlacer_cfactor.ordered <- function(
  x, to, ..., x_arg = "", to_arg = ""
) {
 vec_cast.interlacer_cfactor.factor(x, to, ..., x_arg = x_arg, to_arg = to_arg)
}
