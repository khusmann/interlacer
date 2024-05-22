all_na_reasons <- function() {
  c("REASON_1", "REASON_2", "REASON_3")
}

to_na_reason_factor <- function(c) {
  factor(c, all_na_reasons())
}

basic_df_expected <- function() {
  tibble(
    a = interlaced(list("REASON_1", TRUE, TRUE, "REASON_3"), na = all_na_reasons()),
    b = interlaced(list(7, "REASON_2", 8, 10), na = all_na_reasons()),
    c = interlaced(
      c(
        0.181526642525569,
        0.833227441413328,
        0.926790483295918,
        0.375270307529718
      ), na = all_na_reasons()
    ),
    d = interlaced(list("m", "z", "r", "REASON_3"), na = all_na_reasons())
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
    na_spec(result)$default,
    all_na_reasons()
  )
})


test_that("column-level missing reasons can be specified na arg", {
  col_types <- cols(
    a = col_logical(),
    b = col_double(),
    c = col_double(),
    d = col_character(),
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = na_cols(
      .default = c("REASON_3"),
      a = c(.default, "REASON_1"),
      b = c(.default, "REASON_2"),
    ),
    col_types = col_types,
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      a = map_na_channel(a, \(v) vec_cast(v, factor(levels=c("REASON_3", "REASON_1")))),
      b = map_na_channel(b, \(v) vec_cast(v, factor(levels=c("REASON_3", "REASON_2")))),
      c = map_na_channel(c, \(v) vec_cast(v, factor(levels="REASON_3"))),
      d = map_na_channel(d, \(v) vec_cast(v, factor(levels="REASON_3")))
    )

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
    na_spec(result)$default,
    all_na_reasons()
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
    na_spec(result)$default,
    all_na_reasons()
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
    na_spec(result)$default,
    all_na_reasons()
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
    na_spec(result)$default,
    all_na_reasons()
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

test_that("overcomplete na spec work with warning", {
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

test_that("factor na values works", {
   result <- read_interlaced_csv(
    test_path("basic-df.csv"),
    na = all_na_reasons(),
  )

  expect_equal(result, basic_df_expected(), ignore_attr = TRUE)

  expect_equal(
    na_spec(result)$default,
    all_na_reasons()
  )
})

test_that("incomplete unnamed na_col_types work with warning", {
  expect_warning(
     result <- read_interlaced_csv(
      test_path("basic-df.csv"),
      na = list(all_na_reasons())
    )
  )

  expected <- basic_df_expected() |>
    dplyr::mutate(
      a = map_na_channel(a, to_na_reason_factor),
      b = flatten_channels(b),
      c = as.numeric(flatten_channels(c)),
      d = flatten_channels(d)
    )

  expect_equal(result, expected, ignore_attr = TRUE)

  expect_equal(
    na_spec(result)$cols,
    list(
      a = all_na_reasons(),
      b = NULL,
      c = NULL,
      d = NULL
    )
  )
})

test_that("overcomplete unnamed na_col_types work with warning", {
  expect_warning(
     result <- read_interlaced_csv(
      test_path("basic-df.csv"),
      na = list(
        all_na_reasons(),
        all_na_reasons(),
        all_na_reasons(),
        all_na_reasons(),
        all_na_reasons()
      )
    )
  )

  expect_equal(result, basic_df_expected(), ignore_attr = TRUE)

  expect_equal(
    na_spec(result)$cols,
    list(
      a = all_na_reasons(),
      b = all_na_reasons(),
      c = all_na_reasons(),
      d = all_na_reasons()
    )
  )
})

test_that("cannot mix unnamed and named na_col_types", {
  expect_error(
     read_interlaced_csv(
      test_path("basic-df.csv"),
      na = list("c", a = "b")
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
    a = factor(c(NA, "NA", NA), levels = c("", "NA")),
    b = factor(c(NA, "", NA), levels = c("", "NA"))
  )
  expect_equal(na_channel(result), expected, ignore_attr = TRUE)
})

test_that("duplicate columns fail", {
  expect_error(
    read_interlaced_csv(I("a,a\n1,2\nNA,\n5,6\n"))
  )
})

test_that("type_convert_col() returns unspecified", {
  chr_values <- rep("", 5)
  expect_equal(
    type_convert_col(chr_values, col_guess(), na = character()),
    unspecified(5)
  )
  expect_equal(
    type_convert_col(chr_values, col_integer(), na = character()),
    rep(NA_integer_, 5)
  )
  expect_equal(
    type_convert_col(chr_values, col_logical(), na = character()),
    rep(NA, 5)
  )
})
