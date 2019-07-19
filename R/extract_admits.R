#' Extract admits by nursing unit
#'
#' @param startdate_id e.g. "20190101"
#' @param enddate_id e.g. "20190101"
#' @param site e.g. "Lions Gate Hospital"
#' @param n_units e.g. "LGH 4E"
#' @param denodo_vw vw_adtc
#'
#' @return a dataframe
#' @export
#'
#' @examples
extract_admits <- function(startdate_id,
                           enddate_id,
                           site = "Lions Gate Hospital",
                           n_units = c("LGH 4E"),
                           denodo_vw = vw_adtc){

  # inputs:
  # > startdate and enddate as integers
  # > denodo_view is the name of the table saved as a connection via dbplyr

  # outputs:
  # dataframe with dates and admission counts, by nursing unit

  denodo_vw %>%
    filter(facility_name == !!(site),  # !! used to unquote the actual argument "site"
           admission_date_id >= startdate_id,
           admission_date_id <= enddate_id,
           nursing_unit_short_desc_at_admit %in% n_units) %>%

    select(admission_date_id,
           patient_id,
           nursing_unit_short_desc_at_admit,
           facility_name) %>%  # show_query()

    collect() %>%

    group_by(admission_date_id,
             nursing_unit_short_desc_at_admit) %>%
    summarise(admits = n()) %>%
    rename(date_id = admission_date_id,
           nursing_unit_cd = nursing_unit_short_desc_at_admit) %>%

    # display in long format:
    gather(key = "metric",
           value = "value",
           -c(date_id, nursing_unit_cd)) %>%

    ungroup


}
