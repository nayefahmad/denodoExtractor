#' Fill in missing dates in a dataframe with intermittent dates
#'
#' @param df a dataframe where at least 1 column has dates
#' @param date_col name of the column that has dates
#' @param start_date start date, e.g. "2019-01-01"
#' @param end_date end date, e.g. "2019-02-01"
#'
#' @return the dataframe you started with, expanded to include all missing dates as rows
#' @export
#'
#' @examples
#' df <- data.frame(dates = c("2019-01-01", "2019-02-01"), numbers = c(3,4))
#' df %>% fill_dates(dates, "2019-01-01", "2019-02-08")
fill_dates <- function(df,
                       date_col,
                       start_date,
                       end_date){
  # inputs:
  # df is a dataframe
  # date_col is the name of a column with date ids (e.g. "20190101")
  # start_date and end_date create the range of dates to "fill in"

  # create date range:
  df_full_dates <- data.frame(dates_fill = seq(as.Date(start_date),
                                               as.Date(end_date),
                                               by = "1 day"))

  # "quote"/"capture" the value that the user inputs (the actual arg),
  # but don't evaluate it:
  date_col <- rlang::enexpr(date_col)

  # now join:
  df <-
    df %>%
    dplyr::mutate(dates_fill = lubridate::ymd(!!date_col)) %>%
    dplyr::full_join(df_full_dates) %>%
    dplyr::arrange(dates_fill)

  return(df)

}
