
test_that("default missing reasons are overrided", {
  result <- tibble(a = "NA") |>
    deinterlace_type_convert(na = "FOO")

  expect_equal(
    result, tibble(a = "NA", .a. = factor(NA, levels = "FOO"))
  )
})

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
  )

  result_expected <- read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expect_equal(result, result_expected, ignore_attr = TRUE)

  result_raw <- read_csv(
    test_path("basic-df.csv"),
    col_types = cols(.default = "c")
  )

  expect_equal(
    result_raw,
    interlace_channels(result),
    ignore_attr = TRUE
  )
})


test_that("column-level missing reasons can be specified with icol_*", {
  col_types <- cols(
    a = icol_logical(na = "REASON_1"),
    b = icol_integer(na = "REASON_2"),
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
  )

  result_expected <- read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expect_equal(result, result_expected, ignore_attr = TRUE)

  result_raw <- read_csv(
    test_path("basic-df.csv"),
    col_types = cols(.default = "c")
  )

  expect_equal(
    result_raw,
    interlace_channels(result),
    ignore_attr = TRUE
  )
})


test_that("col_select correctly selects columns", {
  missing_levels <- c("REASON_1", "REASON_2", "REASON_3")

  col_types <- cols(
    a = col_logical(),
    b = col_integer(),
    c = col_double(),
    d = col_character(),
  )

  expected_col_types <- cols(
    a = col_logical(),
    .default = col_factor(levels = missing_levels),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = missing_levels,
    col_types = col_types,
    col_select = a,
  )

  result_expected <- read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
    col_select = c(a, .a.),
  )

  expect_equal(result, result_expected, ignore_attr = TRUE)
})
