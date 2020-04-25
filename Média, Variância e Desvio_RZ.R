###################################
#Média, Variância e Desvio        #
#Rodrigo Zucaratto                #
#08/04/2020                       #
###################################


#Carregando e conferindo os dados:

data("InsectSprays")
summary(InsectSprays)

#Sabendo mais sobre os dados
?InsectSprays

#Olhando os dados
View(InsectSprays)

#Média, Variância e Desvio
mean(InsectSprays$count)
var(InsectSprays$count)
sd(InsectSprays$count)

#Olhando por tipo de inseticida:
#tapply (var. quantitativa, var. categórica - por classe, coisa a ser calculada)
tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, sd)

#########################

plot.default(InsectSprays$spray, InsectSprays$count)

InsectSprays$count[InsectSprays$spray=="C"] #olhar para os números quando os dados pertenecem a uma mesma categoria
InsectSprays$count[InsectSprays$spray=="D"]





