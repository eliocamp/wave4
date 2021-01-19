#' Compute p.values
#'
#' Computes p.values from the result of [metR::FitLm()] (or any assumed student-t-distributed
#' statistic) with optional adjustments.
#'
#' @param estimate estimate of the regression (or other fit)
#' @param std.error standard error
#' @param df degrees of freedom
#' @param adjustment method for adjustment, see [stats::p.adjust()].
#'
#' @export
pvaluate <- function(estimate, std.error, df, adjustment = "none") {
  stats::p.adjust(2*stats::pt(abs(estimate)/std.error, df, lower.tail = FALSE), method = adjustment)
}
