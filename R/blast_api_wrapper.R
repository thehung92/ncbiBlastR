#' Wrapper for blast api
#'
#' use for blast the nucleotide sequence on ncbi blast database
#' notes: only get 20 result, run with megablast option for fast query
#'
#' @param seq a sequence in character format
#' @return a GET result that can be parse with read_html
#' @examples
#' data(rbcLseq)
#' res = blast_api_wrapper(rbcLseq)
#' data(rbcLres)
#' res |>
#'  extract_table_fromGET()
#' @export
blast_api_wrapper <- function(seq, verbose = FALSE) {
  # start with megablast
  info = blast_api_megablast(seq)
  rid = info["RID"]
  rtoe = info["RTOE"]
  if (verbose) {print(rid); print(rtoe)}
  # check the status
  status = wait_and_check(rid, rtoe)
  # if there is no hit, redirection to rerun
  if (status == "rerun") {
    info = blast_api_blastn(seq)
    status = wait_and_check(info)
    # stop if there still no hhit
    if (status == "rerun") {
      stop("There are no hits of this sequence with blastn")
    }
  }
  # get the result in html format
  res = query_result(rid)
  return(res)
}
