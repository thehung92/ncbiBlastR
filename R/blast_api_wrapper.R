#' Wrapper for blast api
#'
#' use for blast the nucleotide sequence on ncbi blast database
#' notes: only get 20 result, run with megablast option for fast query
#'
#' @param seq a sequence in character format
#' @return a GET result that can be parse with read_html
#' @export
blast_api_wrapper <- function(seq) {
  # start with megablast
  info = blast_api_megablast(seq)
  # check the status
  status = wait_and_check(info)
  # redirection to rerun
  if (status == "rerun") {
    info = blast_api_blastn(seq)
    status = wait_and_check(info)
    # stop if there still no hhit
    if (status == "rerun") {
      stop("There are no hits of this sequence with blastn")
    }
  }
  # get the result
  url = "https://blast.ncbi.nlm.nih.gov/Blast.cgi"
  res = httr::GET(url, query = list(
    CMD = "Get", RID = info["RID"],
    FORMAT_TYPE = "HTML"
  ))
  return(res)
}
