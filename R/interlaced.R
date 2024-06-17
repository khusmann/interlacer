#' Construct an `interlaced` vector
#'
#' The `interlaced` type extends vectors by adding a "missing reason" channel
#' which can be used to distinguish different types of missingness. The
#' `interlaced()` function constructs a new `interlaced` vector from a vector
#' or list of values.
#'
#' @param x A vector or list of values
#' @param na A vector of values to interpret as missing values
#' @param ... Additional arguments, not used
#'
#' @returns An `interlaced` vector
#'
#' @family interlaced type constructors
#'
#' @export
interlaced <- function(x, na=NULL) {
  if (is.character(na)) {
    na <- factor(na, levels = unique(na))
  }

  m <- na[match(x, na)]
  v <- x
  v[x %in% na] <- NA
  new_interlaced(list_c(v), m)
}

#' @rdname interlaced
#' @export
as.interlaced <- function(x, na = NULL, ...) {
  UseMethod("as.interlaced")
}

#' @rdname interlaced
#' @export
as.interlaced.default <- function(x, na = NULL, ...) {
  interlaced(x, na)
}

#' @rdname interlaced
#' @export
as.interlaced.interlacer_interlaced <- function(x, ...) {
  x
}

#' @rdname interlaced
#' @export
as.interlaced.data.frame <- function(x, ...) {
  x[] <- map(x, \(c) as.interlaced(c, ...))
  x
}

#' @rdname interlaced
#' @export
is.interlaced <- function(x) {
  inherits(x, "interlacer_interlaced")
}

#' Parse a `character` vector into an `interlaced` vector type
#'
#' `parse_interlaced` converts a character vector to an `interlaced` vector
#' by parsing it with a readr `collector` type.
#'
#' @param x A character vector
#' @param na A missing reason collector (e.g. `na_col_integer()`), or one of
#' its shortcuts (e.g. a list of missing values)
#' @param .default A value collector to parse the character values (e.g.
#' `v_col_double()`, `v_col_integer()`, etc.)
#'
#' @returns An `interlaced` vector
#'
#' @export
parse_interlaced <- function(
  x, na,
  .default = v_col_guess()
) {
  if (!is.character(x)) {
    cli_abort("{.arg x} must be a character vector")
  }

  value_collector <- as.value_collector(.default)
  na_collector <- as.na_collector(na)

  v <- value_collector$value_fn(
    type_convert_col(x, value_collector$impl, na = na_collector$chr_values)
  )

  m <- na_collector$values[match(x, na_collector$chr_values)]

  new_interlaced(v, m)
}

new_interlaced <- function(value_channel, na_channel, ...) {
  obj_check_vector(value_channel)
  obj_check_vector(na_channel)

  if (vec_size(value_channel) != vec_size(na_channel)) {
    cli_abort("value_channel and na_channel must be the same size")
  }

  if (any(!is.na(value_channel) & !is.na(na_channel))) {
    cli_abort(
      "value_channel and na_channel cannot simultaneously have valid values"
    )
  }

  if (is.interlaced(value_channel) || is.interlaced(na_channel)) {
    cli_abort("interlaced types cannot be nested")
  }

  if (is.character(na_channel)) {
    na_channel <- vec_cast(na_channel, factor(levels=unique(na_channel)))
  }

  if (is.numeric(na_channel)) {
    na_channel <- vec_cast(na_channel, integer())
  }

  if (
    !is.factor(na_channel) &&
    !is.integer(na_channel) &&
    !inherits(na_channel, "vctrs_unspecified")
  ) {
    cli_abort("na_channel must be factor or integer")
  }

  v <- new_vctr(
    value_channel,
    na_channel_values = na_channel,
    class = "interlacer_interlaced"
  )

  for (i in names(attributes(value_channel))) {
    if (i != "class") {
      if (!is.null(attr(v, i))) {
        cli_abort("attribute {i} in value vector conflicts with interlaced")
      }
      attr(v, i) <- attr(value_channel, i)
    }
  }

  if (!inherits(value_channel, "vctrs_unspecified")) {
    class(v) <- c(class(v), class(value_channel))
  }

  v
}

#' Lift values to missing reasons
#'
#' `na()` lifts a value into an `interlaced` missing reason channel.
#'
#' @param x A character or numeric value
#'
#' @returns An `interlaced` value
#'
#' @family interlaced type constructors
#'
#' @export
na <- function(x = unspecified()) {
  if (is.logical(x) && all(is.na(x))) {
    x <- unspecified(vec_size(x))
  }
  new_interlaced(unspecified(vec_size(x)), x)
}

#' Access the channels of an `interlaced` vector
#'
#' * `value_channel()` returns the value channel of an `interlaced` vector
#' * `na_channel()` returns the missing reason channel of an `interlaced` vector
#'
#' @param x An `interlaced` vector
#' @param ... Additional arguments, not used
#'
#' @returns The value or missing reasons channel
#'
#' @family interlaced type functions
#'
#' @export
value_channel <- function(x, ...) {
  UseMethod("value_channel")
}

#' @export
value_channel.default <- function(x, ...) {
  x
}

#' @export
value_channel.interlacer_interlaced <- function(x, ...) {
  attr(x, "na_channel_values") <- NULL
  cls <- class(x)
  cls_idx <- match("vctrs_vctr", cls)
  if (cls_idx == length(cls)) {
    # When this uses vec_size(), it generates a stack overflow...
    x <- unspecified(length(x))
  } else {
    class(x) <- cls[(cls_idx+1):length(cls)]
  }
  x
}

#' @export
value_channel.data.frame <- function(x, ...) {
  x[] <- map(x, value_channel)
  x
}

#' @rdname value_channel
#' @export
na_channel <- function(x, ...) {
  UseMethod("na_channel")
}

#' @export
na_channel.default <- function(x, ...) {
  unspecified(vec_size(x))
}

#' @export
na_channel.interlacer_interlaced <- function(x, ...) {
  attr(x, "na_channel_values")
}

#' @export
na_channel.data.frame <- function(x, ...) {
  x[] <- map(x, na_channel)
  x
}

#' Flatten a `interlaced` vector
#'
#' `flatten_channels()` flattens an `interlaced` vector into a single channel.
#' This is useful as a step right before writing an `interlaced` vector to a
#' file, for example.
#'
#' @param x An `interlaced` vector
#' @param ... Additional arguments, not used
#'
#' @returns The vector, flattened
#'
#' @family interlaced type functions
#'
#' @export
flatten_channels <- function(x, ...) {
  UseMethod("flatten_channels")
}

#' @export
flatten_channels.default <- function(x, ...) {
  x
}

#' @export
flatten_channels.data.frame <- function(x, ...) {
  x[] <- map(x, flatten_channels)
  x
}

#' @export
flatten_channels.interlacer_interlaced <- function(x, ...) {
  v <- value_channel(x)
  m <- na_channel(x)

  if (all(is.na(m))) {
    return(v)
  }

  if (!(is.numeric(v) && is.numeric(m)) && !(is.factor(v) && is.factor(m))) {
    v <- as.character(v)
    m <- as.character(m)
  }

  if (is.ordered(v)) {
    class(v) <- discard(class(v), \(x) x == "ordered")
  }

  if (is.ordered(m)) {
    class(m) <- discard(class(m), \(x) x == "ordered")
  }

  if (is.cfactor(v) && !is.cfactor(m) && is.factor(m)) {
    v <- as.factor(v)
  }

  if (is.cfactor(m) && !is.cfactor(v) && is.factor(v)) {
    m <- as.factor(m)
  }

  isect <- na.omit(intersect(v, m))
  if (length(isect) > 0) {
    cli_abort("value and na channels have items that overlap: {isect}")
  }

  if_else(!is.na(v), v, m)
}

# Functional utilities ----------------------------------------------------

#' `interlaced` functional utilities
#'
#' `map_value_channel()` modifies the values of an `interlaced`
#' vector. `map_na_channel()` modifies the missing reason channel of an
#' `interlaced` vector.
#'
#' @param x an interlaced vector
#' @param fn a function that maps values or missing reasons to new values
#'
#' @returns a new interlaced vector, modified according to the supplied function
#'
#' @family interlaced type functions
#'
#' @export
map_value_channel <- function(x, fn) {
  new_interlaced(
    fn(value_channel(x)),
    na_channel(x)
  )
}


#' @rdname map_value_channel
#' @export
map_na_channel <- function(x, fn) {
  new_interlaced(
    value_channel(x),
    fn(na_channel(x))
  )
}

# Utility helper, not exported
bimap_interlaced <- function(x, fn) {
  new_interlaced(
    fn(value_channel(x)),
    fn(na_channel(x))
  )
}

bimap2_interlaced <- function(x, y, fn) {
  new_interlaced(
    fn(value_channel(x), value_channel(y)),
    fn(na_channel(x), na_channel(y)),
  )
}

# Display ---------------------------------------------------------------

#' @export
vec_ptype_full.interlacer_interlaced <- function(x, ...) {
  paste0(
    "interlaced<",
    vec_ptype_abbr(value_channel(x)),
    ", ",
    vec_ptype_abbr(na_channel(x)),
    ">"
  )
}

#' @export
vec_ptype_abbr.interlacer_interlaced <- function(x, ...) {
  paste0(vec_ptype_abbr(value_channel(x)), ",", vec_ptype_abbr(na_channel(x)))
}

#' @export
format.interlacer_interlaced <- function(x, ...) {
  map_chr(x, function(i) {
    if (is.empty(i)) {
      return(paste0("<<", format(na_channel(i)), ">>"))
    }
    if (is.na(i)) {
      return(paste0("<", format(na_channel(i)), ">"))
    }
    format(value_channel(i))
  })
}

#' @export
obj_print_footer.interlacer_interlaced <- function(x, ...) {
  if (!is.null(levels(x))) {
    cat("Levels:", paste(levels(x), collapse = " "), "\n")
  }
  if (!is.null(na_levels(x))) {
    cat("NA levels:", paste(na_levels(x), collapse = " "), "\n")
  }
}

style_empty <- function(x) {
  cli::col_blue(x)
}

#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.interlacer_interlaced <- function(x, ...) {
  v <- pillar_shaft(value_channel(x), ...)
  m <- pillar_shaft(na_channel(x), ...)

  width <- max(attr(v, "width"), attr(m, "width"))

  if (!is.null(attr(v, "min_width")) || !is.null(attr(v, "min_width"))) {
    min_width <- max(attr(v, "min_width"), attr(m, "min_width"))
  } else {
    min_width <- NULL
  }

  pillar::new_pillar_shaft(
    list(
      v = v,
      m = m,
      empty = is.empty(x),
      na = is.na(x)
    ),
    width = width,
    min_width = min_width,
    class = "interlacer_interlaced_pillar"
  )
}

#' @export
format.interlacer_interlaced_pillar <- function(x, width, ...) {
  out <- format(x$v, width, ...)
  out_na <- ansi_strip(format(x$m, width, ...))

  out[x$na] <- pillar::style_na(paste0("<", trimws(out_na[x$na]), ">"))
  out[x$empty] <- style_empty(paste0("<<", trimws(out_na[x$empty]), ">>"))

  out
}

# Proxies --------------------------------------------------------------

#' @export
vec_proxy.interlacer_interlaced <- function(x, ...) {
  data_frame(
    v = value_channel(x),
    m = na_channel(x),
  )
}

#' @export
vec_restore.interlacer_interlaced <- function(x, to, ...) {
  new_interlaced(x$v, x$m)
}

#' @export
vec_proxy_equal.interlacer_interlaced <- function(x, ...) {
  map(x, function(i) {
    if (is.empty(i)) {
      return(NULL)
    } else {
      as.list(i)
    }
  })
}

#' @export
vec_proxy_compare.interlacer_interlaced <- function(x, ...) {
  value_channel(x)
}

#' @export
vec_proxy_order.interlacer_interlaced <- function(x, ...) {
  vec_proxy(x)
}


# Subsetting --------------------------------------------------------------

#' @export
`[.interlacer_interlaced` <-  function(x, i, ...) {
  if (!missing(...)) {
    cli_abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  i <- maybe_missing(i, TRUE)
  bimap_interlaced(x, \(v) v[i])
}

#' @export
`[[.interlacer_interlaced` <- function(x, i, ...) {
  if (!missing(...)) {
    cli_abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  bimap_interlaced(x, \(v) v[[i]])
}

#' @export
`$.interlacer_interlaced` <- function(x, i, ...) {
  stop_unsupported(x, "subsetting with $")
}

#' @export
`[<-.interlacer_interlaced` <- function(x, i, ..., value) {
  if (!missing(...)) {
    cli_abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  bimap2_interlaced(x, value, \(v, new_v) `[<-`(v, i, value=new_v))
}

#' @export
`[[<-.interlacer_interlaced` <- function(x, i, ..., value) {
  if (!missing(...)) {
    cli_abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  bimap2_interlaced(x, value, \(v, new_v) `[[<-`(v, i, value=new_v))
}

#' @export
`$<-.interlacer_interlaced` <- function(x, i, value) {
  stop_unsupported(x, "subset assignment with $")
}

# Misc -----------------------------------------------------------

#' @export
rep.interlacer_interlaced <- function(x, ...) {
  bimap_interlaced(x, \(v) rep(v, ...))
}

#' @export
`length<-.interlacer_interlaced` <- function(x, value) {
  bimap_interlaced(x, \(v) `length<-`(v, value))
}

#' Get the factor levels of the value or missing reason channel
#'
#' The base S3 `levels()` function is overloaded for `interlaced` vectors, so
#' when the value channel is a factor type, `levels()` will return its levels.
#' Similarly `na_levels()` will return the levels for the missing reason
#' channel, when it is a `factor` type.
#'
#' @param x an `interlaced` vector
#' @param value new levels to set
#'
#' @returns The levels of the values or missing reason channel
#'
#' @export
na_levels <- function(x) {
  levels(na_channel(x))
}

#' @rdname na_levels
#' @export
`na_levels<-` <- function(x, value) {
  map_na_channel(x, \(v) `levels<-`(v, value))
}

#' @rdname na_levels
#' @export
levels.interlacer_interlaced <- function(x) {
  levels(value_channel(x))
}

#' @rdname na_levels
#' @export
`levels<-.interlacer_interlaced` <- function(x, value) {
  map_value_channel(x, \(v) `levels<-`(v, value))
}


# NA functions ---------------------------------------------------------

#' NA missing reasons
#'
#' When a value is missing both a value and a missing reason, it is considered
#' "empty". `is.empty()` checks for these type of values. Regular `NA` values
#' (with no missing reasons) are also considered "empty".
#'
#' @param x a vector
#'
#' @returns a logical vector the same length as x, containing TRUE for all
#' empty elements, and FALSE otherwise.
#'
#' @family interlaced type functions
#'
#' @export
is.empty <- function(x) {
  UseMethod("is.empty")
}

#' @export
is.empty.default <- function(x) {
  is.na(x)
}

#' @export
is.empty.interlacer_interlaced <- function(x) {
  is.na(value_channel(x)) & is.na(na_channel(x))
}

# TODO: Remove these if not inheriting from vctrs_vctr

#' @export
is.na.interlacer_interlaced <- function(x) {
  is.na(value_channel(x))
}

#' @importFrom stats na.omit
#' @export
na.omit.interlacer_interlaced <- function(object, ...) {
  na.omit(value_channel(object), ...)
}

#' @importFrom stats na.exclude
#' @export
na.exclude.interlacer_interlaced <- function(object, ...) {
  na.exclude(value_channel(object), ...)
}

#' @importFrom stats na.fail
#' @export
na.fail.interlacer_interlaced <- function(object, ...) {
  na.fail(value_channel(object), ...)
}

# Comparison & Order ----------------------------------------------------

# Min, max, and range, etc. have to be redefined here because they are
# implemented in the original vctrs_vctr by finding the index of the desired
# value, then returning the vctr indexed at that location. Problem is, this
# causes it to sometimes return na(Reason)s instead of a base NA when na.rm=F

#' @export
min.interlacer_interlaced <- function(x, ...) {
  min(value_channel(x), ...)
}

#' @export
max.interlacer_interlaced <- function(x, ...) {
  max(value_channel(x), ...)
}

#' @export
range.interlacer_interlaced <- function(x, ...) {
  range(value_channel(x), ...)
}

#' @importFrom stats median
#' @export
median.interlacer_interlaced <- function(x, ...) {
  median(value_channel(x), ...)
}

#' @importFrom stats quantile
#' @export
quantile.interlacer_interlaced <- function(x, ...) {
  quantile(value_channel(x), ...)
}

#' @export
xtfrm.interlacer_interlaced <- function(x) {
  xtfrm(value_channel(x))
}

# Math / Arith  -------------------------------------------------------

#' @export
vec_math.interlacer_interlaced <- function(.fn, .x, ...) {
  vec_math(.fn, value_channel(.x), ...)
}

#' @export
#' @method vec_arith interlacer_interlaced
vec_arith.interlacer_interlaced <- function(op, x, y, ...) {
  UseMethod("vec_arith.interlacer_interlaced", y)
}

arith_unwrap <- function(op, x, y, ...) {
  vec_arith(op, value_channel(x), value_channel(y))
}

#' @export
#' @method vec_arith.interlacer_interlaced default
vec_arith.interlacer_interlaced.default <- arith_unwrap

#' @export
#' @method vec_arith.interlacer_interlaced interlacer_interlaced
vec_arith.interlacer_interlaced.interlacer_interlaced <- arith_unwrap

##

#' @export
#' @method vec_arith.numeric interlacer_interlaced
vec_arith.numeric.interlacer_interlaced <- arith_unwrap

#' @export
#' @method vec_arith.logical interlacer_interlaced
vec_arith.logical.interlacer_interlaced <- arith_unwrap

# Coercion ----------------------------------------------------------------

vec_ptype2_interlaced <- function(x, y, ...) {
  bimap2_interlaced(x, y, vec_ptype2)
}

#' @export
vec_ptype2.interlacer_interlaced.character <- vec_ptype2_interlaced

#' @export
vec_ptype2.interlacer_interlaced.double <- vec_ptype2_interlaced

#' @export
vec_ptype2.interlacer_interlaced.integer <- vec_ptype2_interlaced

#' @export
vec_ptype2.interlacer_interlaced.logical <- vec_ptype2_interlaced

#' @export
vec_ptype2.interlacer_interlaced.factor <- vec_ptype2_interlaced

#######

#' @export
vec_ptype2.interlacer_interlaced.interlacer_interlaced <- vec_ptype2_interlaced

#######

#' @export
vec_ptype2.character.interlacer_interlaced <- vec_ptype2_interlaced

#' @export
vec_ptype2.integer.interlacer_interlaced <- vec_ptype2_interlaced

#' @export
vec_ptype2.double.interlacer_interlaced <- vec_ptype2_interlaced

#' @export
vec_ptype2.logical.interlacer_interlaced <- vec_ptype2_interlaced

#' @export
vec_ptype2.factor.interlacer_interlaced <- vec_ptype2_interlaced

# Casting -----------------------------------------------------------------

cast_lift <- function(x, to, ...) {
  bimap2_interlaced(x, to, vec_cast)
}

#' @export
vec_cast.interlacer_interlaced.character <- cast_lift

#' @export
vec_cast.interlacer_interlaced.double <- cast_lift

#' @export
vec_cast.interlacer_interlaced.integer <- cast_lift

#' @export
vec_cast.interlacer_interlaced.logical <- cast_lift

#' @export
vec_cast.interlacer_interlaced.factor <- cast_lift

####

#' @export
vec_cast.interlacer_interlaced.interlacer_interlaced <- cast_lift

####

cast_unwrap <- function(x, to, ...) {
  vec_cast(value_channel(x), to, ...)
}

#' @export
vec_cast.character.interlacer_interlaced <- cast_unwrap

#' @export
vec_cast.double.interlacer_interlaced <- cast_unwrap

#' @export
vec_cast.integer.interlacer_interlaced <- cast_unwrap

#' @export
vec_cast.logical.interlacer_interlaced <- cast_unwrap

#' @export
vec_cast.factor.interlacer_interlaced <- cast_unwrap

# Override misc operations carried from vctrs_vctr that cause problems
#
# TODO: Maybe we should move away from vctrs_vctr so it more reliably uses
# the functions for the base type?

#' @export
is.infinite.interlacer_interlaced <- function(x, ...) {
  is.infinite(value_channel(x), ...)
}

#' @export
is.finite.interlacer_interlaced <- function(x, ...) {
  is.finite(value_channel(x), ...)
}

#' @export
as.logical.interlacer_interlaced <- function(x, ...) {
  as.logical(value_channel(x), ...)
}

#' @export
as.character.interlacer_interlaced <- function(x, ...) {
  as.character(value_channel(x), ...)
}

#' @export
as.integer.interlacer_interlaced <- function(x, ...) {
  as.integer(value_channel(x), ...)
}

#' @export
as.double.interlacer_interlaced <- function(x, ...) {
  as.double(value_channel(x), ...)
}

#' @importFrom generics as.factor
#' @export
generics::as.factor

#' @export
as.factor.interlacer_interlaced <- function(x, ...) {
  as.factor(value_channel(x), ...)
}

#' @importFrom generics as.ordered
#' @export
generics::as.ordered

#' @export
as.ordered.interlacer_interlaced <- function(x, ...) {
  as.ordered(value_channel(x), ...)
}

# Tidy helpers

#' @export
where_value_channel <- function(fn) {
  tidyselect::where(\(x) fn(value_channel(x)))
}

#' @export
where_na_channel <- function(fn) {
  tidyselect::where(\(x) fn(na_channel(x)))
}

#' @export
across_value_channels <- function(.cols, .fns, .names = NULL, .unpack = FALSE) {
  across_lift(map_value_channel, {{.cols}}, {{.fns}}, .names, .unpack)
}

#' @export
across_na_channels <- function(.cols, .fns, .names = NULL, .unpack = FALSE) {
  across_lift(map_na_channel, {{.cols}}, {{.fns}}, .names, .unpack)
}

across_lift <- function(
  lift_fn, .cols, .fns, .names, .unpack, error_call = caller_env()
) {
  .fns <- eval_tidy({{.fns}})

  do_lift <- function(x) {
    if (is_formula(x) || is_function(x)) {
      \(w) lift_fn(w, as_function(x, arg = ".fns", call = error_call))
    } else {
      abort(
        "`.fns` must be a function, a formula, or a list of functions/formulas.",
        call = error_call
      )
    }
  }

  if (is_list(.fns)) {
    wrapped_fns <- map(.fns, do_lift)
  } else {
    wrapped_fns <- do_lift(.fns)
  }

  dplyr::across({{.cols}}, wrapped_fns, .names = .names, .unpack = .unpack)
}

# Helpers -----------------------------------------------------------------

stop_unsupported <- function(x, method) {
  cli_abort("`{method}.{class(x)[[1]]}()` not supported.")
}
