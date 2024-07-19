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

test_that("interlaced type coercion is symmetric and unchanging", {
  mat <- maxtype_mat(INTERLACED_TYPES, INTERLACED_TYPES)

  expect_true(isSymmetric(mat))
  expect_snapshot(mat)
})

test_that("base type coercion is symmetric and unchanging", {
  mat <- maxtype_mat(INTERLACED_TYPES, BASE_TYPES)
  mat2 <- maxtype_mat(BASE_TYPES, INTERLACED_TYPES)

  expect_true(all(mat == t(mat2), na.rm = TRUE))
  expect_snapshot(mat)
  expect_snapshot(mat2)
})

test_that("base type casting unwraps / lifts and is unchanging", {
  lifts <- maxtype_mat(BASE_TYPES, INTERLACED_TYPES, using = "cast")
  unwraps <- maxtype_mat(INTERLACED_TYPES, BASE_TYPES, using = "cast")

  expect_true(all(grepl("^interlaced", na.omit(lifts))))
  expect_true(!any(grepl("^interlaced", na.omit(unwraps))))

  expect_snapshot(lifts)
  expect_snapshot(unwraps)
})

test_that("interlaced type casting is unchanging", {
  mat <- maxtype_mat(INTERLACED_TYPES, INTERLACED_TYPES, using = "cast")
  expect_true(all(grepl("^interlaced", na.omit(mat))))
  expect_snapshot(mat)
})
