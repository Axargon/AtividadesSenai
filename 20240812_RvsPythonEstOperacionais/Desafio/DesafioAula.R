dicionario <- list(a=1,b=2,c=3)
proc = 2
for(chave in names(dicionario)){
  if (dicionario[[chave]] == proc){
    print(paste("Chave: ",chave,"Valor: ",dicionario[[chave]]))
    break
  }
  else{
    print(paste("Chave: ",chave,"Valor: ",dicionario[[chave]]))
  }
}