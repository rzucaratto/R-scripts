###################################
#Graficos de barra                #
#Rodrigo Zucaratto                #
#14/04/2020                       #
###################################

#Carregando os dados:

setwd("C:/R/Curso do R/Modulo 3.3")
dir()
dados<-read.table("ninhos.txt", h=T)
summary(dados)
View(dados)
#Primeiro passo, criar uma tabela de contingência
tabela<-table(dados$Altura, dados$Predado)
tabela

#Criando a tabela em outra ordem, só pra comparar:
tabela.2<-table(dados$Predado, dados$Altura)
tabela.2

#Se quisermos, podemos calcular uma tabela de frequências relativas:
#margim me da o total em relação a linha, nesse caso que é 1, se fosse 2, seria em relação a coluna
tabela.prop<-prop.table(tabela, margin=1) 
tabela.prop


#O gráfico, versão básica:
#beside = T poe as barras lado a lado, se eu quisesse uma sobre a outra deixava sem o argumento
barplot(tabela.2, beside=T)

#O gráfico, versão bacana:
#A ordem das cores é em relação a ordem das variáveis, o R sempre le em ordem alfabética
cores<-c("green4", "red4")
barplot(tabela.2, beside=T, ylim=c(0, 80), las=1, xlab="Posição do ninho", ylab="Número de ninhos", col=cores)
legend("topleft", legend=levels(dados$Predado), col=cores, pch=15, title="Ninho predado?")
box()


#Para saber a ordem das categorias, você pode fazer isso:
levels(dados$Predado)
levels(dados$Altura)

?legend
