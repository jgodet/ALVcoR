# read_fcs.r
# written by JuG
# October 24 2018


#' Read correlation block in ALV .asc files
#' @author JuG
#' @description 
#' @param path path to the .asc file
#' @param nrows number of lines of the correlation data block
#' @details 
#' @examples 
#' 
#' flist <- list.files(path=paste(getwd(),"/",path.dir,sep=''), pattern="[.]ASC$",full.names = TRUE )
#' dss <- read_fcs(path=flist[1])

#' @return data.frame (Tp == lagtime,  G == autocorrelation curve)
#' @export

read_fcs<-function(path, nrows = 181){
  con<-file(path) #ouvrir le fichier comme connection
  #trouver les blocs
  b<-readLines(con,n=30)
  n1<-which(b== "\"Correlation\"")
  close(con)
  doo <-read.table(file=path,skip=n1,nrows=nrows,col.names=c("Tp","G"))
  return(doo)
}
