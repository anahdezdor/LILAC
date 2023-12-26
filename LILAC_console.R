LL_C_console <- function(data, type, model, estimator, method){
  
  
  source("finfinite.R")
  source("contdata.R")
  source("converinteger.R")
  source("conversion.R")
  source("calibration.R")
  source("rmlestll.R")
  source("nodoslog30.R")
  source("eapllcon.R")
  source("reapllcon.R")
  source("reliml.R")
  source("relieap.R")
  source("scoring.R")
  
  
  
  
  # conversion: 
  
  X <- conversion(data, type)
  
  # calibration 
  
  ## model with levaan syntax 
  
  calibrat <- calibration(X, model, estimator)
  
  # must be a data frame. 
  
  PARAMETERS <- calibrat$parameters
  Parameters <- calibrat$parameters[,1:4]
  GOF <- calibrat$gof
  
  alpha <- PARAMETERS[,1]
  beta <- PARAMETERS[,2]
  vare <- PARAMETERS[,5]
  RES <- as.matrix(data)
  
  
  # Scoring and reliability
  
  #ML for rxx < 0.1 
  sco <- rmlestll(alpha, beta, vare, RES)
  se <- 1/sco$info
  
  
  Scoring <- scoring(RES, alpha, beta, vare, method,se)
  
  Reliability <- Scoring$rxx_mar
  
  
 return(list(Parameters=Parameters, GOF=GOF, Scoring=Scoring$scor, Reliability=Reliability))
  
}
