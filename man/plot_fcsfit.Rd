% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_fcsfit.r
\name{plot_fcsfit}
\alias{plot_fcsfit}
\title{Plot FCS curve with fitting parameter bootstrap distributions}
\usage{
plot_fcsfit(frm, model, bootres, ...)
}
\arguments{
\item{frm}{dataframe}

\item{bootres}{bootstrap results}

\item{fit}{fitting model}
}
\description{
Plot FCS curve with fitting parameter bootstrap distributions
}
\examples{
plot_fcsfit(fcsData, model=G3D, bootres=bootres,ylim = c(0,.04),addFit=T,  allCurves=T) 

}
\author{
JuG
}
