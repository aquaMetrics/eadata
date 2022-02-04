#' Get Taxon Info
#'
#' To get a full list of all of species.
#'
#' @return Data frame
#' @export
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @examples
#' properties <- get_taxa()
get_taxa <- function() {
  path = paste0("ecology/api/v1/taxa?skip=0&take=18000")
  response <- GET(eadata::ead_data, path = path)
  data <- fromJSON(content(response, "text"), flatten = TRUE)
  data <- data.frame(data)
}
