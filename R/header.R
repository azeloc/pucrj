#' @export
setup <- function(acl, sid){
  options(access_link = acl)
  options(survey_id = sid)
}

build_header <- function(){
  act <- sprintf('Bearer %s', options()$access_link)
  type <- "application/json"

  hdrs <- c(act, type)
  names(hdrs) <- c("Authorization","Content-Type")

  hdrs
}
