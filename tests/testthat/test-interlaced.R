
test_that("interlaced type cannot construct with different sizes", {
  expect_error(new_interlaced(c(1, 2), 1))
})

test_that("interlaced type cannot construct with simultaneous valid and na", {
  expect_error(new_interlaced(c(1, 2), c(1, 2)))
})

test_that("interlaced type cannot construct with existing 'na_values' attr", {
  foo <- c(1, 2)
  attr(foo, "na_values") <- "bar"
  expect_error(new_interlaced(foo, c(NA, NA)))
})


test_that("is.empty() detects empty values", {
  expect_equal(
    is.empty(new_interlaced(c("a", NA, NA), c(NA, "reason", NA))),
    c(FALSE, FALSE, TRUE)
  )
})

test_that("levels() returns levels of values channel", {
  expect_equal(
    levels(new_interlaced(factor(c("a", "b", "c")), c(NA, NA, NA))),
    c("a", "b", "c")
  )
  expect_null(
    levels(new_interlaced(1, NA))
  )
})

test_that("indexing operates on underlying channels", {
  foo <- vec_c(1, 2, 3, na("reason"))

  expect_equal(foo[], foo)
  expect_equal(foo[2], new_interlaced(2, NA_character_))
  expect_equal(foo[[2]], new_interlaced(2, NA_character_))

  expect_equal(foo[c(2, 4)], vec_c(2, na("reason")))
  expect_error(foo[[c(2, 4)]])

  # Out of bounds indexing creates blanks
  expect_equal(foo[1:6], vec_c(foo, NA, NA))

  # named indexing ($) errors
  expect_error(foo$bar)
  # multidimensional indexing errors
  expect_error(foo[1, 2])
  expect_error(foo[[1, 2]])
})

test_that("indexing assignment casts & operates on underlying channels", {
  foo <- vec_c(1, 2, 3, na("reason"))

  foo[2] <- 5

  expect_equal(foo, vec_c(1, 5, 3, na("reason")))

  foo[[3]] <- 6

  expect_equal(foo, vec_c(1, 5, 6, na("reason")))

  foo[c(1, 4)] <- vec_c(na("reason"), 9)

  expect_equal(foo, vec_c(na("reason"), 5, 6, 9))

  expect_error(foo[[c(1, 4)]] <- 5)
})
