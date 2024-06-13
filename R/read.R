#' Read an delimited file with interlaced missing reasons into a tibble
#'
#' The `read_interlaced_*()`, family of functions extend `readr`'s
#' `read_delim()`, `read_csv`, etc. functions for use on data sources where
#' values are interlaced with missing reasons. These functions return a tibble
#' with `interlaced` columns.
#'
#' @inheritParams readr::read_delim
#' @inheritParams vroom::vroom
#'
#' @param na 	A NA col spec defined by `na_cols()` or a character or numeric
#' vector of values to interpret as missing values.
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
  na = na_col_none(),
  comment = "",
  trim_ws = FALSE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  # num_threads = readr::readr_threads(),
  progress = readr::show_progress(),
  show_col_types = readr::should_show_types(),
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
    # num_threads = num_threads,
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
  na = na_col_none(),
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  # num_threads = readr::readr_threads(),
  progress = readr::show_progress(),
  show_col_types = readr::should_show_types(),
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
    # num_threads = num_threads,
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
  na = na_col_none(),
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  # num_threads = readr::num_threads(),
  progress = readr::show_progress(),
  show_col_types = readr::should_show_types(),
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
    # num_threads = num_threads,
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
  na = na_col_none(),
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  # num_threads = readr::num_threads(),
  progress = readr::show_progress(),
  show_col_types = readr::should_show_types(),
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
    # num_threads = num_threads,
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
  na = na_col_none(),
  quote = "\"",
  comment = "",
  skip_empty_rows = TRUE,
  trim_ws = TRUE,
  escape_double = TRUE,
  escape_backslash = FALSE,
  locale = vroom::default_locale(),
  guess_max = 100,
  # altrep = TRUE,
  # num_threads = vroom_threads(),
  progress = vroom::vroom_progress(),
  show_col_types = NULL,
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

  xcs <- as.x_col_spec(col_types)

  x_collectors <- xcs$cols

  default_v_col <- xcs$default
  default_na_col <- as.na_collector(na)

  if (default_na_col$type == "default") {
    cli_abort("argument {.arg na} cannot be a default na collector")
  }

  default_x_col <- x_col(default_v_col, default_na_col)

  if (!is.null(id)) {
    cli_abort(
      "{.arg id} arg not supported (yet)"
    )
  }

  # Step 1: Read everything as string

  df_chr <- inject(
    vroom::vroom(
      !!!std_opts,
      col_types = vroom::cols(.default = "c"),
      col_select = {{ col_select }},
      id = NULL,
      na = character(),
      # num_threads = num_threads
    )
  )

  # IMMEDIATELY rename the cols back to their original names.
  # (We will do the final rename after loading the values)
  # `vars` has the original column names in the file, and
  # `names(vars)` is what we want to rename them to.
  vars <- vroom_col_select_map({{col_select}}, vroom::spec(df_chr))
  names(df_chr) <- vars

  # TODO: Set names of unnamed col_specs according to the columns vroom found?
  # (if we start allowing unnamed col_types)

  # Step 2: For each of the resulting columns, go back and convert values

  if (progress) {
    p <- cli_progress_bar("Loading", total = length(vars))
  }

  out <- map(set_names(vars, vars), function(i) {
    curr_x_col <- x_collectors[[i]] %||% default_x_col

    curr_v_col <- curr_x_col$value_collector
    curr_na_col <- curr_x_col$na_collector

    if (curr_na_col$type == "default") {
      curr_na_col <- default_na_col
    }

    vroom_call <- withWarnings(
      inject(
        vroom::vroom(
          !!!std_opts,
          col_types = set_names(list(curr_v_col$impl), i),
          col_select = tidyselect::all_of(i),
          id = NULL,
          na = as.character(curr_na_col$chr_values),
          # num_threads = 1
        )
      )
    )

    value_df <- vroom_call$value

    used_vroom_collector <- vroom::spec(value_df)$cols[[i]]

    if (curr_v_col$type == "guess") {
      used_x_collector <- x_col(used_vroom_collector, curr_na_col)
    } else {
      used_x_collector <- x_col(curr_v_col, curr_na_col)
    }

    values <- curr_v_col$value_fn(value_df[[1]])

    na_idx <- match(df_chr[[i]], curr_na_col$chr_values)
    na_values <- curr_na_col$values[na_idx]

    if (curr_na_col$type == "none") {
      out_values <- values
    } else {
      out_values <- new_interlaced(values, na_values)
    }

    if (progress) {
      cli_progress_update(id = p)
    }

    list(
      values = out_values,
      problems = vroom_call$warnings,
      x_spec = used_x_collector
    )
  })

  df <- as_tibble(map(out, \(i) i$values), .name_repair = .name_repair)

  # Replace spec cols from chr spec into values col specs
  attr(df, "x_spec") <- as.x_col_spec(map(out, \(i) i$x_spec))

  # Rename result to names from col_select
  names(df) <- names(vars)

  # Show col types if requested
  if (
    !is_testing() &&
    should_show_col_types(!is.null(col_types), show_col_types)
  ) {
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

should_show_col_types <- function(has_col_types, show_col_types) {
  if (is.null(show_col_types)) {
    return(isTRUE(!has_col_types))
  }
  isTRUE(show_col_types)
}

show_col_types <- function(x, locale) {
  show_dims(x)
  summary(x_spec(x), locale = locale)
  cli_block(class = "interlacer_x_spec_message", {
    cli::cli_verbatim("\n\n")
    cli::cli_alert_info("Use {.fn x_spec} to retrieve the full column specification for this data.")
    cli::cli_alert_info("Specify the column types or set {.arg show_col_types = FALSE} to quiet this message.")
  })
}

show_dims <- function(x) {
  cli_block(class = "interlacer_dim_message", {
    cli::cli_text("
      {.strong Rows: }{.val {NROW(x)}}
      {.strong Columns: }{.val {NCOL(x)}}
      ")
  })
}
