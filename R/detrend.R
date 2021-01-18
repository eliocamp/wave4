#' Fast detrend
#'
#' Removes a linear trend.
#'
#' @param x numeric vector to be detrended.
#'
#' @return
#' A numeric vector of the same length as x with detrended values.
#'
#' @examples
#' x <- rnorm(10) + 1:10
#'
#' detrend(x)
#'
#' @export
detrend <- function(x) {
  nas <- is.na(x)
  m <- mean(x, na.rm = TRUE)
  y <- seq_along(x)
  x[!nas] <- .lm.fit(cbind(1, y[!nas]), x[!nas])$residuals
  return(x + m)
}
