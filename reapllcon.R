
# all parameters must be vectors, nodos must be a matrix

reapllcon<- function(RES, bet, alpha, vare, nodos){
  nodos<- as.matrix(nodoslogcurt)
  RES <- as.matrix(RES)
  th <- c()
  st <- c()
  for(k in 1:nrow(RES)){
    evsuj <- eapllcon(RES[k,], bet, alpha, vare, nodos)
    th[k] <-evsuj$th
    st[k] <-evsuj$st
  }
  
  res <- cbind(th, st)
  return(res)
}


