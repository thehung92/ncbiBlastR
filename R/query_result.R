#' Query the result of RID from ncbi blast
#'
#' use httr::GET
#' @param rid unique RID from ncbi blast PUT command
#' @return response in html format
#' @export
query_result <- function(rid){
  url = "https://blast.ncbi.nlm.nih.gov/Blast.cgi"
  res = httr::GET(url, query = list(
    CMD = "Get", RID = rid,
    FORMAT_TYPE = "HTML"
  ))
  return(res)
}
