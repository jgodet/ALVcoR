# G3D_fit.r
# written by JuG
# October 24 2018


#' Fit autocorrelation curve assuming free 3D diffusion in a 3‐dimensional Gaussian excitation volume
#' @author JuG
#' @description $G = \frac{1}{N}   \left( 1 + \frac{Tp}{td} \right)^{-1}  \left(1 + \frac{Tp}{td/9} \right)^{-1/2}$
#' @param frm dataframe with Tp (lagtime) and G (autocorrelation) data
#' @param init initialization parameters list 
#' @details 
#' @examples 
#'G3Dt <-G3Dt_fit(dss[c(-4:-1),],init=list(N=3,td=1))  #td en msec
#'print(summary(G3D) )
#'cbind(coef(G3D),confint(G3D))
#'#check fit diagnostic
#'if(!require(nlstools)){install.packages('nlstools')}
#'library(nlstools)
#'plot(nlsResiduals (G3D))
#' @return nls object
#' @export


G3D_fit<- function (frm, init) {
    nls(G ~ (1/N) * (1 + Tp/td)^(-1) * (1 + Tp/td/9)^(-1/2), 
        data = frm, start = init)
}
