all_na_reasons <- function() {
  c("REASON_1", "REASON_2", "REASON_3")
}

to_na_reason_factor <- function(c) {
  factor(c, all_na_reasons())
}

basic_df_expected <- function() {
  tibble(
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
}

test_that("basic reading works", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons()
  )

  expected <- basic_df_expected()

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_logical(),
      b = col_double(),
      c = col_double(),
      d = col_character()
    )
  )

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_character(),
      b = col_character(),
      c = col_character(),
      d = col_character()
    )
  )
})


test_that("column-level missing reasons can be specified with icol_*", {
  col_types <- cols(
    a = icol_logical(na = "REASON_1"),
    b = icol_double(na = "REASON_2"),
    c = col_double(),
    d = col_character(),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = c("REASON_3"),
    col_types = col_types,
  )

  expected <- basic_df_expected()

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(spec(result)$cols, col_types$cols)
})

### col_select

test_that("col_select selects columns", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
    col_select = a,
  )

  expected <- basic_df_expected() |>
    dplyr::select(a)

  expect_equal(result, expected, ignore_attr = TRUE)

 expect_equal(
    spec(result)$cols,
    list(
      a = col_logical(),
      b = col_skip(),
      c = col_skip(),
      d = col_skip()
    )
  )

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_character(),
      b = col_skip(),
      c = col_skip(),
      d = col_skip()
    )
  )
})

test_that("col_select renames columns", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
    col_select = c(z = a),
  )

  expected <- basic_df_expected() |>
    dplyr::select(z = a)

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_logical(),
      b = col_skip(),
      c = col_skip(),
      d = col_skip()
    )
  )

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_character(),
      b = col_skip(),
      c = col_skip(),
      d = col_skip()
    )
  )
})

test_that("col_select reorders columns", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
    col_select = c(b, c, a),
  )

  expected <- basic_df_expected() |>
    dplyr::select(b, c, a)

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_logical(),
      b = col_double(),
      c = col_double(),
      d = col_skip()
    )
  )

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_character(),
      b = col_character(),
      c = col_character(),
      d = col_skip()
    )
  )
})

test_that("col_select reorders and renames columns", {
  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
    col_select = c(x = b, y = c, z = a),
  )

  expected <- basic_df_expected() |>
    dplyr::select(x = b, y = c, z = a)

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_logical(),
      b = col_double(),
      c = col_double(),
      d = col_skip()
    )
  )

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_character(),
      b = col_character(),
      c = col_character(),
      d = col_skip()
    )
  )
})

### Unnamed col_types

test_that("unnamed col_types work", {
   result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
    col_types = "cccc"
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      dplyr::across(
        everything(),
        \(v) map_value_channel(v, as.character)
      )
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_character(),
      b = col_character(),
      c = col_character(),
      d = col_character()
    )
  )
})

test_that("incomplete unnamed col_types work with warning", {
  expect_warning(
     result <- read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      col_types = "c"
    )
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      a = map_value_channel(a, as.character)
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_character(),
      b = col_double(),
      c = col_double(),
      d = col_character()
    )
  )
})

test_that("overcomplete unnamed col_types work with warning", {
  expect_warning(
     result <- read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      col_types = "ccccc"
    )
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      dplyr::across(
        everything(),
        \(v) map_value_channel(v, as.character)
      )
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    spec(result)$cols,
    list(
      a = col_character(),
      b = col_character(),
      c = col_character(),
      d = col_character()
    )
  )
})

test_that("cannot mix unnamed and named col_types", {
  expect_error(
     read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      col_types = list("c", a = "b")
    )
  )
})

# Unnamed na_col_types

test_that("unnamed na_col_types work", {
   result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
    na_col_types = "ffff"
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      dplyr::across(
        everything(),
        \(c) map_na_channel(c, to_na_reason_factor)
      )
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_factor(all_na_reasons()),
      b = col_factor(all_na_reasons()),
      c = col_factor(all_na_reasons()),
      d = col_factor(all_na_reasons())
    )
  )
})

test_that("incomplete unnamed na_col_types work with warning", {
  expect_warning(
     result <- read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      na_col_types = "f"
    )
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      a = map_na_channel(a, to_na_reason_factor)
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_factor(all_na_reasons()),
      b = col_character(),
      c = col_character(),
      d = col_character()
    )
  )
})

test_that("overcomplete unnamed na_col_types work with warning", {
  expect_warning(
     result <- read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      na_col_types = "fffff"
    )
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      dplyr::across(
        everything(),
        \(v) map_na_channel(v, to_na_reason_factor)
      )
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    na_spec(result)$cols,
    list(
      a = col_factor(all_na_reasons()),
      b = col_factor(all_na_reasons()),
      c = col_factor(all_na_reasons()),
      d = col_factor(all_na_reasons())
    )
  )
})

test_that("cannot mix unnamed and named na_col_types", {
  expect_error(
     read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      na_col_types = list("c", a = "b")
    )
  )
})

# special cases

test_that("all read & write fn variants work", {
  test_fns <- tibble(
    txt = list(
      "aZb\n1Z2\nNAZ\n5Z6\n",
      "a,b\n1,2\nNA,\n5,6\n",
      "a;b\n1;2\nNA;\n5;6\n",
      "a\tb\n1\t2\nNA\t\n5\t6\n"
    ),
    read_fn = list(
      \(f) read_interlaced_delim(f, delim = "Z"),
      read_interlaced_csv,
      read_interlaced_csv2,
      read_interlaced_tsv
    ),
    write_fn = list(
      list(\(f, o) write_interlaced_delim(f, o, delim = "Z")),
      list(write_interlaced_csv, write_interlaced_excel_csv),
      list(write_interlaced_csv2, write_interlaced_csv2),
      list(write_interlaced_tsv)
    )
  )

  expected <- tibble(
    a = vec_c(1, na("NA"), 5),
    b = vec_c(2, na(""), 6),
  )

  pmap(test_fns, function(txt, read_fn, write_fns) {
    # Test read
    result <- read_fn(I(txt))
    expect_equal(result, expected, ignore_attr = TRUE)

    # Test write
    for (write_fn in write_fns) {
      out <- tempfile()
      on.exit(unlink(out))

      out_inv <- write_fn(result, out)

      expect_equal(out_inv, result) # Write fns return invisible(x)
      expect_equal(txt, readr::read_file(out))

      unlink(out)
    }
  })
})

test_that("columns with NA as the na reason read properly", {
  result <- read_interlaced_csv(I("a,b\n1,2\nNA,\n5,6\n"))
  expected <- tibble(
    a = c(NA, "NA", NA),
    b = c(NA, "", NA)
  )
  expect_equal(na_channel(result), expected, ignore_attr = TRUE)
})

test_that("duplicate columns fail", {
  expect_error(
    read_interlaced_csv(I("a,a\n1,2\nNA,\n5,6\n"))
  )
})
