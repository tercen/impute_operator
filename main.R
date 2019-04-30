library(tercen)

ctx = tercenCtx()
matrix = ctx$as.matrix(fill=0.0)

df = data.frame(
  .y=as.vector(matrix),
  .ci=rep(seq.int(from=0,to=ncol(matrix)-1), nrow(matrix)),
  .ri=rep(0:(nrow(matrix)-1), each=ncol(matrix)))
 
ctx$save(ctx$addNamespace(df))
 
