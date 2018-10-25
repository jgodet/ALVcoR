# read_CR.r
# written by JuG
# October 24 2018


#' #' Read Count Rate bloc in  ALV .asc files
#' @author JuG
#' @description Read count rate block in AVL .asc files.
#' @param  path path to the .asc file
#' @details 
#' 
#' @examples 
#' flist <- list.files(path=paste(getwd(),"/",path.dir,sep=''), pattern="[.]ASC$",full.names = TRUE )
#' CR <- read_CR(path=flist[1])
#' plot(CR, type='l', col='blue',ylim=c(0,1.1*max(CR[,2])))
#' @return data.frame
#' @export


read_CR<-function (path)
{
  con <- file(path)
  b <- readLines(con, n = 300)
  n1 <- which(b == "\"Count Rate\"")
  close(con)
  doo <- read.table(file = path, skip = n1, nrows = 255,
                    col.names = c("Time", "CR_kHz"))
}
