ml <- function(se){
  
  # se <- 1/Info
  rxx <- 4.67/(4.67+(se))
  
  media <- mean(se)
  
  rxx_mar <- 4.67/(4.67+media)
  return(list(rxx=rxx, rxx_mar=rxx_mar))
}

