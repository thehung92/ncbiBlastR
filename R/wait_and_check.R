#' wait and check if there are hits
#'
#' Use after submit of
#' @param info parsed from GET result
#' @export
#' @keywords internal
wait_and_check <- function(info) {
  # check the status of the search after the estimated time
  status = FALSE
  while (!status) {
    cat(paste0("wait ", info["RTOE"], "s\n"))
    Sys.sleep(as.numeric(info["RTOE"]))
    url = "https://blast.ncbi.nlm.nih.gov/Blast.cgi"
    res2 = httr::GET(url, query = list(
      CMD = "Get", FORMAT_OBJECT = "SearchInfo",
      RID = info["RID"]
    ))
    info2 = res2 |>
      xml2::read_html() |>
      xml2::xml_find_all("//comment()") |>
      as.character() |>
      stringr::str_subset("QBlastInfo")
    status = stringr::str_subset(info2, "Status") |>
      stringr::str_detect("READY")
  }
  # check if there are hits
  boolean = stringr::str_subset(info2, "ThereAreHits") |>
    stringr::str_detect("=yes")
  if (boolean) {
    status = "yes"
  } else {
    status = "rerun"
  }
  return(status)
}
