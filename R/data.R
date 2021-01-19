#' Data for this paper
#'
#' Returns the location of the datasets used on this paper, downloading the files
#' if needed.
#'
#'
#' HadSST is downloaded from the MetOffice website.
#' CMAP is downloaded from NOAA's Physical Sciences Laboratory FTP
#'
#' @references
#' Rayner, N. A.; Parker, D. E.; Horton, E. B.; Folland, C. K.; Alexander, L. V.; Rowell, D. P.; Kent, E. C.; Kaplan, A. (2003) Global analyses of sea surface temperature, sea ice, and night marine air temperature since the late nineteenth century J. Geophys. Res.Vol. 108, No. D14, 4407 10.1029/2002JD002670
#'
#' @export
#' @rdname data
HADSST <- function() {
  had_file <- here::here("analysis", "data", "raw_data", "hadsst.nc")

  if (!file.exists(had_file)) {
    message("Downloading data...")
    hadsst <- "https://www.metoffice.gov.uk/hadobs/hadisst/data/HadISST_sst.nc.gz"
    had_zip <- tempfile()

    download.file(hadsst, had_zip, mode = "wb")
    R.utils::gunzip(had_zip, had_file, remove = FALSE)
  }

  return(had_file)

}


#' @export
#' @rdname data
CMAP <- function() {
  file <-  here::here("analysis", "data", "raw_data", "CMAP.nc")
  if (!file.exists(file)) {
    message("Downloading data...")

    # Do I need this?
    # web_url <- "https://psl.noaa.gov/cgi-bin/GrADS.pl?dataset=CPC+Merged+Analysis+of+Precipitation+Standard&DB_did=8&file=%2FDatasets%2Fcmap%2Fstd%2Fprecip.mon.mean.nc&variable=precip&DB_vid=3053&DB_tid=90282&units=mm%2Fday&longstat=Mean&DB_statistic=Mean&stat=&lat-begin=88.75S&lat-end=10&lon-begin=1.25E&lon-end=358.75E&dim0=time&year_begin=1979&mon_begin=Jan&year_end=2020&mon_end=Dec&X=lon&Y=lat&output=file&bckgrnd=black&use_color=on&fill=lines&cint=&range1=&range2=&scale=100&submit=Create+Plot+or+Subset+of+Data"
    #
    # session <- rvest::html_session(web_url)
    # links <- rvest::html_nodes(session, "a")
    # text <- rvest::html_text(links)
    # urls <- rvest::html_attr(links, "href")
    #
    # url <- urls[text == "FTP a copy of the file"]

    url <- "ftp://ftp2.psl.noaa.gov/Public/www/X190.245.61.250.18.6.27.31.nc"

    download.file(url, file, mode = "wb")
  }

  return(file)
}
