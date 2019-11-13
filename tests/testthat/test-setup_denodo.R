test_that("ODBC connection to denodo is working okay", {

  setup_denodo()

  expect_true(exists("vw_admission_discharge"))
  expect_true(exists("vw_eddata"))
  expect_true(exists("vw_census"))
})
