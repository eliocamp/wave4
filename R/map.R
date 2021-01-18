
#' Simple map for ggplot2
#'
#' A `geom_polygon()` with x and y scales for longitude and latitude and quickmap
#' coordinates.
#'
#' @param fill,color,size parameters passed to [ggplot2::geom_polygon()].
#' @param ticks.lat sepaeration between latitude marks
#' @param ylim latitude limites passed to [ggplot2::coord_quickmap()]
#'
#' @export
quick_map <- function(fill = "white", color = "black", size = 0.2, ticks.lat = 10, ylim = c(-55, -20)) {
  # simple and dirty map
  map <- ggplot2::map_data("world2") %>%
    subset(lat %between% c(-90, -0))

  list(geom_polygon(data = map,
                                 aes(long, lat, group = group), fill = fill, color = color,
                                 size = size),
                    scale_x_longitude(),
                    scale_y_latitude(ticks = ticks.lat),
                    coord_quickmap(ylim = ylim))
}

