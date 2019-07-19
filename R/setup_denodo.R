#' Set up ODBC connection to denodo
#'
#' @param dsn_name A string specifying connection name. Default value is "cnx_denodo_spappcsta001", because that's the name I use.
#'
#' @return
#' @export
#'
#' @examples
#' setup_denodo()
#' # should return 3 views: vw_adtc, vw_census, vw_eddata
setup_denodo <- function(dsn_name = "cnx_denodo_spappcsta001"){
  cnx <<- DBI::dbConnect(odbc::odbc(),
                         dsn = dsn_name)

  vw_census <<- dplyr::tbl(cnx,
                           dbplyr::in_schema("publish",
                                             "census"))
  vw_eddata <<- dplyr::tbl(cnx,
                           dbplyr::in_schema("publish",
                                             "emergency"))
  vw_adtc <<- dplyr::tbl(cnx,
                         dbplyr::in_schema("publish",
                                           "admission_discharge"))



}
