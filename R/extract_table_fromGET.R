#' Extract table from api request
#'
#' @param res the GET result
#' @return data frame
#' @export
extract_table_fromGET <- function(res) {
  df.blast = res |>
    xml2::read_html() |>
    rvest::html_nodes(xpath = '//table[@id="dscTable"]') |>
    rvest::html_table()
  df.blast = df.blast[[1]]
  df.blast2 = df.blast |>
    dplyr::select(-1) |>
    clean_names() |>
    dplyr::mutate(scientific_name = NA)
  # get the scientific name
  vt.sciName = df.blast2$description |>
    stringr::str_split(" ") |>
    lapply(function(X){
      vt.logi = grepl("voucher|subsp", X)
      if (any(vt.logi)) {
        X[1:(which(vt.logi)+1)] |>
          paste(collapse = " ")
      } else {
        X[1:2] |> paste(collapse = " ")
      }
    })
  df.blast2$scientific_name = vt.sciName
  return(df.blast2)
}
