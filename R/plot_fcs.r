# plot_fcs.r
# written by JuG
# October 24 2018


#' Plot FCS curve
#' @author JuG
#' @description 
#' @param frm dataframe with Tp (Tau in ms) aud G (G(tau))
#' @details 
#' @examples 
#'plot_fcs(dss)
#'plot_fcs(dss,xlim=c(2e-3, 100), ylim = c(0,.04))
#'plot_fcs(dss,xlim=c(2e-4, 100), ylim = c(0,.04),addFit=T, model=G3D)
#' @return 
#' @export


plot_fcs<- function (frm,addFit = F, model,...) {
  par(mar=c(6,6,5,5))
  plot(frm$Tp, frm$G, log = "x", xlab = "Tau, ms", ylab = "G(tau)",
       panel.first=grid(),
       cex.axis=1.2, cex.lab=1.5,...)
  if(addFit){
    lines(frm[c(-4:-1),1], predict(model), col = "red",lwd=2)
  }
}
