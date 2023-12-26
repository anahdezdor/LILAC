
myModel <- 'y =~ V1+V2+V3+V4+V5+V6+V7'


source("LILAC.R")
source("LILAC_console.R")



toy <- LL_C_console(LILAC, type=0, model=myModel, estimator="MLMVS", method="ML")

toy <- LL_C(LILAC, type=0, model=myModel, estimator="MLMVS", method="ML")