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
#' @param na_col_types TODO
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
  na_col_types = NULL,
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
    na_col_types = na_col_types,
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
  na_col_types = NULL,
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
    na_col_types = na_col_types,
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
  na_col_types = NULL,
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
    na_col_types = na_col_types,
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
  na_col_types = NULL,
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
    na_col_types = na_col_types,
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
  na_col_types = NULL,
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
  na_col_spec <- as.col_spec(na_col_types)

  check_col_spec(col_spec, "col_types")
  check_col_spec(na_col_spec, "na_col_types")

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
  col_spec <- fix_col_spec_names(
    col_spec,
    names(spec(df_chr)$cols),
    "col_types"
  )

  na_col_spec <- fix_col_spec_names(
    na_col_spec,
    names(spec(df_chr)$cols),
    "na_col_types"
  )

  # Step 2: For each of the resulting columns, go back and convert values

  if (progress) {
    p <- cli_progress_bar("Loading", total = length(vars))
  }

  out <- map(set_names(vars, vars), function(i) {
    collector <- col_spec$cols[[i]] %||% col_spec$default
    na_collector <- na_col_spec$cols[[i]] %||% na_col_spec$default

    all_na_values <- unique(vec_c(collector$na, na))

    vroom_call <- withWarnings(
      inject(
        vroom::vroom(
          !!!std_opts,
          col_types = col_spec,
          col_select = tidyselect::all_of(i),
          id = NULL,
          na = all_na_values
          # num_threads = 1
        )
      )
    )

    value_df <- vroom_call$value

    values <- value_df[[1]]

    if (inherits(na_collector, "collector_skip")) {
      out_value <- values
      used_na_collector <- na_collector
    } else {
      all_na_values_conv <- type_convert_col(
        all_na_values,
        na_collector,
        na = character()
      )
      na_values <- all_na_values_conv[match(df_chr[[i]], all_na_values)]

      out_value <- new_interlaced(values, na_values)
      used_na_collector <- type_to_col(na_values)
    }

    # If collector is not collector_guess, we want to use that because it
    # might be an icol_*. Otherwise just use the vroom collector
    used_collector <- detect(
      c(list(collector), spec(value_df)$cols),
      \(x) !inherits(x, "collector_skip") && !inherits(x, "collector_guess")
    )

    if (progress) {
      cli_progress_update(id = p)
    }

    list(
      values = out_value,
      problems = vroom_call$warnings,
      spec = used_collector,
      na_spec = used_na_collector
    )
  })

  df <- as_tibble(map(out, \(i) i$values), .name_repair = .name_repair)

  # Replace spec cols from chr spec into values col specs
  attr(df, "spec") <- update_col_spec(
    spec(df_chr), map(out, \(i) i$spec), col_spec$default
  )

  # Replace na_spec cols from chr spec into na_values col spec
  attr(df, "na_spec") <- update_col_spec(
    spec(df_chr), map(out, \(i) i$na_spec), na_col_spec$default
  )

  # Rename result to names from col_select
  names(df) <- names(vars)

  # Show col types if requested
  if (
    !is_testing() &&
    vroom_should_show_col_types(!is.null(col_types), show_col_types)
  ) {
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

#' @export
na_spec <- function(df) {
  attr(df, "na_spec")
}

check_col_spec <- function(col_spec, arg) {
  is_unnamed_col_spec <- is.null(names(col_spec$cols))

  if (length(col_spec$cols) > 0 && is_unnamed_col_spec) {
    if (any(names(col_spec$cols) == "")) {
      cli_abort(
        "{.arg arg} cannot have a mix of named and unnamed values"
      )
    }
  }
}

update_col_spec <- function(col_spec, update_list, default) {
  col_spec$cols[names(update_list)] <- update_list
  col_spec$default <- default
  col_spec
}

fix_col_spec_names <- function(col_spec, spec_names, arg) {
  is_unnamed_col_spec <- is.null(names(col_spec$cols))

  if (length(col_spec$cols) > 0 && is_unnamed_col_spec) {
    if (length(col_spec$cols) != length(spec_names)) {
      cli_warn(
        paste0(
          "mismatch between number of unnamed columns defined in ",
          "{.arg arg} ({length(col_spec$cols)}) and columns found in ",
          "file ({length(spec_names)})"
        )
      )
    }

    col_spec$cols <- map(
      set_names(seq_along(spec_names), spec_names),
      \(i) col_spec$cols[i][[1]] %||% col_guess()
    )
  }
  col_spec
}
