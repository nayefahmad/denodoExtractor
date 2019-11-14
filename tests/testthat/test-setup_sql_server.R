test_that("ODBC connection to SQL server is working okay", {

  setup_sql_server()

  expect_true(exists("vw_adtc_ad_view"))
  expect_true(exists("vw_ed_mart"))

})
