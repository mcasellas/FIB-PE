


setwd('C:\\Users\\MOI\\Desktop\\ANALISI DE LA NORMALITAT')




########################
# DADES APARELLADES
########################


# LLEGIM LES DADES PROVINENTS D'UN ARXIU CSV
notes<-read.table(file="Notes_parcial.csv", sep = ";", header = T, dec=",")
View(notes)


# CREEM UNA NOVA VARIABLE (DIFERÈNCIA)
notes$D = notes$Np1-notes$Np2
View(notes)

# COMPROVEM PREMISA DE NORMALITAT EN D
dev.new(width=15, height=10)
par(mfrow=c(1,2))
hist(notes$D)
qqnorm(notes$D)
qqline(notes$D,col=2)

mean(notes$D)

# PODRIEM DIR QUE LES DADES (VARIABLE D) SÓN NORMALS 
# (NO VEIEM QUE LA DISTRIBUCIÓ OBSERVADA A LES DADES S'ALLUNYI MASSA DE LA PREMISSA DE NORMALITAT)

t.test(notes$Np1,notes$Np2,paired=TRUE)


############################
# DADES INDEPENDENTS (MAS)
############################
notes<-read.table(file="Notes_parcial_2.csv", sep = ";", header = T, dec=",")
View(notes)

subset(notes, Parcial==1)
Np1<-(subset(notes, Parcial==1))$Nota
mean(Np1)

subset(notes, Parcial==2)
Np2<-(subset(notes, Parcial==2))$Nota
mean(Np2)

# COMPROVEM PREMISA DE NORMALITAT EN Np1 i Np2

dev.new(width=15, height=10)
par(mfrow=c(1,2))
hist(Np1)
qqnorm(Np1)
qqline(Np1,col=2)
# EN AQUEST CAS POTSER Np1 ES DESVIA UNA MICA DE LA PREMISA DE NORMALITAT

dev.new(width=15, height=10)
par(mfrow=c(1,2))
hist(Np2)
qqnorm(Np2)
qqline(Np2,col=2)
# NORMALITAT OK

t.test(Np1,Np2,paired=FALSE)
# ARRIBEM A LA MATEIXA CONCLUSIÓ, PERO HEM UTILITZAT EL DOBLE DE MOSTRA (20 ESTUDIANTS)


