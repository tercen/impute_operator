library(tercen)
library(dplyr)
library(reshape2)

data = (ctx = tercenCtx()) %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ci ~ .ri, fill=0.0, value.var='.y', fun.aggregate=mean)

data.frame(
  .y=as.vector(data),
  .ci=rep(seq.int(from=0,to=ncol(data)-1), nrow(data)),
  .ri=rep(0:(nrow(data)-1), each=ncol(data))) %>%
  ctx$addNamespace() %>%
  ctx$save()
 