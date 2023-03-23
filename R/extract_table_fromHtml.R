#' Extract table from api request
#'
#' @param res the GET result
#' @return data frame
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_table
#' @importFrom dplyr select mutate
#' @export
extract_table_fromHtml <- function(res) {
  df.blast = res |>
    read_html() |>
    html_nodes(xpath = '//table[@id="dscTable"]') |>
    html_table()
  df.blast = df.blast[[1]]
  df.blast2 = df.blast |>
    select(-1) |>
    mutate(scientific_name = NA)
  # get the scientific name
  ls.string = strsplit(df.blast2$Description, " ")
  strings = lapply(ls.string, function(X) {
      counter = 2
      if (grepl("voucher|subsp", X) |> any()) {counter = counter + 1}
      if (grepl("PREDICTED", X) |> any()) {counter = counter + 1}
      string = X[1:counter] |> paste(collapse = " ")
      return(string)
    }) |> unlist()
  df.blast2$scientific_name = strings
  return(df.blast2)
}
