##############################
#Média e Mediana na prática  #
#Rodrigo Zucaratto           #
#08/04/2020                  #
##############################


setwd(choose.dir())
dir()
dados<-read.table("bichinhos.txt", h=T)
summary(dados)

#############################

#Histograma do comprimento dos bichinhos
#Para explorar os dados, ver se são assimétricos/simétricos
#Escolha Mediana ou Média

hist(dados$Comprimento, col="gray") #para todas as espécies

#Agora, um histograma para cada espécie:
hist(dados$Comprimento[dados$Especie=="sp_1"], col="gray")
hist(dados$Comprimento[dados$Especie=="sp_2"], col="gray")
hist(dados$Comprimento[dados$Especie=="sp_3"], col="gray")

#Boxplot:
boxplot(dados$Comprimento ~ dados$Especie)

#Aqui usamos o formato y~x
#Que significa y em resposta à x
#Ou, y em função de x
#Ou ainda, y dependendo de x 

#Vamos olhar os números:
#Relembrando taplly (var. quant, var. cat, coisa a ser calculada)
tapply(dados$Comprimento, dados$Especie, mean)
tapply(dados$Comprimento, dados$Especie, sd)

tapply(dados$Comprimento, dados$Especie, quantile)
