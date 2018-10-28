# stack_cr.r
# written by JuG
# October 24 2018


#' Read count rate block in ALV for all .asc files in a directory
#' @author JuG
#' @description 
#' @param path.dir path to directory containing the .asc files
#' @details 
#' @examples 
#' path.dir <- paste(getwd(),"/data",sep='')
#' fcscr <- stack_cr(path.dir)
#' #median curve
#' crmed <- data.frame(Tp = fcscr$Time, G = apply(fcscr[,-1],1,median))
#' plot(fcscr[,1:2],type='l',ylim=c(0,150))
#' for (i in 2:(dim(fcscr)[2])){
#'     lines(fcscr[,c(1,i)])
#' }
#' 
#' @return 
#' @export


stack_cr<- function(path.dir,...){
  flist <- list.files(path=path.dir, pattern="[.]ASC$",full.names = T)
  nom <- list.files(path=path.dir, pattern="[.]ASC$")
  flist<-flist[grep('.ASC', flist)]
  nom <- gsub(pattern = ".ASC",replacement = "",x = as.character(nom[grep('.ASC', flist)]))
  fcsframe <- as.data.frame(lapply(flist, read_CR,...   ))
  fcsframe <- fcsframe[,c(1,seq(2,dim(fcsframe)[2],by=2))]
  colnames(fcsframe)<- c("Time", nom)
  return(fcsframe)
}
