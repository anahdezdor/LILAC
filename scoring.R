
# scoring
# method: "ML" or "EAP"


scoring <- function(RES, alpha, beta, vare, method,se){
  

  if (method=="ML"){
    SCO <- rmlestll(alpha, beta, vare, RES)
    
    se <- 1/SCO$info
    REL <- ml(se)
    th <- as.matrix(SCO$th, ncol=1)
    INFO <- as.matrix(SCO$info,ncol=1)
    rxx <-  as.matrix(REL$rxx, ncol=1) 

    scor <- data.frame(th=th, INFO=INFO, rxx=rxx)
    
    rxx_mar <- REL$rxx_mar
  } 
  if (method=="EAP"){
    SCO <- reapllcon(RES, beta, alpha, vare, nodos)
    REL <- eap(SCO[,2], se)
    th <- as.matrix(SCO[,1], ncol=1)
    st <- as.matrix(SCO[,2], ncol=1)
    rxx <-  as.matrix(REL$rxx, ncol=1) 
    scor <- data.frame(th=th, PSD=st^2, rxx=rxx)
    
    rxx_mar <- REL$rxx_mar
  }
  
  
  return(list(scor=scor, rxx_mar=rxx_mar))
}







