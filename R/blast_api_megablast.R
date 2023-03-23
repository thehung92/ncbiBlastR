#' Wrapper for blas api megablast
#'
#' use to start the blastn program for nucleotide sequence
#' notes: at the start of the wrapper for fast result
#' @param seq a sequence in character format
#' @return an info vector with RID and RTOE (estimate time in second)
blast_api_megablast <- function(seq) {
  cat("Submit blastn megablast\n")
  url = "https://blast.ncbi.nlm.nih.gov/Blast.cgi"
  # submit the request
  res = httr::GET(url, query = list(
    QUERY = seq,
    DATABASE = "nt",
    PROGRAM = "blastn", MEGABLAST = "on",
    FORMAT_TYPE = "JSON",
    HITLIST_SIZE = 20,
    CMD = "Put"
  ))
  # get the RID inside the comment block from the returned html
  info = parse_html_comment(res)
  info = strsplit(info, "\n")[[1]]
  info = grep("=", info, value = TRUE) |> trimws()
  ls.info = strsplit(info, " = ")
  info2 = lapply(ls.info, function(X){
    key = trimws(X[1])
    value = trimws(X[2])
    names(value) = key
    return(value)
  }) |> unlist()
  return(info2)
}
