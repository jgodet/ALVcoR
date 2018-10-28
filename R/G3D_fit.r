# G3D_fit.r
# written by JuG
# October 24 2018


#' Fit autocorrelation curve assuming free 3D diffusion in a 3‐dimensional Gaussian excitation volume
#' @author JuG
#' @description \code{$G = \frac{1}{N}   \left( 1 + \frac{Tp}{td} \right)^{-1}  \left(1 + \frac{Tp}{td/9} \right)^{-1/2}$}
#' @param frm dataframe with Tp (lagtime) and G (autocorrelation) data
#' @param init initialization parameters list 
#' @details 
#' @examples 
#' #'a' floating
#' G3D_fit(fcsmed[-10:-1,],init=list(N=3,td=1, a=9), algorithm = "port", lower=list(N=0, td=0, a=0), upper=list(N=1000, td=10, a=10))
#' # a fixed
#' G3Dt <-G3D_fit(fcsmed[-10:-1,],init=list(N=3,td=1), a = 9.4)

#'print(summary(G3D) )
#'cbind(coef(G3D),confint(G3D))
#'#check fit diagnostic
#'if(!require(nlstools)){install.packages('nlstools')}
#'library(nlstools)
#'plot(nlsResiduals (G3D))
#' @return nls object
#' @export


G3D_fit<- function (frm, init,a,...) {
    nls(G ~ (1/N) * (1 + Tp/td)^(-1) * (1 + Tp/td/a)^(-1/2), 
        data = frm, start = init,... )
}




