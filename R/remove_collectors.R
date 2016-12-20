remove_collector <- function(id_colector){
  hdrs <- build_header()

  url = sprintf("https://api.surveymonkey.net/v3/collectors/%s", id_colector)

  httr::DELETE(url, encode = "json", httr::add_headers(.headers = hdrs))
}

#' @export
remove_collectors <- function(ids){

  sapply(ids, remove_collector)

}
