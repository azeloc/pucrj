#' @export
list_colectors <- function(){

  hdrs <- build_header()

  survey_id = options()$survey_id
  url = sprintf("https://api.surveymonkey.net/v3/surveys/%s/collectors", survey_id)

  r <- httr::GET(url, encode = "json", httr::add_headers(.headers = hdrs))

  jsonlite::fromJSON(httr::content(r, type = "text"))
}
