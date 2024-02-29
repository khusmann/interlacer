test_that("nop if no changes are necessary", {
  result <- tibble(
    a = c(1, NA),
    .a. = factor(c(NA, "UNKNOWN_REASON"))
  ) |>
    coalesce_missing_reasons()

  expect_equal(
    result, result
  )
})

test_that("new missing value reasons make values disappear when keep=missing", {
  result <- tibble(
    a = c(1, 2),
    .a. = factor(c(NA, "UNKNOWN_REASON"))
  ) |>
    coalesce_missing_reasons(keep = "missing")

  expected <- tibble(
    a = c(1, NA),
    .a. = factor(c(NA, "UNKNOWN_REASON"))
  ) |>
    as_interlaced_df()

  expect_equal(result, expected)
})

test_that("new missing value reasons disappear if value available", {
  result <- tibble(
    a = c(1, 2),
    .a. = factor(c(NA, "UNKNOWN_REASON"))
  ) |>
    coalesce_missing_reasons()

  expected <- tibble(
    a = c(1, 2),
    .a. = factor(c(NA, NA), levels = "UNKNOWN_REASON")
  ) |>
    as_interlaced_df()

  expect_equal(result, expected)
})

test_that("missing (missing value) reasons result in default reason", {
  result <- tibble(
    a = c(1, NA),
    .a. = factor(c(NA, NA))
  ) |>
    coalesce_missing_reasons()

  expected <- tibble(
    a = c(1, NA),
    .a. = factor(c(NA, "UNKNOWN_REASON"))
  ) |>
    as_interlaced_df()

  expect_equal(result, expected)
})
