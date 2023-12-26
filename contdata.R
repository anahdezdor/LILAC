

contdata <- function(data){
  library(scales)
  data <- as.matrix(data)
  X <- rescale(data, to=c(0.03, 0.99))
  return(X)
}

