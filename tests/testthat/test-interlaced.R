
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
  expect_error(
    parse_interlaced("a", NA),
  )
  expect_equal(
    parse_interlaced("a", "a"),
    new_interlaced(unspecified(1), "a")
  )
})


test_that("is.na() detect correct values", {
  foo <- new_interlaced(c("a", NA, NA), c(NA, "reason", NA))
  expect_equal(is.na(foo), c(FALSE, TRUE, TRUE))
})

test_that("map_value_channel works", {
  foo <- vec_c("a", "b", "c", na("reason"))

  expect_equal(
    map_value_channel(foo, \(x) if_else(x == "a", "z", x)),
    vec_c("z", "b", "c", na("reason"))
  )

  # Cannot nest interlaced values into the value channel
  expect_error(
    map_value_channel(foo, \(x) if_else(x == "a", na("z"), x))
  )

  # Singleton fns will be broadcasted
  expect_equal(
    map_value_channel(foo, \(x) "bar"),
    vec_c("bar", "bar", "bar", na("reason"))
  )
})

test_that("map_na_channel works", {
  foo <- vec_c("a", "b", "c", na("reason"), na("reason2"))

  expect_equal(
    map_na_channel(foo, \(x) if_else(x == "reason", "z", x)),
    vec_c("a", "b", "c", na("z"), na("reason2"))
  )

  # Cannot nest interlaced values into the value channel
  expect_error(
    map_na_channel(foo, \(x) if_else(x == "reason", na("z"), x))
  )

  # Singleton fns will be broadcasted
  expect_equal(
    map_na_channel(foo, \(x) "bar"),
    vec_c("a", "b", "c", na("bar"), na("bar"))
  )
})

test_that("rep() works", {
  foo <- vec_c("a", na("b"))
  expect_equal(
    rep(foo, 3),
    vec_c("a", na("b"), "a", na("b"), "a", na("b"))
  )
})

test_that("length<-() works", {
  foo <- new_interlaced(c("a", NA, "c"), c(NA, "b", NA))

  length(foo) <- 5

  expect_equal(
    foo, vec_c("a", na("b"), "c", NA, NA)
  )
})

test_that("levels() returns and sets levels of values channel", {
  foo <- interlaced(factor(c("a", "b", "c")), na="reason")

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
    levels(interlaced(1, na="reason"))
  )
})

test_that("indexing operates on underlying channels", {
  foo <- vec_c(1, 2, 3, na("reason"))

  expect_equal(foo[], foo)
  expect_equal(foo[2], interlaced(2, na = "reason"))
  expect_equal(foo[[2]], interlaced(2, na = "reason"))

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


test_that("comparisons and ordering works", {
  foo <- vec_c(10, 2, na("reason 1"), 3, na("reason 2"), 9, 1)

  expect_equal(min(foo, na.rm=TRUE), 1)
  expect_equal(max(foo, na.rm=TRUE), 10)
  expect_equal(range(foo, na.rm=TRUE), c(1, 10))
  expect_equal(median(foo, na.rm=TRUE), 3)
  expect_equal(quantile(foo, na.rm=TRUE), c(1,2,3,9,10), ignore_attr=TRUE)
  expect_equal(xtfrm(foo), c(10, 2, NA, 3, NA, 9, 1))

  expect_equal(min(foo), NA_real_)
  expect_equal(max(foo), NA_real_)
  expect_equal(range(foo), c(NA_real_, NA_real_))
  expect_equal(median(foo), NA_real_)
  expect_error(quantile(foo))
})

test_that("vec_math works", {
  foo <- vec_c(10, 2, na("reason 1"), 3, na("reason 2"), 9, 1)
  expect_equal(mean(foo, na.rm=TRUE), 5)
  expect_equal(var(foo, na.rm=TRUE), 17.5)

  expect_equal(mean(foo), NA_real_)
  expect_equal(var(foo), NA_real_)
})

test_that("vec_arith works", {
  foo <- vec_c(10, 2, na("reason 1"), 3, na("reason 2"), 9, 1)
  foo_plus_one <- c(11, 3, NA, 4, NA, 10, 2)

  expect_equal(foo + 1, foo_plus_one)
  expect_equal(1 + foo, foo_plus_one)
  expect_equal(foo + TRUE, foo_plus_one)
  expect_equal(TRUE + foo, foo_plus_one)

  expect_equal(
    foo + foo,
    c(20, 4, NA, 6, NA, 18, 2)
  )
})

test_that("multichannel comparisons work", {
  expect_true(NA %==% NA)
  expect_true(5 %==% 5)
  expect_false(NA %==% 5)
  expect_false(5 %==% NA)

  expect_true(na("reason") %==% na("reason"))
  expect_false(na("reason") %==% 5)
  expect_false(5 %==% na("reason"))
  expect_false(na("reason2") %==% na("reason"))
  expect_false(na("reason") %==% na("reason2"))
  expect_false(NA %==% na("reason"))
  expect_false(na("reason") %==% NA)
})
