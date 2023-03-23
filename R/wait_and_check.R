#' wait and check if there are hits
#'
#' Use after submit of
#' @param info parsed from GET result
#' @export
#' @keywords internal
wait_and_check <- function(rid, rtoe = 30, verbose = FALSE) {
  if (verbose == TRUE) {
    # return the info to check manually
    print(rid)
    print(rtoe)
  }
  # check the status of the search after the estimated time
  status = FALSE
  counter = 5
  # in while loop
  while (!status) {
    # check counter to break the loop if it run too long
    if (counter == 0) {
      # wait for user input
      input = ""
      while (!input %in% c("Y", "N")) {
        input = readline("The api took too long to respond. Do you want to wait for another minute? [YN]: ")
      }
      # return the res for the user to check manually if cancel now
      if (input %in% c("Y","y")) {
        counter = 5
      } else if (input %in% c("N","n")) {
        print(rid)
        print(rtoe)
        res <<- res
        break
      }
    }
    cat(paste0("Wait for it ... (", rtoe, "s) ...\n"))
    Sys.sleep(as.numeric(rtoe))
    res = query_searchinfo(rid)
    # parse the response from the server for QBlastInfo
    searchinfo = parse_html_comment(res)
    # check if Status = READY # assign status = TRUE to stop the loop
    status = grepl("Status=READY", searchinfo, fixed = TRUE) %>% any()
    # for subsequent loop, use shorter wait time
    rtoe = 15
    counter = counter - 1
  }
  # check if there are hits after the loop break with status = TRUE
  if (grepl("ThereAreHits=yes", searchinfo, fixed = TRUE) %>% any()) {
    status = "yes"
  } else {
    status = "rerun"
  }
  # explicit return
  return(status)
}
