latent_cfactor <- function(x = unspecified(), codes, ordered = FALSE) {
  out <- cfactor(x, codes, ordered)
  attr(out, "levels") <- levels(out)
  out
}

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
