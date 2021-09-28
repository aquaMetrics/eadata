#' Get sites
#'
#' Get a list of sites around a lat/long point. Optionally include Biosys site
#' information (such as altitude, slope etc).
#'
#' @param skip integer to skip
#' @param take integer to take
#' @param mode Get Biosys site information `minimal` (default) or `props`
#' @param type List of site identifier
#' @param lat Latitude
#' @param long Longitude
#' @param distance Distance in km from point to search
#'
#' @return Data frame
#' @export
#' @importFrom utils URLencode
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr bind_rows
#' @examples
#' site_info <- get_sites(lat = 51.44553, long = -2.54344, distance = 1, mode = "props")
get_sites <- function(skip = 0,
                      take = 250,
                      mode = "minimal",
                      type = NULL,
                      lat = NULL,
                      long = NULL,
                      distance = NULL) {
  path <- paste0(
    "ecology/api/v1/sites?skip=", skip,
    "&take=", take,
    "&mode=", mode
  )
  if (!is.null(lat) && !is.null(long)) {
    path <- paste0(
      path,
      "&long=", long,
      "&lat=", lat
    )
  }
  if (!is.null(distance)) {
    path <- paste0(
      path,
      "&distance_km=", distance
    )
  }

  response <- GET(ead::ead_data, path = path)
  data <- fromJSON(content(response, "text"), flatten = TRUE)
}
