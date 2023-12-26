
# ML point-estimated trait level for a single individual
# in the LL-C Model
#
#  RES -> row response vector of 0-1 scores subjecto 
#  alpha -> column vector with the item position parameters
#  bet -> column vector with the item shape parameters
#  vare -> column vector of residual item variances


rmlestll <- function(alpha, bet, vare, RES){
  RES <- as.matrix(RES)
  m <- dim(RES)[1]
  n <- dim(RES)[2]
  nume <- 0
  deno <- 0
  
  consinfoO<-(bet * bet) /vare
  consinfo<-sum(consinfoO)
  
  
  for(i in 1:n){
    tmp1 <- log(RES[,i]/(1-RES[,i]))
    tmp2 <- log(alpha[i])
    tmp3 <- (bet[i]*(tmp1-tmp2))/vare[i]
    tmp4 <- (bet[i]*bet[i])/vare[i]
    nume <- nume + tmp3
    deno <- deno+tmp4
  }
  th <-exp(nume/deno)
  st <- consinfo/th
  
  
  return(list(th=th, info=st))
}
