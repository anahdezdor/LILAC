
LL_C <- function(data, type, model, estimator, method){
  
  
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
  
  sink("LILACresults.txt")
  
  #write this string to file
  cat("###############################################################################")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("                         LILAC MODEL  R  C O D E                               ")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("    Authors: Ana Hernandez-Dorado, Pere J. Ferrando and Fabia Morales-Vives    ")
  cat("\n")
  cat("\n")
  cat("                        URV, TARRAGONA, (SPAIN)                                ")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("                             DATE: 03/02/2023                                  ")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("###############################################################################")
  
  cat("\n")
  cat("\n")
  cat("\n")
  cat("###############################################################################")
  cat("\n")
  cat("\n")
  
  
  
  
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
  
  method1 <- method
  getOption("max.print")
  cat("   STEP 1: ITEM CALIBRATION")
  cat("\n")
  cat("\n")
  print(Parameters)
  cat("\n")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("   STEP 2: GOODNESS OF FIT ASSESSMENT")
  cat("\n")
  cat("\n")
  print(GOF)
  cat("\n")
  cat("\n")
  cat("\n")
  cat("\n")
  cat("   STEP 3: SCORING")
  cat(c("   Method:  ", method1))
  cat("\n")
  cat("\n")
  print(Scoring$scor)
  cat("\n")
  cat("\n")
  cat("   STEP 4: RELIABILITY")
  cat(c("   Method:  ", method1))
  print(Reliability)
  
  
  
  
  
  #close the external connection
  sink()
  
  
}





