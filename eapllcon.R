eapllcon <- function(X, bet, alpha, vare, nodos){
  nodos<- as.matrix(nodoslogcurt)
  X <- as.matrix(X, col=1)
  
  n <- 1
  m <-length(X)
  
  if(n>m){
    ni <- n
  } else{ni <- m}
  
  
  m <- length(bet)
  nnod <- dim(nodos)[1]
  r <- dim(nodos)[2]
  
  
  sige <- sqrt(vare)
  
  L0 <- L1 <- c(0)
  
  deno <- nume1 <- nume3 <- 0
  p <- pp <- ppp  <- c()
  
  
  for(h in 1:nnod){
    
    for(j in 1: ni){
      tmp1 <- (0.399/sige[j])
      tmp2 <- (1/(X[j]*(1-X[j])))
      tmp3 <- (log(X[j]/(1-X[j])))
      tmp4 <- (log(alpha[j]))
      tmp5 <- (bet[j]*log(nodos[h,1]))
      tmp6 <- ((tmp3-tmp4-tmp5)/sige[j])^2
      tmp7 <- exp(-0.5*tmp6)
      tmp8 <- tmp1*tmp2*tmp7
      L0[j] <- tmp8
      
    }
    
    
    L1[h]<-prod(L0)
    
    
    p[h] <- L1[h]*nodos[h,2]
    deno <- sum(p)
    
    pp[h] <- p[h]*nodos[h,1]
    nume1 <- sum(pp)
    
    ppp[h] <- p[h]*nodos[h,1]*nodos[h,1]
    nume3 <- sum(ppp)
    
  }
  
  
  
  
  
  th <- nume1/deno
  vt <- ((nume3/deno)-(th^2))
  
  if(vt<=0){
    st <- 0
  } else{st <- sqrt(vt)}
  
  return(list(th=th, st=st))
  
}
