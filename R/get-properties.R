#' Get property info
#'
#' To get a full list of all Observable Properties in Observations, you can use
#' the /properties endpoint - this will return all observable properties across
#' all source datasets.
#'
#' @return Data frame
#' @export
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @examples
#' properties <- get_properties()
get_properties <- function() {
  path = paste0("/ecology/api/v1/properties?skip=0&take=250")
  response <- GET(ead::ead_data, path = path)
  data <- fromJSON(content(response, "text"), flatten = TRUE)
  data <- data.frame(data)
}
