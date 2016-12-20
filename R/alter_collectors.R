#' @export
alter_collector <- function(pars){

  id_colector = pars$id
  params = pars$data

  hdrs <- build_header()

  url = sprintf("https://api.surveymonkey.net/v3/collectors/%s", id_colector)

  httr::POST(url, body = params, encode = "json", httr::add_headers(.headers = hdrs))
}

#' @export
alter_collectors <- function(pars){
  lapply(pars, alter_collector)
}
