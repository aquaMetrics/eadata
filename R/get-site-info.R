#' Get site info
#'
#' Biosys site information (such as altitude, slope etc).
#'
#' @param site_id List of site identifier
#'
#' @return Data frame
#' @export
#' @importFrom utils URLencode
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr bind_rows
#' @examples
site_info <-
get_site_info(site_id = c("http://environment.data.gov.uk/ecology/site/bio/43378",
"http://environment.data.gov.uk/ecology/site/fish/10060"))
get_site_info <- function(site_id = NULL) {
  site <- URLencode(URL = site_id, reserved = T)
  path = paste0("ecology/api/v1/sites/", site)
  response <- purrr::map(path, function(x) {
    Sys.sleep(0.1)
    response <- GET(ead::ead_data, path = x)
    data <- fromJSON(content(response, "text"), flatten = TRUE)
    data <- data.frame(data)
    })

  data <- bind_rows(response)
}
