library(tercen)
 
ctx = tercenCtx()
matrix = ctx$as.matrix(fill=0.0)

df = data.frame(
  imputed=as.vector(matrix),
  .ci=rep(0:(ncol(matrix)-1), each=nrow(matrix)),
  .ri=rep(seq.int(from=0,to=nrow(data)-1), ncol(data)))
 
ctx$save(ctx$addNamespace(df))
  
