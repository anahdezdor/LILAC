finfinite <- function(data){
  for(i in 1:nrow(data)){
    for(j in 1:ncol(data)){
      if(data[i,j]>0.99){
        data[i,j] <- 0.99
      }
      if(data[i,j]<0.01){
        data[i,j] <- 0.01
      }
    }
  }
  return(data)
} 
