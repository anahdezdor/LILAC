eap <- function(psd,se){
  rxx <- 1-((psd^2)/4.67)
  
  for(i in 1:length(rxx)){
    if(rxx[i]<0.01){
      rxx[i] <- 4.67/(4.67+(se))
    }
  }
  
  
  
  rxx_mar <- 1-((mean(psd^2))/4.67)
  
  return(list(rxx=rxx, rxx_mar=rxx_mar))
}
