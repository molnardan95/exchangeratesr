% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uneur.R
\name{uneur}
\alias{uneur}
\title{Returns value withouth eur curreny sign}
\usage{
uneur(x)
}
\arguments{
\item{x}{eur value with currency sign}
}
\value{
integer
}
\description{
Returns value withouth eur curreny sign
}
\examples{
uneur('€4,242.42')
uneur('-€4,242')
uneur(eur(1000))
}
\seealso{
eur()
}
