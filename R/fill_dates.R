fill_dates <- function(df, date_id_col, start_date, end_date){
  # inputs:
  # df is a dataframe
  # date_id_col is a column with date ids - e.g. "20190101"
  # start_date and end_date create the range of dates to "fill in"

  # create date range:
  df_full_dates <- data.frame(dates_fill = seq(as.Date(start_date),
                                               as.Date(end_date),
                                               by = "1 day"))

  # "quote"/"capture" the value that the user inputs (the actual arg),
  # but don't evaluate it:
  date_id_col <- enexpr(date_id_col)

  # now join:
  df <-
    df %>%
    mutate(dates_fill = ymd(!!date_id_col)) %>%
    full_join(df_full_dates) %>%
    arrange(dates_fill)

  return(df)

}
