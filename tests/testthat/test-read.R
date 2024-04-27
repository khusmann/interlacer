basic_df_expected <- tibble(
  a = vec_c(na("REASON_1"), TRUE, TRUE, na("REASON_3")),
  b = vec_c(7, na("REASON_2"), 8, 10),
  c = vec_cast(
    c(
      0.181526642525569,
      0.833227441413328,
      0.926790483295918,
      0.375270307529718
    ), new_interlaced(double(), character())
  ),
  d = vec_c("m", "z", "r", na("REASON_3"))
)

test_that("basic reading works", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = c("REASON_1", "REASON_2", "REASON_3")
  )

  expect_equal(result, basic_df_expected, ignore_attr = TRUE)
})


test_that("column-level missing reasons can be specified with icol_*", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = c("REASON_3"),
    col_types = cols(
      a = icol_logical(na = "REASON_1"),
      b = icol_double(na = "REASON_2"),
      c = col_double(),
      d = col_character(),
    ),
  )

  expect_equal(
    result,
    basic_df_expected,
    ignore_attr = TRUE
  )
})

test_that("col_select correctly selects columns", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = c("REASON_1", "REASON_2", "REASON_3"),
    col_select = a,
  )

  expected <- basic_df_expected["a"]

  expect_equal(result, expected, ignore_attr = TRUE)
})

# Special case

test_that("columns with NA as the na reason read properly", {
  result <- read_interlaced_csv(I("a,b\n1,2\nNA,\n5,6"), show_col_types = FALSE)
  expected <- tibble(
    a = c(NA, "NA", NA),
    b = c(NA, "", NA)
  )
  expect_equal(na_channel(result), expected, ignore_attr = TRUE)
})
