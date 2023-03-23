#' Parse html comment from the query request
#'
#' This function will parse all the comment, then search for pattern 'QBlastInfo'
#'
#' @param res response object from GET in html format
#' @return a named vector of strings
#' @export
parse_html_comment <- function(res) {
  # parse comment from html
  res.html = res |> xml2::read_html()
  comments = res.html |>
    xml2::xml_find_all("//comment()") |>
    as.character()
  # parse pattern in comment
  searchinfo = grep("QBlastInfo", comments, value = TRUE)
  return(searchinfo)
}
