library(tercen)
library(dplyr)
library(reshape2)

data = (ctx = tercenCtx()) %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ri ~ .ci, fill=0.0, value.var='.y', fun.aggregate=mean)

data.frame(
  imputed = as.vector(data),
  .ci = rep(0:(ncol(data)-1), each=nrow(data)),
  .ri = rep(seq.int(from=0,to=nrow(data)-1), ncol(data))) %>%
  ctx$addNamespace() %>%
  ctx$save()
 