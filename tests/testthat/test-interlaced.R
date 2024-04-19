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
  names(types) <- map_chr(types, function(x) vec_ptype_full(vec_ptype(x)))

  grid <- expand.grid(x = x_types, y = y_types)
  grid$max <- map2_chr(grid$x, grid$y, coerces_to, using = using)

  matrix(
    grid$max,
    nrow = length(x_types),
    dimnames = list(names(x_types), names(y_types))
  )
}

fct1 <- factor(c(), levels=c("a", "b", "c"))

interlaced_types <- list2(
  new_interlaced(logical(), logical()),
  new_interlaced(logical(), integer()),
  new_interlaced(logical(), double()),
  new_interlaced(logical(), fct1),
  new_interlaced(logical(), character()),

  new_interlaced(integer(), logical()),
  new_interlaced(integer(), integer()),
  new_interlaced(integer(), double()),
  new_interlaced(integer(), fct1),
  new_interlaced(integer(), character()),

  new_interlaced(double(), logical()),
  new_interlaced(double(), integer()),
  new_interlaced(double(), double()),
  new_interlaced(double(), fct1),
  new_interlaced(double(), character()),

  new_interlaced(fct1, logical()),
  new_interlaced(fct1, integer()),
  new_interlaced(fct1, double()),
  new_interlaced(fct1, fct1),
  new_interlaced(fct1, character()),

  new_interlaced(character(), logical()),
  new_interlaced(character(), integer()),
  new_interlaced(character(), double()),
  new_interlaced(character(), fct1),
  new_interlaced(character(), character()),
)

base_types = list2(
  logical(),
  integer(),
  double(),
  fct1,
  character(),
)

test_that("base type coercion is symmetric and unchanging", {
  mat <- maxtype_mat(types, base_types)
  mat2 <- maxtype_mat(base_types, types)

  expect_true(all(mat == t(mat2), na.rm = TRUE))
  expect_snapshot(mat)
})

test_that("base type casting unwraps / lifts and is unchanging", {
  lifts <- maxtype_mat(base_types, types, using = "cast")
  unwraps <- maxtype_mat(types, base_types, using = "cast")

  expect_true(all(grepl("^interlaced", na.omit(lifts))))
  expect_true(!any(grepl("^interlaced", na.omit(unwraps))))

  expect_snapshot(mat)
})

test_that("interlaced coersion & casting operates on inner types", {
  t1 <- new_interlaced(integer(), fct1)
  t2 <- new_interlaced(double(), character())

  expect_identical(vec_ptype2(t1, t2), t2)
  expect_identical(vec_ptype2(t2, t1), t2)

  expect_identical(vec_cast(t1, t2), t2)
})
