converinteger <- function(data){
  
  
  dat <- data
  Xmax <- max(data)
  Xmin <- min(data)
  
  if(Xmax >= 5){
    for(i in 1:nrow(data)){
      for(j in 1:ncol(data)){
        dat[i,j] <- 0.8*((data[i,j] - 1)/(Xmax-Xmin))+0.1
      }
    }  
    
  } else{
    dat <- cat('ERROR: data is not suitable for continuous modelling')
  }
  return(dat)
}
