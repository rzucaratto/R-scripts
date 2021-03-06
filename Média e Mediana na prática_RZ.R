##############################
#M�dia e Mediana na pr�tica  #
#Rodrigo Zucaratto           #
#08/04/2020                  #
##############################


setwd(choose.dir())
dir()
dados<-read.table("bichinhos.txt", h=T)
summary(dados)

#############################

#Histograma do comprimento dos bichinhos
#Para explorar os dados, ver se s�o assim�tricos/sim�tricos
#Escolha Mediana ou M�dia

hist(dados$Comprimento, col="gray") #para todas as esp�cies

#Agora, um histograma para cada esp�cie:
hist(dados$Comprimento[dados$Especie=="sp_1"], col="gray")
hist(dados$Comprimento[dados$Especie=="sp_2"], col="gray")
hist(dados$Comprimento[dados$Especie=="sp_3"], col="gray")

#Boxplot:
boxplot(dados$Comprimento ~ dados$Especie)

#Aqui usamos o formato y~x
#Que significa y em resposta � x
#Ou, y em fun��o de x
#Ou ainda, y dependendo de x 

#Vamos olhar os n�meros:
#Relembrando taplly (var. quant, var. cat, coisa a ser calculada)
tapply(dados$Comprimento, dados$Especie, mean)
tapply(dados$Comprimento, dados$Especie, sd)

tapply(dados$Comprimento, dados$Especie, quantile)
