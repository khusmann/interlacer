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
    x_spec(result),
    x_cols(
      a = x_col(v_col_logical(), all_na_reasons()),
      b = x_col(v_col_double(), all_na_reasons()),
      c = x_col(v_col_double(), all_na_reasons()),
      d = x_col(v_col_character(), all_na_reasons())
    )
  )
})

test_that("NULL column-level missing reasons override default", {
  df <- read_interlaced_csv(
    interlacer_example("colors_coded.csv"),
    col_types = x_cols(
      person_id = x_col(v_col_guess(), NULL)
    ),
    na = c(-99, -98, -97)
  )

  expect_false(is.interlaced(df$person_id))
})

test_that("numeric na values are loaded in integer na channel", {
  df <- read_interlaced_csv(
    interlacer_example("colors_coded.csv"),
    na = c(-99, -98, -97)
  )

  expect_true(is.integer(na_channel(df$person_id)))
})

test_that("column-level missing reasons can be specified na arg", {
  col_types <- x_cols(
    a = x_col(v_col_logical(), c("REASON_3", "REASON_1")),
    b = x_col(v_col_double(), c("REASON_3", "REASON_2")),
    c = x_col(v_col_double(), c("REASON_3")),
    d = x_col(v_col_character(), c("REASON_3"))
  )

  result <- read_interlaced_csv(
    test_path("basic-df.csv"),
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

  expect_equal(x_spec(result), col_types)
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
    x_spec(result),
    x_cols(
      a = x_col(v_col_logical(), all_na_reasons()),
      b = x_col(v_col_skip(), na_col_none()),
      c = x_col(v_col_skip(), na_col_none()),
      d = x_col(v_col_skip(), na_col_none())
    )
  )

  expect_equal(
    x_spec(result),
    x_cols(
      a = x_col(v_col_logical(), all_na_reasons()),
      b = x_col(v_col_skip(), na_col_none()),
      c = x_col(v_col_skip(), na_col_none()),
      d = x_col(v_col_skip(), na_col_none())
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
    x_spec(result),
    x_cols(
      a = x_col(v_col_logical(), all_na_reasons()),
      b = x_col(v_col_skip(), na_col_none()),
      c = x_col(v_col_skip(), na_col_none()),
      d = x_col(v_col_skip(), na_col_none())
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
    x_spec(result),
    x_cols(
      a = x_col(v_col_logical(), all_na_reasons()),
      b = x_col(v_col_double(), all_na_reasons()),
      c = x_col(v_col_double(), all_na_reasons()),
      d = x_col(v_col_skip(), na_col_none())
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
    x_spec(result),
    x_cols(
      a = x_col(v_col_logical(), all_na_reasons()),
      b = x_col(v_col_double(), all_na_reasons()),
      c = x_col(v_col_double(), all_na_reasons()),
      d = x_col(v_col_skip(), na_col_none())
    )
  )
})

# TODO: After adding support for unnamed col_types (if I decide to), check
# 1. unnamed col_types work
# 2. undercomplete has warning
# 3. overcomplete has warning

test_that("cannot mix unnamed and named col_types", {
  expect_error(
     read_interlaced_csv(
      test_path("basic-df.csv"),
      na = all_na_reasons(),
      col_types = list("c", a = "b")
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
      \(f) read_interlaced_delim(f, delim = "Z", na = c("", "NA")),
      \(f) read_interlaced_csv(f, na = c("", "NA")),
      \(f) read_interlaced_csv2(f, na = c("", "NA")),
      \(f) read_interlaced_tsv(f, na = c("", "NA"))
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
  result <- read_interlaced_csv(I("a,b\n1,2\nNA,\n5,6\n"), na = c("", "NA"))
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
    type_convert_col(chr_values, readr::col_guess(), na = character()),
    unspecified(5)
  )
  expect_equal(
    type_convert_col(chr_values, readr::col_integer(), na = character()),
    rep(NA_integer_, 5)
  )
  expect_equal(
    type_convert_col(chr_values, readr::col_logical(), na = character()),
    rep(NA, 5)
  )
})
