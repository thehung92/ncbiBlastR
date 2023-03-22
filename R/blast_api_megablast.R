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
  page.res = xml2::read_html(res)
  vt.comment = xml2::read_html(res) |>
    xml2::xml_find_all(xpath = "//comment()") |>
    as.character()
  info = stringr::str_subset(vt.comment, "QBlastInfoBegin")
  info2 = info |> stringr::str_split("\n") |> unlist() |>
    stringr::str_subset("=") |> trimws()
  info3 = info2 |> stringr::str_split("=") |>
    lapply(function(X){
      key = trimws(X[1])
      value = trimws(X[2])
      names(value) = key
      return(value)
    }) |> unlist()
  return(info3)
}
