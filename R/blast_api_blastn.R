#' Wrapper for blast api blastn
#'
#' use for blastn the nucleotide sequence on ncbi blast database
#' notes: only get 20 result, slower then megablast
#' submit when there are no hits
#'
#' @param seq a sequence in character format
#' @return an info vector with RID and RTOE (estimate time in second)
#' @importFrom httr GET
blast_api_blastn <- function(seq) {
  cat("Submit blastn\n")
  url = "https://blast.ncbi.nlm.nih.gov/Blast.cgi"
  # submit the request without megablast option
  res = GET(url, query = list(
    QUERY = seq,
    DATABASE = "nt",
    PROGRAM = "blastn",
    HITLIST_SIZE = 20,
    CMD = "Put"
  ))
  # get the RID inside the comment block from the returned html
  info = parse_html_comment(res)
  info = strsplit(info, "\n")[[1]]
  info = grep("=", info, value = TRUE) %>% trimws()
  ls.info = strsplit(info, " = ")
  info2 = lapply(ls.info, function(X){
    key = trimws(X[1])
    value = trimws(X[2])
    names(value) = key
    return(value)
  }) %>% unlist()
  return(info2)
}
