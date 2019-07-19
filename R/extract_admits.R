#' Extract admits by nursing unit
#'
#' @param startdate_id e.g. "20190101"
#' @param enddate_id e.g. "20190101"
#' @param site e.g. "Lions Gate Hospital"
#' @param n_units e.g. "LGH 4E"
#' @param denodo_vw e.g. vw_adtc. denodo_view is the name of the table saved as a connection via dbplyr
#'
#' @return a dataframe with dates and admission counts, by nursing unit
#' @export
#'
#' @examples
extract_admits <- function(startdate_id,
                           enddate_id,
                           site = "Lions Gate Hospital",
                           n_units = c("LGH 2E",
                                       "LGH 3E",
                                       "LGH 3W",
                                       "LGH 4E",
                                       "LGH 4W",
                                       "LGH 5E",
                                       "LGH 6E",
                                       "LGH 6W",
                                       "LGH 7E",
                                       "LGH 7W",
                                       "LGH 7W",
                                       "LGH EIP",
                                       "LGH ICU"),
                           denodo_vw = vw_adtc){

  denodo_vw %>%
    dplyr::filter(facility_name == !!(site),  # !! used to unquote the actual argument "site"
              admission_date_id >= startdate_id,
              admission_date_id <= enddate_id,
              nursing_unit_short_desc_at_admit %in% n_units) %>%

    dplyr::select(admission_date_id,
              patient_id,
              nursing_unit_short_desc_at_admit,
              facility_name) %>%  # show_query()

    dplyr::collect() %>%

    dplyr::group_by(admission_date_id,
              nursing_unit_short_desc_at_admit) %>%
    dplyr::summarise(admits = n()) %>%
    dplyr::rename(date_id = admission_date_id,
              nursing_unit_cd = nursing_unit_short_desc_at_admit) %>%

    # display in long format:
    tidyr::gather(key = "metric",
                  value = "value",
                  -c(date_id, nursing_unit_cd)) %>%

    dplyr::ungroup(.)


}
