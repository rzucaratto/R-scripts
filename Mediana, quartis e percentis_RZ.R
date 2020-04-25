###################################
#Mediana, Quartis e Percentis     #
#Rodrigo Zucaratto                #
#08/04/2020                       #
###################################

#Carregando e conferindo os dados de exemplo:
data(InsectSprays)
summary(InsectSprays)

#Calcular mediana e quartis:
median(InsectSprays$count) #para calcular a mediana
quantile(InsectSprays$count) #também calcula a mediana, mas junto, os quartis

#Usando quantile para calcular outros percentis:
quantile(InsectSprays$count, probs=0.1)    #Percentil 10
quantile(InsectSprays$count, probs=0.9)    #Percentil 90

#Calculando para vários percentis:
#Usar a função concatenar com os percentis desejados em probs
quantile(InsectSprays$count, probs=c(0, 0.1, 0.25, 0.5, 0.75, 0.9, 1))

#Imagine que você fosse repetir isso um monte de vezes, para muitas variáveis
#Neste caso, pode ser bem útil fazer isso:
#Criar um objeto, nesse caso foi "corte" com os percentis escolhidos
cortes<-c(0, 0.1, 0.25, 0.5, 0.75, 0.9, 1)
quantile(InsectSprays$count, probs=cortes)

#Calculando para cada inseticida
#Vou calcular a média de novo, para comparar com a mediana:

tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, quantile)
