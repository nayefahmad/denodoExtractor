test_that("Basic test - should work unless field names wrong", {

  setup_denodo()

  expect_equal(extract_admits(startdate_id = "20190101",
                              enddate_id = "20190107",
                              n_units = c("LGH 3W")) %>% nrow,
               2)
})
