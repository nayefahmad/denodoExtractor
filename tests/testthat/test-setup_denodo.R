test_that("ODBC connection is working okay", {

  setup_denodo()

  expect_true(exists("vw_adtc"))
  expect_true(exists("vw_eddata"))
  expect_true(exists("vw_census"))
})
