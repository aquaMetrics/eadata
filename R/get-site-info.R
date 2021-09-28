#' Get site info
#'
#' @param site_id Site identifier
#'
#' @return dataframe
#' @export
#'
#' @examples
#' site_info <-
#' get_site_info(site_id = "/environment.data.gov.uk/ecology/site/bio/43378")
get_site_info <- function(site_id = NULL) {
  site <- URLencode(URL = site_id, reserved = T)
  path = paste0("ecology/api/v1/sites/http%3A%2F", site)
  response <- GET(ead_data, path = path)
  data <- jsonlite::fromJSON(content(response, "text"), flatten = TRUE)
  data <- data.frame(data)
}
