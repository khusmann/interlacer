
#' @export
new_interlaced <- function(x, na_values, ...) {
  obj_check_vector(x)
  obj_check_vector(na_values)

  if (vec_size(x) != vec_size(na_values)) {
    cli_abort("values and na_values must be the same size")
  }

  if (any(!is.na(x) & !is.na(na_values))) {
    cli_abort("values and na_values cannot simultaneously have valid values")
  }

  if (!is.null(attr(x, "na_values"))) {
    cli_abort("cannot have na_values attribute in child value types")
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

  class(v) <- c(class(v), class(x))

  v
}

is.interlaced <- function(x) {
  inherits(x, "interlacer_interlaced")
}

#' @export
value_channel <- function(x) {
  if (!is.interlaced(x)) {
    cli_abort("x must be an interlaced vector")
  }

  attr(x, "na_values") <- NULL
  cls <- class(x)
  cls_idx <- match("vctrs_vctr", cls)
  class(x) <- cls[(cls_idx+1):length(cls)]
  x
}

#' @export
na <- function(x = NA) {
  new_interlaced(rep(NA, length(x)), x)
}

#' @export
na_channel <- function(x) {
  if (!is.interlaced(x)) {
    abort("x must be an interlaced vector")
  }

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

#' @export
levels.interlacer_interlaced <- function(x) {
  levels(value_channel(x))
}

#' @export
`levels<-.interlacer_interlaced` <- function(x, value) {
  new_value_channel <- value_channel(x)
  levels(new_value_channel) <- value
  new_interlaced(new_value_channel, na_channel(x))
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
    if (is.na(i)) {
      paste0("<", format(na_channel(i)), ">")
    } else {
      format(value_channel(i))
    }
  })
}

#' @export
style_empty <- function(x) {
  cli::col_blue(x)
}

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

# Subsetting --------------------------------------------------------------

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
`[.interlacer_interlaced` <-  function(x, i, ...) {
  if (!missing(...)) {
    abort("Can't index interlaced vectors on dimensions greater than 1.")
  }
  vec_slice(x, maybe_missing(i))
}

#' @export
`[[.interlacer_interlaced` <- function(x, i, ...) {
  vec_slice(x, i)
}

#' @export
`$.interlacer_interlaced` <- function(x, i, ...) {
  stop_unsupported(x, "subsetting with $")
}

#' @export
rep.interlacer_interlaced <- function(x, ...) {
  out <- lapply(vec_data(x), base_vec_rep, ...)
  vec_restore(out, x)
}

base_vec_rep <- function(x, ...) {
  i <- rep(seq_len(vec_size(x)), ...)
  vec_slice(x, i)
}

#' @export
`length<-.interlacer_interlaced` <- function(x, value) {
  out <- vec_size_assign(vec_data(x), value)
  vec_restore(out, x)
}


#' @export
`$<-.interlacer_interlaced` <- function(x, i, value) {
  stop_unsupported(x, "subset assignment with $")
}

#' @export
`[<-.interlacer_interlaced` <- function(x, i, value) {
  i <- maybe_missing(i, TRUE)
  interlaced_value <- vec_cast(value, x)

  new_value_channel <- value_channel(x)
  new_value_channel[i] <- value_channel(interlaced_value)

  new_na_channel <- na_channel(x)
  new_na_channel[i] <- na_channel(interlaced_value)

  new_interlaced(new_value_channel, new_na_channel)
}

#' @export
`[[<-.interlacer_interlaced` <- function(x, i, value) {
  force(i)
  x[i] <- value
  x
}

# Equality ------------------------------------------------------------

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
is.na.interlacer_interlaced <- function(x) {
  is.na(value_channel(x))
}

# TODO: implement na.actions

# Comparison -----------------------------------------------------------

#' @export
vec_proxy_compare.interlacer_interlaced <- function(x, ...) {
  value_channel(x)
}

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

#' @export
median.interlacer_interlaced <- function(x, ...) {
  median(value_channel(x), ..)
}

#' @export
quantile.interlacer_interlaced <- function(x, ...) {
  quantile(value_channel(x), ...)
}

#' @export
xtfrm.interlacer_interlaced <- function(x, ...) {
  xtfrm(value_channel(x))
}

# Ordering ------------------------------------------------------------

#' @export
vec_proxy_order.interlacer_interlaced <- function(x, ...) {
  vec_proxy(x)
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
  new_interlaced(
    vec_ptype2(value_channel(x), value_channel(y)),
    vec_ptype2(na_channel(x), na_channel(y)),
  )
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
    rep(vec_cast(NA, na_channel(to)), length(x)),
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
  new_interlaced(
    vec_cast(value_channel(x), value_channel(to)),
    vec_cast(na_channel(x), na_channel(to)),
  )
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
  print("hello")
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
