% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cfactor.R
\name{cfactor}
\alias{cfactor}
\alias{cordered}
\alias{is.cfactor}
\alias{is.cordered}
\title{Coded factors}
\usage{
cfactor(x = unspecified(), codes, ordered = FALSE)

cordered(x, codes)

is.cfactor(x)

is.cordered(x)
}
\arguments{
\item{x}{a vector of character or numeric codes}

\item{codes}{named vector of unique codes that declares the mapping of labels
to codes}

\item{ordered}{logical flag to determine if the codes should be regarded as
ordered (in the order given).}
}
\value{
a new \code{cfactor}
}
\description{
TODO: Write this
}
