#################################
#Script de test t-Student       #
#Rodrigo Zucaratto              #
#24/04/2020                     #
#################################

setwd("C:/R/Curso do R/Modulo 4.4")
dir()
dados<-read.table("pratica1.txt", h=T)
summary(dados)

#1. Exploração prévia dos dados (para ter o feeling). Pode usar gráficos de histogramas ou boxplot. Exploração mesmo, observar, verificar possiveis erros

hist(dados$Riqueza, las=1, col="gray")
hist(dados$Riqueza[dados$Ambiente=="primario"], main="Mata primária", las=1, col="gray")
hist(dados$Riqueza[dados$Ambiente=="secundario"], main="Mata secundária", las=1, col="gray")

boxplot(dados$Riqueza ~ dados$Ambiente, las=1)

#2. Verificando os pressupostos: normalidade e homogeneidade das variâncias
#2.1. Visualmente:

#Normalidade
qqnorm(dados$Riqueza[dados$Ambiente=="primario"])
qqline(dados$Riqueza[dados$Ambiente=="primario"], lty=2)

qqnorm(dados$Riqueza[dados$Ambiente=="secundario"])
qqline(dados$Riqueza[dados$Ambiente=="secundario"], lty=2)

#Homogeneidade das variâncias
tapply(dados$Riqueza, dados$Ambiente, sd)
source("plotmedias.R")
plotmédias(dados$Ambiente, dados$Riqueza, "Ambiente", "Riqueza")

#2.2 Alternativamente (testes):

#Normalidade (Sahpiro-Wilk)
#Shapiro-Wilk é o mais utilizado, mas existem outros "Kolmogorov-Smirnov"
#Shapiro pega os dados e testa a Ho de que eles não diferem da distribuição normal. Nesse caso de o p < ou = 0.05 indica que os dados nao seguem a normalidade, valores de p acima de 0.05 eu aceito o pressuposto da normalidade
shapiro.test(dados$Riqueza[dados$Ambiente=="primario"])
shapiro.test(dados$Riqueza[dados$Ambiente=="secundario"])

#Homogeneidade das variâncias (teste de Levene)
#Teste de Levine: compara se duas variâncias são ou não são diferentes
#Um valor de p > 0.05 significa aceitar que as variâncias são homogêneas
library(car)
leveneTest(dados$Riqueza ~ dados$Ambiente)

#Se você aceitou os pressupostos, siga para o teste t a seguir.
#Caso contrário, veja as alternativas listadas mais adiante neste script!

#3. O teste t: neste caso unicaudal (riqueza do ambiente primário é maior que do ambiente secundário)
t.test(dados$Riqueza ~ dados$Ambiente, alternative="greater", var.equal=T)
#alternative: é o argumento que define caudalidade do teste
#se o seu teste for bicaudal, use alternative="two.sided"
#var.equal: é o argumento que informa a respeito da homogeneidade de variâncias (quando = T, pressupomos que as variâncias sejam homogêneas)

#Finalizando com o gráfico (neste caso usando erro padrão)
library(sciplot)
lineplot.CI(dados$Ambiente, dados$Riqueza, type="p", las=1, xlab="Ambiente", ylab="Riqueza")

#4. E se os pressupostos não forem atendidos?
#Começando pelas variâncias: fazer o teste t para variâncias hetereogêneas, é exatamente o mesmo teste, mas no argumento var.equal eu coloco false (F), var.equal=F
t.test(dados$Riqueza ~ dados$Ambiente, alternative="greater", var.equal=F)

#Normalidade (para o caso de não atender o pressuposto)
#Verifique a simetria dos dados e pense na robustez do teste
#Teste t é relativamente robusto a violação dos pressupostos, é um teste muito simples e calcula parâmetros muitos simples, pequenos desvios de normalidade não compromentem seus resultados
#Se os dados forem muito assimétricos, aí a coisa é seria!!!
#Algumas vezes podemos ter outliers e isso "puxar" os valores das médias. Verifique os outliers e pense na possibilidade de transformação dos dados (ver script de transformação)
#Realize um teste não paramétrico (não usa parâmetros e nem pressupostos)
#No caso do teste t, o não paramétrico é o Mann-Whitney (ver script correspondente)
#Parta para um Modelo Linear Generalizado (GLM) 

