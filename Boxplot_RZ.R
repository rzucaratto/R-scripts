###################################
#Script de boxplot                #
#Rodrigo Zucaratto                #
#09/04/2020                       #
###################################

#Carregando os dados:

setwd("C:/R/Curso do R/Modulo 2.2")
dir()
dados<-read.table("bichinhos.txt", h=T)
summary(dados)

#Apenas para referência (porque no boxplot eu uso os quartis e mediana):
tapply(dados$Comprimento, dados$Especie, quantile)

#Boxplot básico:
#Nesse caso, como o comprimento varia em relação à espécie
boxplot(dados$Comprimento ~ dados$Especie)

#Boxplot organizado:
#xlab = label (rótulo) x, ylab = label y, las = orientação nº ou palavra nos eixos, range (comprimento do wisker), se for 0, ele pega meu valor mínimo e máximo, ideal para boxplot (mas pode ser outros velaores, ver help da função)
boxplot(dados$Comprimento ~ dados$Especie, xlab="Espécie de bichinho", ylab="Comprimento do bichinho (cm)", las=1, range=0)

#xlab e ylab determina os nomes dos eixos
#las determina a orientação dos números (pode ser de 0 a 3)
#range determina a extensão dos tracinhos (=0 vai de mínimo a máximo)



#Boxplot para exploração:
#Nesse caso para, por ex, eu sobrepor media e SD e comparar
#primeiro eu crio as medias (nesse caso como um objeto)
medias<-tapply(dados$Comprimento, dados$Especie, mean)
boxplot(dados$Comprimento ~ dados$Especie, xlab="Espécie de bichinho", ylab="Comprimento do bichinho (cm)", las=1, range=0)
points(medias, pch=16, col="red", cex=2)

#a função points adiciona pontos em um gráfico aberto (em coordenadas que eu determino)
#pch determina o tipo de símbolo
#cex determina o tamanho relativo do símbolo (tamanho proporcional)
#col determina cores
