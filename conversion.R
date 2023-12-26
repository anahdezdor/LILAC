
# no 0 or 1 type 0
# continuous 
# likert



conversion <- function(data, type){
  
 
  if(type==0){
    X <- finfinite(data)
  } 
  if(type==1){
    X <- contdata(data)
  }
  
  if(type==2){
    X <- converinteger(data)
  }
  
  Y <- matrix(0, nrow=nrow(data), ncol=ncol(data))
  
  for(i in 1:nrow(X)){
    for(j in 1:ncol(X)){
      Y[i,j] <- log(X[i,j]/(1-X[i,j]))
    }
  }
  Y <- as.data.frame(Y)
  return(Y)
}



