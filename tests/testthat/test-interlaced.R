
test_that("interlaced type cannot construct with different sizes", {
  expect_error(new_interlaced(c(1, 2), 1))
})

test_that("interlaced type cannot construct with simultaneous valid and na", {
  expect_error(new_interlaced(c(1, 2), c(1, 2)))
})

test_that("interlaced type cannot construct with existing 'na_values' attr", {
  foo <- c(1, 2)
  attr(foo, "na_channel_values") <- "bar"
  expect_error(new_interlaced(foo, c(NA, NA)))
})

test_that("parse_interlaced returns unspecified types", {
  expect_equal(
    parse_interlaced("a", NA_character_),
    new_interlaced("a", unspecified(1))
  )
  expect_equal(
    parse_interlaced("a", "a"),
    new_interlaced(unspecified(1), "a")
  )
})

test_that("annoying things are still annoying", {
  # Right combining with base type doesn't become interlaced
  # (use vec_c instead)
  expect_equal(
    c(1, 2, na("reason")),
    c(1, 2, NA)
  )

  foo <- c(1, 2)
  foo[[1]] <- na("hello")

  # Index assignment on base types with interlaced are not promoted
  # to interlaced (no alternative)
  expect_equal(foo, c(NA, 2))

  # ifelse doesn't work because it relies on base index assignment
  # (use if_else instead)
  expect_equal(
    ifelse(c(TRUE, FALSE), na(4), 5),
    c(NA, 5)
  )
})

test_that("is.empty() detects empty values", {
  expect_equal(
    is.empty(new_interlaced(c("a", NA, NA), c(NA, "reason", NA))),
    c(FALSE, FALSE, TRUE)
  )
})

test_that("map_value_channel works", {
  foo <- vec_c("a", "b", "c", na("reason"))

  expect_equal(
    map_value_channel(foo, \(x) if_else(x == "a", "z", x)),
    vec_c("z", "b", "c", na("reason"))
  )

  expect_error(
    map_value_channel(foo, \(x) if_else(x == "a", na("z"), x))
  )
})

test_that("levels() returns and sets levels of values channel", {
  foo <- new_interlaced(factor(c("a", "b", "c")), c(NA, NA, NA))

  expect_equal(
    levels(foo),
    c("a", "b", "c")
  )

  levels(foo) <- c("d", "e", "f")

  expect_equal(
    levels(foo),
    c("d", "e", "f")
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
