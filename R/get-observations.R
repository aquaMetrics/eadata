#' Get Observations
#'
#' Query observations end point. In the Ecology API, the most central point of
#' interest are the Observations. Each observation has a single result for a
#' particular Observable Property for a particular Feature of Interest. This API
#' accesses hundreds of thousands of surveys and many millions of observations,
#' this means this endpoint requires at least one filter of site, observable
#' property, observation type or ultimate feature of interest.
#'
#' @param site_id list of sites ids.
#' @param take integer max number of returned observations
#' @param skip integer number of responses to skip
#' @param type_id Observation type
#' @param ultimate_foi_id Ultimate feature of interest
#' @param property_id Property type
#' @param date_from Date string '2020-11-01'
#' @param date_to Date string '2021-02-01'
#'
#' @importFrom utils URLencode
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @return dataframe
#' @export
#' @examples
#' site_id = c("http://environment.data.gov.uk/ecology/site/bio/43378",
#'      "http://environment.data.gov.uk/ecology/site/bio/10254")
#' obs <- get_observations(site_id, take = 25)
get_observations <- function(site_id = NULL,
                             take = 500,
                             skip = 0,
                             type_id = NULL,
                             property_id = NULL,
                             ultimate_foi_id = NULL,
                             date_from = NULL,
                             date_to = NULL) {
  path <- paste0("/ecology/api/v1/observations?skip=", skip, "&take=", take)

  if (!is.null(site_id[1])) {
    site_url <- URLencode(URL = site_id, reserved = T)
    site_query <- paste("site_id=", site_url, sep = "", collapse = "&")
    path <- paste0(path, "&", site_query)
  }

  if (!is.null(date_from) && !is.null(date_to)) {
    date_query <- paste0("&date_from=", date_from, "&date_to=", date_to)
    path <- paste0(path, date_query)
  }

  if (!is.null(type_id)) {
    type_query <- paste0("&type_id=", type_id)
    path <- paste0(path, type_query)
  }

  if (!is.null(property_id)) {
    property_query <- paste0("&property_id=", property_id)
    path <- paste0(path, property_query)
  }

  if (!is.null(ultimate_foi_id)) {
    ultimate_query <- paste0("&ultimate_foi_id=", ultimate_foi_id)
    path <- paste0(path, ultimate_query)
  }

  response <- GET(eadata::ead_data, path = path)
  response <- content(response, "text")
  data <- fromJSON(response, flatten = TRUE)
  return(data)
}
