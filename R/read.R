#' Read an delimited file with interlaced missing reasons into a tibble
#'
#' The `read_interlaced_*()`, family of functions extend `readr`'s
#' `read_delim()`, `read_csv`, etc. functions for use on data sources where
#' values are interlaced with missing reasons. These functions return a tibble
#' with interlaced columns.
#'
#' @inheritParams readr::read_delim
#' @inheritParams vroom::vroom
#'
#' @param col_types `NULL`, or a [cols()] specification.
#'    The "compact string" representation supported by [readr::read_delim()]
#'    and [vroom::vroom()] is not supported by interlacer (yet).
#'
#'    If `NULL`, all column types will be inferred from `guess_max` rows of the
#'    input, interspersed throughout the file. This is convenient (and fast),
#'    but not robust. If the guessed types are wrong, you'll need to increase
#'    `guess_max` or supply the correct types yourself.
#'
#'    Column specifications created by [list()] or [cols()] must contain
#'    one column specification for each column. If you only want to read a
#'    subset of the columns, use [cols_only()].
#'
#'    By default, reading a file without a column specification will print a
#'    message showing what `vroom` guessed they were. To remove this message,
#'    set `show_col_types = FALSE` or set
#'    `options(interlacer.show_col_types = FALSE)`.
#'
#' @return A [tibble()], with interlaced columns.
#'
#' @export
#' @examples
#' # Beep boop
read_interlaced_delim <- function(
  file,
  delim = NULL,
  quote = "\"",
  escape_backslash = FALSE,
  escape_double = TRUE,
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  locale = readr::default_locale(),
  na = c("", "NA"),
  comment = "",
  trim_ws = FALSE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  num_threads = interlacer_threads(),
  progress = interlacer_progress(),
  show_col_types = interlacer_show_col_types(),
  skip_empty_rows = TRUE
  # lazy = should_read_lazy()
) {
  interlaced_vroom(
    file = file,
    delim = delim,
    col_names = col_names,
    col_types = col_types,
    col_select = {{col_select}},
    id = id,
    skip = skip,
    n_max = n_max,
    na = na,
    quote = quote,
    comment = comment,
    skip_empty_rows = skip_empty_rows,
    trim_ws = trim_ws,
    escape_double = escape_double,
    escape_backslash = escape_backslash,
    locale = locale,
    guess_max = guess_max,
    # altrep
    num_threads = num_threads,
    progress = progress,
    show_col_types = show_col_types,
    .name_repair = name_repair
  )
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_csv <- function(
  file,
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  locale = readr::default_locale(),
  na = c("", "NA"),
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  num_threads = interlacer_threads(),
  progress = interlacer_progress(),
  show_col_types = interlacer_show_col_types(),
  skip_empty_rows = TRUE
  # lazy = should_read_lazy()
) {
  interlaced_vroom(
    file = file,
    delim = ",",
    col_names = col_names,
    col_types = col_types,
    col_select = {{col_select}},
    id = id,
    skip = skip,
    n_max = n_max,
    na = na,
    quote = quote,
    comment = comment,
    skip_empty_rows = skip_empty_rows,
    trim_ws = trim_ws,
    escape_double = TRUE,
    escape_backslash = FALSE,
    locale = locale,
    guess_max = guess_max,
    # altrep
    num_threads = num_threads,
    progress = progress,
    show_col_types = show_col_types,
    .name_repair = name_repair
  )
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_csv2 <- function(
  file,
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  locale = readr::default_locale(),
  na = c("", "NA"),
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  num_threads = interlacer_threads(),
  progress = interlacer_progress(),
  show_col_types = interlacer_show_col_types(),
  skip_empty_rows = TRUE
  # lazy = should_read_lazy()
) {
  interlaced_vroom(
    file = file,
    delim = ";",
    col_names = col_names,
    col_types = col_types,
    col_select = {{col_select}},
    id = id,
    skip = skip,
    n_max = n_max,
    na = na,
    quote = quote,
    comment = comment,
    skip_empty_rows = skip_empty_rows,
    trim_ws = trim_ws,
    escape_double = TRUE,
    escape_backslash = FALSE,
    locale = locale,
    guess_max = guess_max,
    # altrep
    num_threads = num_threads,
    progress = progress,
    show_col_types = show_col_types,
    .name_repair = name_repair
  )
}

#' @rdname read_interlaced_delim
#' @export
read_interlaced_tsv <- function(
  file,
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  locale = readr::default_locale(),
  na = c("", "NA"),
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  num_threads = interlacer_threads(),
  progress = interlacer_progress(),
  show_col_types = interlacer_show_col_types(),
  skip_empty_rows = TRUE
  # lazy = should_read_lazy()
) {
  interlaced_vroom(
    file = file,
    delim = "\t",
    col_names = col_names,
    col_types = col_types,
    col_select = {{col_select}},
    id = id,
    skip = skip,
    n_max = n_max,
    na = na,
    quote = quote,
    comment = comment,
    skip_empty_rows = skip_empty_rows,
    trim_ws = trim_ws,
    escape_double = TRUE,
    escape_backslash = FALSE,
    locale = locale,
    guess_max = guess_max,
    # altrep
    num_threads = num_threads,
    progress = progress,
    show_col_types = show_col_types,
    .name_repair = name_repair
  )
}

#' @rdname read_interlaced_delim
#' @export
interlaced_vroom <- function(
  file,
  delim = NULL,
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  skip = 0,
  n_max = Inf,
  na = c("", "NA"),
  quote = "\"",
  comment = "",
  skip_empty_rows = TRUE,
  trim_ws = TRUE,
  escape_double = TRUE,
  escape_backslash = FALSE,
  locale = vroom::default_locale(),
  guess_max = 100,
  #  altrep = TRUE,
  #  altrep_opts = deprecated(),
  num_threads = interlacer_threads(),
  progress = interlacer_progress(),
  show_col_types = interlacer_show_col_types(),
  .name_repair = "unique"
) {
  std_opts <- list2(
    file = file,
    delim = delim,
    col_names = col_names,
    # col_types
    # col_select
    # id
    skip = skip,
    n_max = n_max,
    # na
    quote = quote,
    comment = comment,
    skip_empty_rows = skip_empty_rows,
    trim_ws = trim_ws,
    escape_double = escape_double,
    escape_backslash = escape_backslash,
    locale = locale,
    guess_max = guess_max,
    altrep = FALSE,
    # num_threads
    progress = FALSE,
    show_col_types = FALSE,
    .name_repair = "check_unique",
  )

  col_spec <- as.col_spec(col_types)

  col_spec_names <- names(col_spec$cols) %||% rep_along(col_spec$cols, "")
  if (length(col_spec_names) > 0 && any(col_spec_names == "")) {
    cli_abort(
      "`col_types` arg must include column names",
      "definitions based on column order not supported (yet)"
    )
  }

  if (!is.null(id)) {
    cli_abort(
      "`id` arg not supported (yet)"
    )
  }

  # Step 1: Read everything as string

  df_chr <- inject(
    vroom(
      !!!std_opts,
      col_types = cols(.default = "c"),
      col_select = {{ col_select }},
      id = NULL,
      na = character(),
      num_threads = num_threads
    )
  )

  # Get rename map from cols_select
  col_select_quo <- vroom_enquo(enquo(col_select))
  if (inherits(col_select_quo, "quosures") || !quo_is_null(col_select_quo)) {
    if (inherits(col_select_quo, "quosures")) {
      vars <- tidyselect::vars_select(
        names(spec(df_chr)$cols), !!!col_select_quo
      )
    } else {
      vars <- tidyselect::vars_select(
        names(spec(df_chr)$cols), !!col_select_quo
      )
    }
  } else {
    vars <- set_names(names(df_chr), names(df_chr))
  }

  # Rename cols back to original names
  names(df_chr) <- vars

  # Step 2: For each of the resulting columns, go back and convert values

  out <- parallel::mclapply(set_names(vars, vars), function(i) {
    collector <- col_spec$cols[[i]] %||% col_spec$default

    all_na_values <- unique(c(collector$na, na))

    vroom_call <- withWarnings(
      inject(
        vroom(
          !!!std_opts,
          col_types = col_spec,
          col_select = i,
          id = NULL,
          na = all_na_values,
          num_threads = 1
        )
      )
    )

    value_df <- vroom_call$value

    values <- value_df[[1]]

    na_values <- factor(
      ifelse(df_chr[[i]] %in% all_na_values, df_chr[[i]], NA),
      levels = all_na_values
    )

    spec <- attr(value_df, "spec")$cols

    spec_is_skip <- vapply(
      spec, \(x) inherits(x, "collector_skip"), logical(1)
    )

    vroom_collector <- spec[which(!spec_is_skip)][[1]]

    if (inherits(collector, "collector_guess")) {
      collector_used <- vroom_collector
    } else {
      collector_used <- collector
    }

    # TODO: update progress

    list(
      values = new_interlaced(values, na_values),
      problems = vroom_call$warnings,
      spec = collector_used
    )
  }, mc.cores = num_threads)

  df <- as_tibble(lapply(out, `[[`, "values"), .name_repair = .name_repair)

  # Replace spec cols from chr spec into values col specs
  values_spec <- spec(df_chr)
  values_spec$cols[names(out)] <- lapply(out, `[[`, "spec")
  values_spec$default <- col_spec$default
  attr(df, "spec") <- values_spec

  # Rename result to names from col_select
  names(df) <- names(vars)

  # Show col types if requested
  if (should_show_col_types(!is.null(col_types), show_col_types)) {
    show_col_types(df, locale)
  }

  # I'd like to hoover up all the vroom problems and put them together as a
  # `problems` attr on the result, but I can't because of this bug:
  # https://github.com/tidyverse/vroom/issues/534
  #
  # Instead, I just warn if there was an issue...
  for (i in names(df)) {
    for (w in out[[i]]$problems) {
      if (inherits(w, "vroom_parse_issue")) {
        cli_warn("column `{i}` had a vroom parse issue")
      } else {
        cli_warn(
          c(
            "unexpected vroom warning on column `{i}`",
            ">" = "{w}"
          )
        )
      }
    }
  }

  df
}

