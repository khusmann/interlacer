CFCT_TYPES <- list2(
  logical(),
  integer(),
  double(),
  character(),
  factor(levels=c("a")),
  factor(levels=c("a", "b")),
  factor(levels=c("a", "b", "c")),
  factor(levels=c("d", "e", "f")),
  cfactor(codes=c(a = 10)),
  cfactor(codes=c(a = 10, b = 20)),
  cfactor(codes=c(a = 10, b = 20, c = 30)),
  cfactor(codes=c(d = 10, e = 20, f = 30)),
  cfactor(codes=c(a = 1)),
  cfactor(codes=c(a = 1, b = 2)),
  cfactor(codes=c(a = 1, b = 2, c = 3)),
  cfactor(codes=c(d = 1, e = 2, f = 3)),
  cfactor(codes=c(a = "z")),
  cfactor(codes=c(a = "z", b = "y")),
  cfactor(codes=c(a = "z", b = "y", c = "x")),
  cfactor(codes=c(d = "z", e = "y", f = "x")),
  cfactor(codes=c(a = "zz")),
  cfactor(codes=c(a = "zz", b = "yy")),
  cfactor(codes=c(a = "zz", b = "yy", c = "xx")),
  cfactor(codes=c(d = "zz", e = "yy", f = "xx")),
)

test_that("cfactor type coercion is unchanging", {
  mat <- maxtype_mat(CFCT_TYPES, CFCT_TYPES)
  # Don't test for symmetry here, because ptype2 for factor
  # is not symmetric... the order of args changes the order
  # of the levels
  expect_snapshot(mat)
})

test_that("cfactor type casting is unchanging", {
  mat <- maxtype_mat(CFCT_TYPES, CFCT_TYPES, using = "cast")
  expect_snapshot(mat)
})
