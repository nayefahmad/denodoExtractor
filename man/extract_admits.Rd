% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_admits.R
\name{extract_admits}
\alias{extract_admits}
\title{Extract admits by nursing unit}
\usage{
extract_admits(startdate_id, enddate_id, site = "LGH Lions Gate",
  n_units = c("LGH 2E", "LGH 3E", "LGH 3W", "LGH 4E", "LGH 4W", "LGH 5E",
  "LGH 6E", "LGH 6W", "LGH 7E", "LGH 7W", "LGH 7W", "LGH EIP", "LGH ICU"),
  denodo_vw = vw_admission_discharge)
}
\arguments{
\item{startdate_id}{e.g. "20190101"}

\item{enddate_id}{e.g. "20190101"}

\item{site}{e.g. "Lions Gate Hospital"}

\item{n_units}{e.g. "LGH 4E". Corresponds to denodo field nursing_unit_short_desc_at_admit}

\item{denodo_vw}{e.g. vw_adtc. denodo_view is the name of the table saved as a connection via dbplyr}
}
\value{
a dataframe with dates and admission counts, by nursing unit
}
\description{
Extract admits by nursing unit
}
\examples{
setup_denodo()
extract_admits("20190101", "20190107")
}
