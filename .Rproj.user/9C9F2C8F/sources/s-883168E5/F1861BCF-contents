#' Get Observations
#'
#' Query observations end point.
#'
#' @param site_id list of sites ids.
#' @param take integer max number of returned observations
#' @param skip integer number of response to skip
#' @param type_id Type of observation
#' @param ultimate_foi_id Particular feature of interest
#' @param property_id Property ID
#' @param date_from Date string '2020-11-01'
#' @param date_to Date string '2021-02-01'
#'
#' @return dataframe
#' @export
#' @examples
#' site_id = c("/environment.data.gov.uk/ecology/site/bio/43378",
#'      "/environment.data.gov.uk/ecology/site/bio/10254")
#' obs <- get_observations(site_id)
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
    site_url = paste0("http%3A%2F", site_url)
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

  response <- httr::GET(ead_data, path = path)
  data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)
  return(data)
}
