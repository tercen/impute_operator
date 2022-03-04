library(tercen)
library(tidyr)
library(dplyr)
library(reshape2)

ctx <- tercenCtx()

if (ctx$op.value("mean")){
  mat <- ctx %>%
    select(.ci, .ri, .y) %>% 
    reshape2::acast(.ri ~ .ci, value.var='.y', fill = NA) %>%
    as.data.frame
  
  mat[] <- lapply(mat, function(x) ifelse(is.na(x) | is.nan(x), mean(x, na.rm = TRUE), x)) 
  colnames(mat) <- 1:ncol(mat) - 1
  
  mat_out <- mat %>%
    mutate(.ri = 1:nrow(.) - 1) %>%
    gather(.ci, mean_imputed, -.ri)              
  
  mat_out$.ci<- as.integer(mat_out$.ci)
  mat_out$.ri<- as.integer(mat_out$.ri)
} else{
  
  val<-ctx$op.value("value")
  val<-1
  
  matrix <- ctx$as.matrix(fill=val)
  
  mat_out <- data.frame(
    .ci=rep(0:(ncol(matrix)-1), each=nrow(matrix)),
    .ri=rep(seq.int(from=0,to=nrow(matrix)-1), ncol(matrix)),
    value_imputed=as.vector(matrix))
}

mat_out %>%
  ctx$addNamespace()%>%
  ctx$save()
