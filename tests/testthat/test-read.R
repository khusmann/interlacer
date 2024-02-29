
test_that("global missing reasons load properly", {
  missing_levels <- c("REASON_1", "REASON_2", "REASON_3")

  col_types <- cols(
    a = col_logical(),
    b = col_integer(),
    c = col_double(),
    d = col_character(),
  )

  expected_col_types <- cols(
    a = col_logical(),
    b = col_integer(),
    c = col_double(),
    d = col_character(),
    .default = col_factor(levels = missing_levels),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = missing_levels,
    col_types = col_types,
  ) |>
    as_tibble()

  result_expected <- read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expect_equal(result, result_expected)

  result_raw <- read_csv(
    test_path("basic-df.csv"),
    col_types = cols(.default = "c")
  )

  expect_equal(result_raw, interlace_missing_reasons(result))
})


test_that("column-level missing reasons can be specified with col_interlaced_*", {
  col_types <- cols(
    a = col_interlaced_logical(na = "REASON_1"),
    b = col_interlaced_integer(na = "REASON_2"),
    c = col_double(),
    d = col_character(),
  )

  expected_col_types <- cols(
    a = col_logical(),
    .a. = col_factor(levels = c("REASON_1", "REASON_3")),
    b = col_integer(),
    .b. = col_factor(levels = c("REASON_2", "REASON_3")),
    c = col_double(),
    .c. = col_factor(levels = c("REASON_3")),
    d = col_character(),
    .d. = col_factor(levels = c("REASON_3")),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = c("REASON_3"),
    col_types = col_types,
  ) |>
    as_tibble()

  result_expected <- read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expect_equal(result, result_expected)

  result_raw <- read_csv(
    test_path("basic-df.csv"),
    col_types = cols(.default = "c")
  )

  expect_equal(result_raw, interlace_missing_reasons(result))
})
