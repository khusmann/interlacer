
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
})

test_that("base type casting unwraps / lifts and is unchanging", {
  lifts <- maxtype_mat(BASE_TYPES, INTERLACED_TYPES, using = "cast")
  unwraps <- maxtype_mat(INTERLACED_TYPES, BASE_TYPES, using = "cast")

  expect_true(all(grepl("^interlaced", na.omit(lifts))))
  expect_true(!any(grepl("^interlaced", na.omit(unwraps))))

  expect_snapshot(mat)
})

test_that("interlaced type casting is unchanging", {
  mat <- maxtype_mat(INTERLACED_TYPES, INTERLACED_TYPES, using = "cast")
  expect_true(all(grepl("^interlaced", na.omit(mat))))
  expect_snapshot(mat)
})
