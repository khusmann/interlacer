#' @export
parse_interlaced <- function(
  x, na,
  .value_col = col_guess(),
  .na_col = col_guess()
) {
  sc <- split_channels(x, na)
  new_interlaced(
    type_convert_col(sc$value_channel, .value_col),
    type_convert_col(sc$na_channel, .na_col)
  )
}

split_channels <- function(x, na) {
  x_is_na <- x %in% na
  list(
    value_channel = if_else(x_is_na, unspecified(1), x),
    na_channel = if_else(x_is_na, x, unspecified(1))
  )
}

type_convert_col <- function(x, col) {
  readr::type_convert(tibble(x), col_types = list(x = col))$x
}

#' @export
interlaced <- function(x, na=NULL) {
  sc <- split_channels(x, na)
  new_interlaced(sc$value_channel, sc$na_channel)
}

#' @export
#' TODO: change to "value_channel" and "na_channel"
new_interlaced <- function(x, na_values, ...) {
  obj_check_vector(x)
  obj_check_vector(na_values)

  if (vec_size(x) != vec_size(na_values)) {
    cli_abort("values and na_values must be the same size")
  }

  if (any(!is.na(x) & !is.na(na_values))) {
    cli_abort("values and na_values cannot simultaneously have valid values")
  }

  if (is.interlaced(x) || is.interlaced(na_values)) {
    cli_abort("interlaced types cannot be nested")
  }

  v <- new_vctr(
    x,
    na_values = na_values,
    class = "interlacer_interlaced"
  )

  for (i in names(attributes(x))) {
    if (i != "class") {
      if (!is.null(attr(v, i))) {
        cli_abort("attribute {i} in value vector conflicts with interlaced")
      }
      attr(v, i) <- attr(x, i)
    }
  }

  if (!inherits(x, "vctrs_unspecified")) {
    class(v) <- c(class(v), class(x))
  }

  v
}

as.interlaced <- function(x) {
  new_interlaced(
    value_channel(x),
    na_channel(x)
  )
}

is.interlaced <- function(x) {
  inherits(x, "interlacer_interlaced")
}

#' @export
value_channel <- function(x, ...) {
  UseMethod("value_channel")
}

#' @export
value_channel.default <- function(x, ...) {
  x
}

#' @export
value_channel.interlacer_interlaced <- function(x) {
  attr(x, "na_values") <- NULL
  cls <- class(x)
  cls_idx <- match("vctrs_vctr", cls)
  if (cls_idx == length(cls)) {
    x <- unspecified(length(x))
  } else {
    class(x) <- cls[(cls_idx+1):length(cls)]
  }
  x
}

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
  for (i in names(x)) {
    x[[i]] <- flatten_channels(x[[i]])
  }
  x
}

#' @export
flatten_channels.interlacer_interlaced <- function(x, ...) {
  v <- value_channel(x)
  m <- na_channel(x)

  # Prevent casts of factor to numeric...

  if (is.factor(v) && !is.factor(m)) {
    v <- as.character(v)
  }

  if (!is.factor(v) && is.factor(m)) {
    m <- as.character(m)
  }

  if_else(!is.na(v), v, m)
}

#' @export
na <- function(x = NA) {
  new_interlaced(unspecified(vec_size(x)), x)
}

#' @export
na_channel <- function(x, ...) {
  UseMethod("na_channel")
}

#' @export
na_channel.default <- function(x, ...) {
  unspecified(vec_size(x))
}

#' @export
na_channel.interlacer_interlaced <- function(x) {
  attr(x, "na_values")
}

#' @export
is.empty <- function(x) {
  UseMethod("is.empty")
}

#' @export
is.empty.default <- function(x) {
  stop_unsupported(x, "is.empty")
}

#' @export
is.empty.interlacer_interlaced <- function(x) {
  is.na(value_channel(x)) & is.na(na_channel(x))
}


# Display ---------------------------------------------------------------

#' @export
vec_ptype_full.interlacer_interlaced <- function(x, ...) {
  paste0(
    "interlaced<",
    vec_ptype_full(value_channel(x)),
    ", ",
    vec_ptype_full(na_channel(x)),
    ">"
  )
}

#' @export
vec_ptype_abbr.interlacer_interlaced <- function(x, ...) {
  paste0(vec_ptype_abbr(value_channel(x)), ",", vec_ptype_abbr(na_channel(x)))
}

#' @export
format.interlacer_interlaced <- function(x, ...) {
  sapply(x, function(i) {
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
style_empty <- function(x) {
  cli::col_blue(x)
}

#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.interlacer_interlaced <- function(x, ...) {
  align <- if (is_character(x)) "left" else "right"
  items <- lapply(x, function(i) {
    if (is.empty(i)) {
      return(style_empty(format(i)))
    }
    if (is.na(i)) {
      return(pillar::style_na(format(i)))
    }
    format(i)
  })
  pillar::new_pillar_shaft_simple(items, align = align)
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
  lapply(x, function(i) {
    if (is.empty(i)) {
      return(NULL)
    }
    as.list(i)
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

# Functional utilities ----------------------------------------------------

#' @export
map_value_channel <- function(x, fn) {
  new_interlaced(
    fn(value_channel(x)),
    na_channel(x)
  )
}


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
`[<-.interlacer_interlaced` <- function(x, i, value, ...) {
  if (!missing(...)) {
    cli_abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  bimap2_interlaced(x, value, \(v, new_v) `[<-`(v, i, new_v))
}

#' @export
`[[<-.interlacer_interlaced` <- function(x, i, value, ...) {
  if (!missing(...)) {
    cli_abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  bimap2_interlaced(x, value, \(v, new_v) `[[<-`(v, i, new_v))
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

#' @export
levels.interlacer_interlaced <- function(x) {
  levels(value_channel(x))
}

#' @export
`levels<-.interlacer_interlaced` <- function(x, value) {
  map_value_channel(x, \(v) `levels<-`(v, value))
}


# NA functions ---------------------------------------------------------

#' @export
is.na.interlacer_interlaced <- function(x) {
  is.na(value_channel(x))
}

# TODO: implement na.actions

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
  vec_arith(op, value_channel(x), y)
}

#' @export
#' @method vec_arith.interlacer_interlaced default
vec_arith.interlacer_interlaced.default <- function(op, x, y, ...) {
  arith_unwrap(op, x, y)
}

#' @export
#' @method vec_arith.interlacer_interlaced interlacer_interlaced
vec_arith.interlacer_interlaced.interlacer_interlaced <- function(op, x, y, ...) {
  vec_arith(op, value_channel(x), value_channel(y))
}

##

#' @export
#' @method vec_arith.numeric interlacer_interlaced
vec_arith.numeric.interlacer_interlaced <- function(op, x, y, ...) {
  arith_unwrap(op, y, x)
}

#' @export
#' @method vec_arith.logical interlacer_interlaced
vec_arith.logical.interlacer_interlaced <- function(op, x, y, ...) {
  arith_unwrap(op, y, x)
}

# Coercion ----------------------------------------------------------------

ptype2_helper <- function(x, bare, ...) {
  new_interlaced(
    vec_ptype2(value_channel(x), bare),
    na_channel(x),
  )
}

#' @export
vec_ptype2.interlacer_interlaced.character <- function(x, y, ...) {
  ptype2_helper(x, y)
}

#' @export
vec_ptype2.interlacer_interlaced.double <- function(x, y, ...) {
  ptype2_helper(x, y)
}

#' @export
vec_ptype2.interlacer_interlaced.integer <- function(x, y, ...) {
  ptype2_helper(x, y)
}

#' @export
vec_ptype2.interlacer_interlaced.logical <- function(x, y, ...) {
  ptype2_helper(x, y)
}

#' @export
vec_ptype2.interlacer_interlaced.factor <- function(x, y, ...) {
  ptype2_helper(x, y)
}

#' @export
vec_ptype2.interlacer_interlaced.interlacer_interlaced <- function(x, y, ...) {
  bimap2_interlaced(x, y, vec_ptype2)
}

#######

#' @export
vec_ptype2.character.interlacer_interlaced <- function(x, y, ...) {
  ptype2_helper(y, x)
}

#' @export
vec_ptype2.integer.interlacer_interlaced <- function(x, y, ...) {
  ptype2_helper(y, x)
}

#' @export
vec_ptype2.double.interlacer_interlaced <- function(x, y, ...) {
  ptype2_helper(y, x)
}

#' @export
vec_ptype2.logical.interlacer_interlaced <- function(x, y, ...) {
  ptype2_helper(y, x)
}

#' @export
vec_ptype2.factor.interlacer_interlaced <- function(x, y, ...) {
  ptype2_helper(y, x)
}

# Casting -----------------------------------------------------------------

cast_lift <- function(x, to, ...) {
  new_interlaced(
    vec_cast(x, value_channel(to)),
    rep_along(x, vec_cast(NA, na_channel(to)))
  )
}

#' @export
vec_cast.interlacer_interlaced.character <- function(x, to, ...) {
  cast_lift(x, to, ...)
}

#' @export
vec_cast.interlacer_interlaced.double <- function(x, to, ...) {
  cast_lift(x, to, ...)
}

#' @export
vec_cast.interlacer_interlaced.integer <- function(x, to, ...) {
  cast_lift(x, to, ...)
}

#' @export
vec_cast.interlacer_interlaced.logical <- function(x, to, ...) {
  cast_lift(x, to, ...)
}

#' @export
vec_cast.interlacer_interlaced.factor <- function(x, to, ...) {
  cast_lift(x, to, ...)
}

#' @export
vec_cast.interlacer_interlaced.interlacer_interlaced <- function(x, to, ...) {
  bimap2_interlaced(x, to, vec_cast)
}

##

cast_unwrap <- function(x, to, ...) {
  vec_cast(value_channel(x), to, ...)
}

#' @export
vec_cast.character.interlacer_interlaced <- function(x, to, ...) {
  cast_unwrap(x, to, ...)
}

#' @export
vec_cast.double.interlacer_interlaced <- function(x, to, ...) {
  cast_unwrap(x, to, ...)
}

#' @export
vec_cast.integer.interlacer_interlaced <- function(x, to, ...) {
  cast_unwrap(x, to, ...)
}

#' @export
vec_cast.logical.interlacer_interlaced <- function(x, to, ...) {
  cast_unwrap(x, to, ...)
}

#' @export
vec_cast.factor.interlacer_interlaced <- function(x, to, ...) {
  cast_unwrap(x, to, ...)
}

# Helpers -----------------------------------------------------------------

stop_unsupported <- function(x, method) {
  cli_abort("`{method}.{class(x)[[1]]}()` not supported.")
}
