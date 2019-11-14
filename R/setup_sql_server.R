

#' Set up ODBC connection to SQL Server
#'
#' @param dsn_name A string specifying connection name. Default value is "cnx_SPDBSCSTA001", because that's the name I use.
#'
#' @return Returns connections to databases
#' @export
#'
#' @examples
#' setup_sql_server()
#' # Should return views with names like vw_ed_mart, vw_adtc_ad_view, etc.
setup_sql_server <- function(dsn_name = "cnx_SPDBSCSTA001"){

  cnx <<- DBI::dbConnect(odbc::odbc(),
                         dsn = dsn_name)

  vw_ed_mart <<- dplyr::tbl(cnx, dbplyr::in_schema("EDMart.dbo",
                                                   "[vwEDVisitIdentifiedRegional]"))

  vw_adtc_ad_view <<- dplyr::tbl(cnx, dbplyr::in_schema("[ADTCMart].[ADTC]",
                                                        "[AdmissionDischargeView]"))

  vw_community_paris_intervention <<- dplyr::tbl(cnx, dbplyr::in_schema("[CommunityMart].[dbo]",
                                                                        "[vwPARISIntervention]"))

  vw_community_paris_person_with_ID <<- dplyr::tbl(cnx, dbplyr::in_schema("[CommunityMart].[dbo]",
                                                                          "[vwPARISPersonWithIdentifier]"))

}
