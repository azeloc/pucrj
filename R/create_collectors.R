#' Avaliable parameters:
#'
#' edit_response_type - "until_complete","never", "always"
#'
#' @export
create_collector <- function(params){

  hdrs <- build_header()

  survey_id = options()$survey_id
  url = sprintf("https://api.surveymonkey.net/v3/surveys/%s/collectors", survey_id)

  httr::POST(url, body = params, encode = "json", httr::add_headers(.headers = hdrs))
}

#' @export
create_collectors <- function(N, pars){

  sapply(1:N, create_collector, params = pars)

}
