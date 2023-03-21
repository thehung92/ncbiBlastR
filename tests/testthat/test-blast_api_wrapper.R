test_that("sampling DNA_BASES from Biostrings", {
  set.seed(1234)
  seq = sample(Biostrings::DNA_BASES, 30, replace=TRUE) |>
    paste(collapse="")
  expect_equal(seq, "TTCCATGAACTTCGCCCGCTCCTCTTATTT")
})

test_that("load external data file", {
  file = system.file('extdata', package='ncbiBlastR') |> list.files(full.names=TRUE)
  lines = readLines(file)
  lines = lines[-1]
  seq = paste(lines, collapse = "")
  #
  test_return = nchar(seq)
  expect_equal(test_return, 1392)
})

test_that("test the extract_table_fromGeT", {
  #rbcLres = blast_api_wrapper(rbcLseq)
  df = extract_table_fromGET(rbcLres)
  #
  expect_true(is.data.frame(df))
})
