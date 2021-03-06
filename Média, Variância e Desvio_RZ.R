###################################
#M�dia, Vari�ncia e Desvio        #
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

#M�dia, Vari�ncia e Desvio
mean(InsectSprays$count)
var(InsectSprays$count)
sd(InsectSprays$count)

#Olhando por tipo de inseticida:
#tapply (var. quantitativa, var. categ�rica - por classe, coisa a ser calculada)
tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, sd)

#########################

plot.default(InsectSprays$spray, InsectSprays$count)

InsectSprays$count[InsectSprays$spray=="C"] #olhar para os n�meros quando os dados pertenecem a uma mesma categoria
InsectSprays$count[InsectSprays$spray=="D"]





