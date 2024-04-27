# Annoying things I can't fix.

test_that("right combining with base type doesn't become interlaced", {
  # This is annoying, but no way to fix base R
  expect_equal(
    c(1, 2, na("reason")),
    c(1, 2, NA)
  )

  # (use vec_c instead)
  expect_equal(
    vec_c(1, 2, na("reason")),
    new_interlaced(c(1, 2, NA), c(NA, NA, "reason"))
  )
})

test_that(
  "index assignment on base types with interlaced are not promoted", {
  # Annoying, no alternative :(
  foo <- c(1, 2)
  foo[[1]] <- na("hello")

  expect_equal(foo, c(NA, 2))
})

test_that(
  "ifelse doesn't promote interlaced types", {
  # ...because it relies on base index assignment
  expect_equal(
    ifelse(c(TRUE, FALSE), na(4), 5),
    c(NA, 5)
  )

  # (use if_else instead)
  expect_equal(
    if_else(c(TRUE, FALSE), na(4), 5),
    vec_c(na(4), 5)
  )
})

test_that("tibble subassign loses NA reason", {
  # This is due to the line:
  # https://github.com/tidyverse/tibble/blob/b7a8b70c076c2d87c0c3d2e7071b45cce17df9e9/R/subassign-backend.R#L181
  #
  # To see what's going on, run:
  # `tibble:::vectbl_assign(c("a", "b", "c"), 3, na("reason"))`
  #
  # It checks if it's logical, and then looks to see if it's a valid
  # cast. Because the value channel is unspecified (and therefore the
  # values don't matter), it goes ahead and
  # `vec_slice`s into an NA value, thus removing the missing reason.

  bar <- tibble(
    a = vec_c(1, na("z"), 3)
  )

  bar[1, "a"] <- na("y")

  expect_equal(bar$a, vec_c(NA, na("z"), 3))

  # Interestingly, using `$` for this situation works!
  bar$a[1] <- na("y")

  expect_equal(bar$a, vec_c(na("y"), na("z"), 3))
})
