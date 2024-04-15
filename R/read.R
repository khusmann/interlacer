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
  na = c("", "NA"),
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
  na = c("", "NA"),
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
  na = c("", "NA"),
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
  na = c("", "NA"),
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

  col_spec <- as.col_spec(col_types)
  is_unnamed_col_spec <- is.null(names(col_spec$cols))

  if (length(col_spec$cols) > 0 && !is_unnamed_col_spec) {
    if (any(names(col_spec$cols) == "")) {
      cli_abort(
        "{.arg col_type} cannot have a mix of named and unnamed values"
      )
    }
  }

  if (!is.null(id)) {
    cli_abort(
      "{.arg id} arg not supported (yet)"
    )
  }

  # Step 1: Read everything as string

  df_chr <- inject(
    vroom::vroom(
      !!!std_opts,
      col_types = cols(.default = "c"),
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
  vars <- vroom_col_select_map({{col_select}}, spec(df_chr))
  names(df_chr) <- vars

  # Set names of unnamed col_specs according to the columns vroom found
  if (length(col_spec$cols) > 0 && is_unnamed_col_spec) {
    col_spec_names <- names(spec(df_chr)$cols)

    if (length(col_spec$cols) != length(col_spec_names)) {
      cli_warn(
        paste0(
          "mismatch between number of unnamed columns defined in ",
          "{.arg col_types} ({length(col_spec$cols)}) and columns found in ",
          "file ({length(col_spec_names)})"
        )
      )
    }

    col_spec$cols <- col_spec$cols[seq_along(col_spec_names)]

    col_spec_is_null <- vapply(col_spec$cols, is.null, logical(1))

    col_spec$cols[col_spec_is_null] <- list(col_guess())

    names(col_spec$cols) <- names(spec(df_chr)$cols)
  }

  # Step 2: For each of the resulting columns, go back and convert values

  if (progress) {
    p <- cli_progress_bar("Loading", total = length(vars))
  }

  out <- lapply(set_names(vars, vars), function(i) {
    collector <- col_spec$cols[[i]] %||% col_spec$default

    all_na_values <- unique(c(collector$na, na))

    vroom_call <- withWarnings(
      inject(
        vroom::vroom(
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

    vroom_cols <- spec(value_df)$cols

    spec_is_skip <- vapply(
      vroom_cols, \(x) inherits(x, "collector_skip"), logical(1)
    )

    vroom_collector <- vroom_cols[which(!spec_is_skip)][[1]]

    if (inherits(collector, "collector_guess")) {
      collector_used <- vroom_collector
    } else {
      collector_used <- collector
    }

    if (progress) {
      cli_progress_update(id = p)
    }

    list(
      values = new_interlaced(values, na_values),
      problems = vroom_call$warnings,
      spec = collector_used
    )
  })

  df <- as_tibble(lapply(out, `[[`, "values"), .name_repair = .name_repair)

  # Replace spec cols from chr spec into values col specs
  values_spec <- spec(df_chr)
  values_spec$cols[names(out)] <- lapply(out, `[[`, "spec")
  values_spec$default <- col_spec$default
  attr(df, "spec") <- values_spec

  # Rename result to names from col_select
  names(df) <- names(vars)

  # Show col types if requested
  if (vroom_should_show_col_types(!is.null(col_types), show_col_types)) {
    vroom_show_col_types(df, locale)
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

