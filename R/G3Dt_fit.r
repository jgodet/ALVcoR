# G3Dt_fit.r
# written by JuG
# October 24 2018


#' Fit autocorrelation curve assuming free 3D diffusion with triplet state in a 3‐dimensional Gaussian excitation volume
#' @author JuG
#' @description $G = \frac{1}{N}   \left( 1 + \frac{Tp}{td} \right)^{-1}  \left(1 + \frac{Tp}{td/9} \right)^{-1/2}  \left(1 + \frac{ft}{1 - ft} exp(-Tp/tt) \right)$
#' @param frm dataframe with Tp (lagtime) and G (autocorrelation) data
#' @param init initialization parameters list 
#' @details 
#' @examples 
#'G3Dt <-G3Dt_fit(dss[c(-1:-4),],init=list(N=50,td=0.06,ft=.75,tt=.01))
#'print(summary(G3Dt) )
#'#check fit diagnostic
#'if(!require(nlstools)){install.packages('nlstools')}
#'library(nlstools)
#'plot(nlsResiduals (G3Dt))
#' @return nls object
#' @export


G3Dt_fit<- function (frm, init) {
  nls(G ~ (1/N) * (1 + Tp/td)^(-1) * (1 + Tp/td/9)^(-1/2) * (1 + (ft/(1 - ft)) * exp(-Tp/tt)),
      data = frm, start = init)
}
