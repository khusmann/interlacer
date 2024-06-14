## Misc internal functions from vroom

# nocov start

col_concise <- function(x) {
  switch(x,
         "_" = ,
         "skip" =,
         "NULL" =,
         "-" = vroom::col_skip(),
         "NA" = ,
         "?" = vroom::col_guess(),
         character =,
         c = vroom::col_character(),
         factor =,
         f = vroom::col_factor(),
         double =,
         numeric =,
         d = vroom::col_double(),
         integer =,
         i = vroom::col_integer(),
         big_integer =,
         I = vroom::col_big_integer(),
         logical = ,
         l = vroom::col_logical(),
         number = ,
         n = vroom::col_number(),
         date = ,
         Date = ,
         D = vroom::col_date(),
         datetime = ,
         POSIXct = ,
         T = vroom::col_datetime(),
         time =,
         t = vroom::col_time(),
         stop("Unknown shortcut: ", x, call. = FALSE)
  )
}

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
