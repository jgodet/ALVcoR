# plot_fcs.r
# written by JuG
# October 24 2018


#' Plot FCS curve
#' @author JuG
#' @description 
#' @param frm dataframe with Tp (Tau in ms) aud G (G(tau))
#' @details 
#' @examples 
#'plot_fcs(fcsmed)
#'plot_fcs(fcsmed,xlim=c(2e-3, 100), ylim = c(0,.04))
#'fcsData <- stack_fcs(path.dir)
#'fcsmed <- data.frame(Tp = fcsData$Time, G = apply(fcsData[,-1],1,median))
#'fcsG <- cbind(fcsmed,fcsData[,-1])
#'G3Dt <-G3D_fit(fcsmed[-10:-1,],init=list(N=3,td=1), a = 9.4)
#'plot_fcs(fcsmed,xlim=c(1e-3, 100), type='l',ylim = c(0,.04),addFit=T, model=G3D)
#'plot_fcs(fcsG,xlim=c(1e-3, 100), type='l',ylim = c(0,.04),addFit=T, model=G3D, allCurves=T)
#' @return 
#' @export


plot_fcs<- function (frm,addFit = F, model,allCurves = F,...) {
  par(mar=c(6,6,5,5))
  plot(frm[,1], frm[,2], log = "x", xlab = "Tau, ms", ylab = "G(tau)",
       panel.first=grid(),
       cex.axis=1.2, cex.lab=1.5,...)
  if(addFit){
    lines(frm[c(-4:-1),1], predict(model), col = "red",lwd=2)
  }
  if(allCurves){
    if(dim(frm)[2]>2){
      nlines <- dim(frm)[2]-2
      for (i in 1:nlines){
        lines(frm[,1], frm[,(2+i)], lwd=1,col=rgb(.4,.4,.4,.4))
      }
    }
  }
}
