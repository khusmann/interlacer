#' Get a path to one of interlacer's example data sets
#'
#' interlacer comes bundled with a number of sample files in its `inst/extdata`
#' directory. This function make them easy to access
#'
#' @inheritParams readr::readr_example
#' @export
#' @examples
#' interlacer_example()
#' interlacer_example("colors.csv")
interlacer_example <- function(file = NULL) {
  if (is.null(file)) {
    dir(system.file("extdata", package = "interlacer"))
  } else {
    system.file("extdata", file, package = "interlacer", mustWork = TRUE)
  }
}
