
##############################
### LABORATORI BLOC 4
##############################

# DUES MANERES DE LLEGIR LES DADES
notes<-read.table(file="C:\\Users\\Usuario\\Desktop\\LAB_18_11_2016\\Notes_parcial.csv", sep = ";", header = T, dec=",")
notes<-read.table(file="C:\\Users\\MOI\\Dropbox\\CLASSES\\UPC\\PE\\Laboratori_B4\\Laboratori_B4\\Notes_parcial.csv", sep = ";", header = T, dec=",")

notes<-read.delim("clipboard",dec=",") # HEM DE FER UN "COPY" DIRECTAMENT DESDE L'EXCEL

# 1

View(notes)

length(notes$Np1) ### 111 alumnes
summary(notes$Np1) 
hist(notes$Np1)

length(notes$Np2) ### 111 alumnes
summary(notes$Np2) 
hist(notes$Np2)

# 2


mean(notes$Np1)
sd(notes$Np1)
?sd # Like var this uses denominator n - 1. (ESTIMACIO NO ESBIAIXADA DE SIGMA)
sd(notes$Np1)/sqrt(length(notes$Np1))

mean(notes$Np2)
sd(notes$Np2)
sd(notes$Np2)/sqrt(length(notes$Np2))


# 3

sigmaNp1=1.6

# CONDIANÇA 90%
low<-mean(notes$Np1)-qnorm(0.95,0,1)*sigmaNp1/sqrt(111)	
up<-mean(notes$Np1)+qnorm(0.95,0,1)*sigmaNp1/sqrt(111)	

low
up
low-up

# CONDIANÇA 95%
low<-mean(notes$Np1)-qnorm(0.975,0,1)*sigmaNp1/sqrt(111)	
up<-mean(notes$Np1)+qnorm(0.975,0,1)*sigmaNp1/sqrt(111)	

low
up
low-up

# CONDIANÇA 99%
low<-mean(notes$Np1)-qnorm(0.995,0,1)*sigmaNp1/sqrt(111)	
up<-mean(notes$Np1)+qnorm(0.995,0,1)*sigmaNp1/sqrt(111)	

low
up
low-up


#4



# CONDIANÇA 90%
low<-mean(notes$Np1)-qt(0.95,110)*sd(notes$Np1)/sqrt(111)	
up<-mean(notes$Np1)+qt(0.95,110)*sd(notes$Np1)/sqrt(111)

low
up
low-up

# CONDIANÇA 95%
low<-mean(notes$Np1)-qt(0.975,110)*sd(notes$Np1)/sqrt(111)	
up<-mean(notes$Np1)+qt(0.975,110)*sd(notes$Np1)/sqrt(111)

low
up
low-up

# CONDIANÇA 99%
low<-mean(notes$Np1)-qt(0.995,110)*sd(notes$Np1)/sqrt(111)	
up<-mean(notes$Np1)+qt(0.995,110)*sd(notes$Np1)/sqrt(111)	

low
up
low-up


# AMB funció t.test

?t.test(notes$Np1)

low<-mean(notes$Np1)-qt(0.975,110)*sd(notes$Np1)/sqrt(111)	
up<-mean(notes$Np1)+qt(0.975,110)*sd(notes$Np1)/sqrt(111)
low
up


# FIXEM UN ALPHA = 0.05

# H0: MU = 0 (NO GAIRE INTERESSANT)
t.test(notes$Np1)


# H0: MU = 5
t.test(notes$Np1, mu = 5, alternative = c("two.sided")) # TAMBPOC GAIRE INTERESSANT
t.test(notes$Np1, mu = 5, alternative = c("less")) # BASTANT OBVI
t.test(notes$Np1, mu = 5, alternative = c("greater")) # OK. REBUTGEM LA H0 (LES NOTES SON MÉS ALTES QUE 5) 

# MU = 7
t.test(notes$Np1, mu = 7,alternative = c("greater")) # TAMBE REBUTGEM H0.

# MU = 8
t.test(notes$Np1, mu = 7,alternative = c("greater")) # NO REBUTGEM H0.


# PODEM CREAR UNA NOVA VARIABLE dif_notes = Np1 - Np2 PER VEURE SI HI HAN DIFERENNCIES ENTRE NOTES DELS PARCIALS

dif_notes <- notes$Np1-notes$Np2

notes$dif_notes<-dif_notes
View(notes)

mean(notes$Np1)
mean(notes$Np2)

t.test(notes$dif_notes, mu = 0, alternative = c("two.sided")) # REBUTGEM H0
t.test(notes$dif_notes, mu = 0, alternative = c("less")) # NO REBUTGEM H0 (SERIA INVEROSIMIL)
t.test(notes$dif_notes, mu = 0, alternative = c("greater")) # REBUTGEM H0











