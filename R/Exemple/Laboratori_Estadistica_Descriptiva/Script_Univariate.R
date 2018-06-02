
# PDF: GuioLabAnalisiDescriptiva.pdf

source(url("http://www-eio.upc.es/teaching/pe/read-data"))

DAT
View(DAT)
head(DAT)
str(DAT)

nrow(DAT)
ncol(DAT)

mean(DAT$mysql)

median(DAT$mysql)

summary(DAT$mysql)

var(DAT$mysql)

sd(DAT$mysql)

# EXERCICI 1

hist(DAT$mysql)

boxplot(DAT$mysql)

table(DAT$op)

prop.table(table(DAT$op))

# PRIMER MIREM SI TENIM EL PAQUET INSTAL.LAT:
library(descr)

# SI NO: install.packages("descr")

freq(DAT$op, plot=F)
barplot(table(DAT$op))

setwd('C:\\Users\\Usuario\\Desktop') # ESPECIFIQUEM EL DIRECTORI DE TREBALL ON GUARDAR ELS FITXERS
setwd('C:\\Users\\MOI\\Desktop\\LAB_UVIC\\LAB_2') # ESPECIFIQUEM EL DIRECTORI DE TREBALL ON GUARDAR ELS FITXERS


write.table(DAT, file="DadesDAT.txt", quote=F, row.names=F)
save.image("DadesDAT.RData")

# EXERCICI 2

#1
mean(DAT$post) # NO FUNCIONA...
mean(DAT$post, na.rm=T) # ARA SÍ!
median(DAT$post, na.rm=T)
summary(DAT$post, na.rm=T)
var(DAT$post, na.rm=T)
sd(DAT$post, na.rm=T)

#2
windows(width=10)
par(mfrow=1:2, cex.lab=1.3, cex.axis=1.2)
hist(DAT$post, col=2, main="Histograma de la variable post")
boxplot(DAT$post, col=3, main="Diagrama de caixa de la variable post")

#3
with(DAT, tapply(post, op, summary))

#4
boxplot(post~op, DAT, col=2:5)
