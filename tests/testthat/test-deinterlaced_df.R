#
#test_that("warnings on invalid states", {
#  df_good <- tibble(a = 1) |>
#    coalesce_channels()
#
#  df_both <- df_good |>
#    mutate(.a. = "FOO")
#
#  df_none <- df_good |>
#    mutate(a = NA)
#
#  df_missing_col <- df_good |>
#    select(a)
#
#  expect_no_warning(capture_output(print(df_good)))
#  expect_warning(capture_output(print(df_both)))
#  expect_warning(capture_output(print(df_none)))
#  expect_warning(capture_output(print(df_missing_col)))
#})
#
#test_that("enable / disable warnings", {
#  df_good <- tibble(a = 1) |>
#    coalesce_channels()
#
#  df_bad <- df_good |>
#    mutate(a = NA)
#
#  expect_no_warning(capture_output(print(df_good)))
#  expect_warning(capture_output(print(df_bad)))
#
#  options(interlacer.print_validation = TRUE)
#
#  expect_no_warning(capture_output(print(df_good)))
#  expect_warning(capture_output(print(df_bad)))
#
#  options(interlacer.print_validation = FALSE)
#
#  expect_no_warning(capture_output(print(df_good)))
#  expect_no_warning(capture_output(print(df_bad)))
#
#
#  options(interlacer.print_validation = NULL)
#})
#
#
