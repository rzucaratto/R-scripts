###################################
#Graficos de dispersão            #
#Rodrigo Zucaratto                #
#15/04/2020                       #
###################################

#Carregando os dados:

setwd("C:/R/Curso do R/Modulo 3.3")
dir()
dados<-read.table("pratica1.txt", h=T)
summary(dados)
View(dados)

#Gráfico simples:
#Lembrando da ordem y em resposta a x (y ~ x)
plot(dados$Riqueza ~ dados$Area)

#Melhorando o grafico:
plot(dados$Riqueza ~ dados$Area, xlab="Área do fragmento", ylab="Número de espécies", las=1, pch=16)

#Separando os dois tipos de ambiente, de duas maneiras diferentes
#Porque o ambiente também pode afetar a riqueza
#Lembrando que ao criar dois graficos a escala dos eixos deve ser a mesma
#Dois gráficos para comparar, empilhados:
par(mfrow=c(2,1))
plot(dados$Riqueza[dados$Ambiente=="primario"] ~ dados$Area[dados$Ambiente=="primario"], xlab="Área do fragmento", ylab="Número de espécies", las=1, pch=16, main="Mata primária")
plot(dados$Riqueza[dados$Ambiente=="secundario"] ~ dados$Area[dados$Ambiente=="secundario"], xlab="Área do fragmento", ylab="Número de espécies", las=1, pch=16, main="Mata secundária")
dev.off() #desfaz o par(mfrow)

#Agora, lado a lado
par(mfrow=c(1,2))
plot(dados$Riqueza[dados$Ambiente=="primario"] ~ dados$Area[dados$Ambiente=="primario"], xlab="Área do fragmento", ylab="Número de espécies", las=1, pch=16, main="Mata primária")
plot(dados$Riqueza[dados$Ambiente=="secundario"] ~ dados$Area[dados$Ambiente=="secundario"], xlab="Área do fragmento", ylab="Número de espécies", las=1, pch=16, main="Mata secundária")
dev.off()

#Agora, separando por cores, mas tudo em um gráfico:
levels(dados$Ambiente) #para saber a ordem
cores<-c("green4", "red4") #criando o objeto cores, separando os ambientes, segue a ordem do levels gree4 = primario, red4 = secundario
plot(dados$Riqueza ~ dados$Area, xlab="Área do fragmento", ylab="Número de espécies", las=1, pch=16, col=cores[dados$Ambiente])
legend("topleft", pch=16, col=cores, legend=c("Mata primária", "Mata secundária"))

