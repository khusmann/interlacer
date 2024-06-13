## Misc internal functions from vroom

# nocov start

cli_block <- function(expr, class = NULL, type = rlang::inform) {
  msg <- ""
  withCallingHandlers(
    expr,
    message = function(x) {
      msg <<- paste0(msg, x$message)
      invokeRestart("muffleMessage")
    }
  )
  msg <- sub("^\n", "", msg)
  msg <- sub("\n+$", "", msg)

  type(msg, class = class)
}

vroom_col_select_map <- function(col_select, col_spec) {
  col_select <- vroom_enquo(enquo(col_select))
  if (inherits(col_select, "quosures") || !quo_is_null(col_select)) {
    if (inherits(col_select, "quosures")) {
      vars <- tidyselect::vars_select(
        names(col_spec$cols), !!!col_select
      )
    } else {
      vars <- tidyselect::vars_select(
        names(col_spec$cols), !!col_select
      )
    }
  } else {
    vars <- set_names(names(col_spec$cols), names(col_spec$cols))
  }
  vars
}

vroom_enquo <- function(x) {
  if (quo_is_call(x, "c") || quo_is_call(x, "list")) {
    return(as_quosures(get_expr(x)[-1], get_env(x)))
  }
  x
}

# nocov end
