#' HadSST data
#'
#' Returns the location of the HadSST file location, downloading the data from
#' the MetOffice website if needed.
#'
#' @references
#' Rayner, N. A.; Parker, D. E.; Horton, E. B.; Folland, C. K.; Alexander, L. V.; Rowell, D. P.; Kent, E. C.; Kaplan, A. (2003) Global analyses of sea surface temperature, sea ice, and night marine air temperature since the late nineteenth century J. Geophys. Res.Vol. 108, No. D14, 4407 10.1029/2002JD002670
#'
#' @export
HADSST <- function() {
  had_file <- here::here("analysis", "data", "hadsst.nc")

  if (!file.exists(had_file)) {
    message("Downloading data...")
    hadsst <- "https://www.metoffice.gov.uk/hadobs/hadisst/data/HadISST_sst.nc.gz"
    had_zip <- tempfile()

    download.file(hadsst, had_zip, mode = "wb")
    R.utils::gunzip(had_zip, had_file, remove = FALSE)
  }

  return(had_file)

}
