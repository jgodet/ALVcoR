# plot_fcsfit.r
# written by JuG
# October 24 2018


#' Plot FCS curve with fitting parameter bootstrap distributions
#' @author JuG
#' @description 
#' @param frm dataframe 
#' @param fit fitting model
#' @param bootres bootstrap results
#' @details 
#' @examples 
#'plot_fcsfit(fcsData, model=G3D, bootres=bootres,ylim = c(0,.04),addFit=T,  allCurves=T) 
#'
#' @return 
#' @export


plot_fcsfit<- function (frm, model, bootres,...) {
    nf <- layout(matrix(c(1, 2, 1, 3), 2, 2, byrow = T), c(2, 
                                                           1), c(1, 1), TRUE)
    layout.show(nf)
    par(mar = c(4, 5, 4, 0))
    plot_fcs(fcsG,xlim=c(1e-3, 100), type='l',model=model,...)
    par(mar = c(2, 2, 6, 4))
    hist(bootres[1, ], xlab = "", main = "Number of molecules", 
         col = "lightblue")
    mtext(paste(" N = ", round(median(bootres[1,],na.rm=T), digits = 2), 
                "\n IC95 = ", round(quantile(bootres[1,], c(0.025)), 
                                     2), " - ", round(quantile(bootres[1,], c(0.975)), 
                                                      2), sep = ""), side = 3, cex = 0.65)
    par(mar = c(4, 2, 6, 4))
    hist(bootres[2, ], xlab = paste("resampling n = ", dim(bootres)[2], 
                                      sep = ""), main = "Diffusion time", col = "grey90")
    mtext(paste(" Td = ", round(median(bootres[2,],na.rm=T), digits = 2), 
                "\n IC95 = ", round(quantile(bootres[2,], c(0.025)), 
                                     2), " - ", round(quantile(bootres[2,], c(0.975)), 
                                                      2), sep = ""), side = 3, cex = 0.65)
}
