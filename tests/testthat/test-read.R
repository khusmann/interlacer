
test_that("basic reading works", {
  missing_levels <- c("REASON_1", "REASON_2", "REASON_3")

  col_types <- cols(
    a = col_logical(),
    b = col_integer(),
    c = col_double(),
    d = col_character(),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = missing_levels,
    col_types = col_types,
  )

  expected_col_types <- cols(
    !!!col_types$cols,
    .default = col_character()
  )

  expected_deinterlaced <- readr::read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expected_interlaced <- expected_deinterlaced |>
    dplyr::transmute(
      a = new_interlaced(a, .a.),
      b = new_interlaced(b, .b.),
      c = new_interlaced(c, .c.),
      d = new_interlaced(d, .d.),
    )

  expect_equal(result, expected_interlaced, ignore_attr = TRUE)
})

test_that("columns with NA as the na reason read properly", {
  result <- read_interlaced_csv(I("a,b\n1,2\nNA,\n5,6"), show_col_types = FALSE)
  expected <- tibble(
    a = new_interlaced(c(1, NA, 5), c(NA, "NA", NA)),
    b = new_interlaced(c(2, NA, 6), c(NA, "", NA))
  )
  expect_equal(result, expected, ignore_attr = TRUE)
})

test_that("column-level missing reasons can be specified with icol_*", {
  col_types <- cols(
    a = icol_logical(na = "REASON_1"),
    b = icol_integer(na = "REASON_2"),
    c = col_double(),
    d = col_character(),
  )

  expected_col_types <- cols(
    !!!col_types$cols,
    .default = col_character()
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = c("REASON_3"),
    col_types = col_types,
  )

  expected_deinterlaced <- readr::read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expected_interlaced <- expected_deinterlaced |>
    dplyr::transmute(
      a = new_interlaced(a, .a.),
      b = new_interlaced(b, .b.),
      c = new_interlaced(c, .c.),
      d = new_interlaced(d, .d.),
    )

  expect_equal(
    result,
    expected_interlaced,
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
    !!!col_types$cols,
    .default = col_character(),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = missing_levels,
    col_types = col_types,
    col_select = a,
  )

  expected_deinterlaced <- readr::read_csv(
    test_path("basic-df.expected.csv"),
    na = "NA",
    col_types = expected_col_types,
  )

  expected_interlaced <- expected_deinterlaced |>
    dplyr::transmute(
      a = new_interlaced(a, .a.),
    )

  expect_equal(result, expected_interlaced, ignore_attr = TRUE)
})
