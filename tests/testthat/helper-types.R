EXAMPLE_FCT <- factor(c(), levels=c("a", "b", "c"))

INTERLACED_TYPES <- list2(
#  new_interlaced(logical(), logical()),
  new_interlaced(logical(), integer()),
  new_interlaced(logical(), double()),
  new_interlaced(logical(), EXAMPLE_FCT),
  new_interlaced(logical(), character()),

#  new_interlaced(integer(), logical()),
  new_interlaced(integer(), integer()),
  new_interlaced(integer(), double()),
  new_interlaced(integer(), EXAMPLE_FCT),
  new_interlaced(integer(), character()),

#  new_interlaced(double(), logical()),
  new_interlaced(double(), integer()),
  new_interlaced(double(), double()),
  new_interlaced(double(), EXAMPLE_FCT),
  new_interlaced(double(), character()),

#  new_interlaced(EXAMPLE_FCT, logical()),
  new_interlaced(EXAMPLE_FCT, integer()),
  new_interlaced(EXAMPLE_FCT, double()),
  new_interlaced(EXAMPLE_FCT, EXAMPLE_FCT),
  new_interlaced(EXAMPLE_FCT, character()),

#  new_interlaced(character(), logical()),
  new_interlaced(character(), integer()),
  new_interlaced(character(), double()),
  new_interlaced(character(), EXAMPLE_FCT),
  new_interlaced(character(), character()),
)

BASE_TYPES = list2(
  logical(),
  integer(),
  double(),
  EXAMPLE_FCT,
  character(),
)

coerces_to <- function(x, y, using = "strict") {
  type_max <- switch(using,
                     strict = vec_ptype2,
                     base_c = c,
                     base_unlist = function(x, y) unlist(list(x, y)),
                     base_modify = function(x, y) `[<-`(x, 2, value = y),
                     cast = vec_cast
  )

  tryCatch({
    type <- suppressWarnings(type_max(x, y))
    vec_ptype_full(type)
  }, error = function(e) {
    NA_character_
  })
}

maxtype_mat <- function(x_types, y_types = x_types, using = "strict") {
  names(x_types) <- map_chr(x_types, function(x) vec_ptype_full(vec_ptype(x)))
  names(y_types) <- map_chr(y_types, function(x) vec_ptype_full(vec_ptype(x)))

  grid <- expand.grid(x = x_types, y = y_types)
  grid$max <- map2_chr(grid$x, grid$y, coerces_to, using = using)

  matrix(
    grid$max,
    nrow = length(x_types),
    dimnames = list(names(x_types), names(y_types))
  )
}
