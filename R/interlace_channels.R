#' Re-interlacce a deinterlaced data frame
#'
#' @description
#'
#' This function will take a deinterlaced data frame and re-interlace it by
#' combining value and misisng reason column pairs into single character
#' columns.
#'
#' @param x A deinterlaced data frame
#'
#' @returns An interlaced data frame, that is, a data frame with character columns
#' that contain both values and missing reasons.
#'
#' @export
interlace_channels <- function(x) {
  abort_if_deinterlace_df_problems(x)

  # TODO: this is another function that would benefit from native speedup

  lapply(value_names(x), function(value_name) {
    values <- x[[value_name]]
    missing_name <- to_missing_name(value_name)
    missing_values <- x[[missing_name]]

    if_else(
      is.na(missing_values),
      as.character(values),
      as.character(missing_values),
    )
  }) |>
    set_names(value_names(x)) |>
    bind_cols()
}
