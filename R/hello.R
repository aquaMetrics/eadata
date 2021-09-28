#
#
# get_sites <- function(lat, lon, distance) {
# url = "https://environment.data.gov.uk/"
# response <- GET(url, path = "ecology/api/v1/sites",
#                 query = "lat=51.44553&long=-2.54344&distance=5")
# data <- jsonlite::fromJSON(content(response, "text"), simplifyVector = FALSE)
# purrr::map(data, data.frame) %>% bind_rows()
# }
#
#
#
# get_surveys <- function(lat = NULL, lon = NULL, distance = NULL, date_from = NULL, date_to = NULL) {
#   # date_to = "2016-01-15"
#   # date_from = "2016-01-01"
#   # lat = unique(data$lat)
#   # lon = unique(data$lon)
#   url = "https://environment.data.gov.uk/"
#   path = paste0("ecology/api/v1/surveys?skip=0&take=250&lat=", lat,
#                 "&long=", lon)
#   response <- GET(url, path = path)
#   data <- jsonlite::fromJSON(content(response, "text"), flatten = TRUE)
#   data <- data.frame(data)
#
# }
#
# get_survey <- function(survey_id) {
#
#
#   # survey_id = "http://environment.data.gov.uk/ecology/sampling/bio/842951"
#   survey_id <- URLencode(URL = survey_id,reserved = T)
#
#   url = "https://environment.data.gov.uk/"
#   path = paste0("ecology/api/v1/surveys/", survey_id)
#   response <- GET(url, path = path)
#   data <- jsonlite::fromJSON(content(response, "text"), flatten = TRUE)
#   data <- data.frame(data)
#   data$observations.simple_result <- as.character(data$observations.simple_result)
#   return(data)
# }



