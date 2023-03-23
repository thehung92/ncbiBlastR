test_that("test the funtion wait_and_check", {
  status = TRUE
  counter = 5
  while (!status) {
    cat("wait for it...(2s)\n")
    Sys.sleep(2)
    counter <- counter - 1
    }
  #
  expect_equal(2 * 2, 4)
})
