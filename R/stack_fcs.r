# stack_fcs.r
# written by JuG
# October 24 2018


#' Read correlation block in ALV for all .asc files in a directory
#' @author JuG
#' @description 
#' @param path.dir path to directory containing the .asc files
#' @details 
#' @examples 
#' path.dir <- paste(getwd(),"/data",sep='')
#' fcsData <- stack_fcs(path.dir)
#' #median curve
#' fcsmed <- data.frame(Tp = fcsData$Time, G = apply(fcsData[,-1],1,median))
#' G3D <- G3D_fit(fcsmed[c(-1:-4),],init=list(N=30,td=0.1))
#' plot_fcs(fcsmed,addFit = T,model = G3D)
#' @return 
#' @export


stack_fcs<- function(path.dir){
  flist <- list.files(path=path.dir, pattern="[.]ASC$",full.names = T)
  nom <- list.files(path=path.dir, pattern="[.]ASC$")
  flist<-flist[grep('.ASC', flist)]
  nom <- gsub(pattern = ".ASC",replacement = "",x = as.character(nom[grep('.ASC', flist)]))
  fcsframe <- as.data.frame(lapply(flist, read_fcs   ))
  fcsframe <- fcsframe[,c(1,seq(2,dim(fcsframe)[2],by=2))]
  colnames(fcsframe)<- c("Time", nom)
  return(fcsframe)
}
