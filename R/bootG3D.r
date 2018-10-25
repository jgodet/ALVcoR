# bootG3D.r
# written by JuG
# October 24 2018


#' Bootstrap G3D fitting procedure to get parameter distributions and CI
#' @author JuG
#' @description 
#' @param data dataframe
#' @param indices 
#' @details 
#' @examples 
#' require(boot)
#' fcsData <- stack_fcs(path.dir)
#' results <- boot(data=fcsmed[c(-1:-20),], statistic=bootG3D, init=list(N=45,td=.1),R=10)
#' bootres <- bootG3D(fcsData, N=500, a=9)
#' #plot FCS & fit
#' rbind(apply(bootres,1,median),apply(bootres,1,quantile,c(.025,.975)))
#' hist(bootres[1,], breaks=20)
#' hist(bootres[2,], breaks=20)
#' plot_fcsfit(frm=dss[c(-1:-20),],fit=G3D,bootres=results)
#' @return 
#' @export


bootG3D<- function( data, N, a, skipfirst=4) {
 bootFit <- function(){
    ind <- 2:dim(data)[2]
    d <- data.frame(Tp = data[,1], G = apply(data[,sample(ind,replace = T)],1,median)) 
    return(coef(G3D_fit(frm = d[-skipfirst:-1,],init =list(N=30,td=0.1),a=a )))
 }
  bootres <- replicate(n = N, expr = bootFit())
}



