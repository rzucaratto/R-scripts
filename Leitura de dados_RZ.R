###################################
#Leitura de dados                 #
#Rodrigo Zucaratto                #
#16/04/2020                       #
###################################

#Estabelecendo a pasta de trabalho:

setwd("D:/R/Rbio/Modulo 3/dados")
dir()

#Lendo dados em txt:
#sep = \t indinca que as colunas são separadas por espaço (tabulação)
#row.names faz com que a primeira coluna seja lida como nomes, ou seja, a primeira coluna tem o nome das linhas
#só usa a row.names quando a primeira coluna é um conjunto de nomes, só vou precisar quando for fazer um grafico ou qq coisa q eu queira q os nomes apareçam
dados<-read.table("dados1.txt", h=T, sep="\t", dec=".", row.names=1)
summary(dados)

#Lendo os dados em csv
dados2<-read.csv("dados1.csv", row.names=1) #não precisa de h=T, ele ja faz isso automaticamente
summary(dados2)

#Lendo os dados do xlsx:
#se ainda nao tiver, instalar o pacote readxl
library(readxl)
dados3<-read_xlsx("dados1.xlsx", sheet="Planilha1") #sheet inidca a planilha do excel q vc vai ler
summary(dados3)

dados3$Regiao<-as.factor(dados3$Regiao) #porque o R não leu a coluna regiao como variavel categorica (fator). Ai peço a ele para transformar 
summary(dados3)

