n = 29
muX = -20.07779
muY = 28.80262
sX = 8.61658
sY = 1.85458
sXY = -11.51052


b1 = sXY/sX^2; b1
b0 = muY-b1*muX; b0
s2 =(((n-1)*sY^2)-(b1*(n-1)*sXY))/(n-2); s2
sb0 = sqrt(s2*(1/n+muX^2/((n-1)*sX^2))); sb0
sb1 = sqrt(s2/((n-1)*sX^2)); sb1
R2 = (sXY/(sX*sY))^2; R2

# Pendiente
b1

# t?rmino independiente
b0

# ?Se podr?a rechazar la hip?tesis: ?0=-28? (use riesgo a=5%; 0: no, 1: s?).
B0 = 27
alfa = 0.02
t = qt(1-alfa/2,n-2); t
ifelse((b0-B0)/sb0>t,'rebutjar H','no rebutjar H')

B1 = -0.03
alfa = 0.02
t = qt(1-alfa/2,n-2); t
ifelse((b1-B1)/sb1>t,'rebutjar H','no rebutjar H')

# De acuerdo con la hip?tesis: ?0=B0, diga qu? valor toma el estad?stico de la prueba.
B0 = -99.6
t = (b0-B0)/sb0; t

B1 = -0.03
t = (b1-B1)/sb1; t

# ?Qu? parte (en %) de la variabilidad total explica la variable X?
R2*100

# factores diferentes de X
100-R2*100

# Obtenga una estimaci?n de la variancia residual
V = ((n-1)*sY^2-b1*(n-1)*sXY)/(n-2); V

# Coeficiente de determinaci?n asociado al modelo
R2

# Grados de libertad del modelo para estimar los par?metros
n - 2

# Valor que se ha estimado para la desviaci?n t?pica
s = sqrt(s2); s




# componente de la descomposici?n de la variabilidad que se atribuye al error aleatorio de los datos
(n-1)*sY^2-b1*(n-1)*sXY

# halle el coeficiente de determinaci?n asociado al modelo
b1*(n-1)*sXY/((n-1)*sY^2)

# Cu?nto vale la media de los cuadrados explicados por el modelo?
b1*(n-1)*sXY

# media de la variabilidad total de Y
(n-1)*sY^2

# componente de descomposici?n de la variabilidad que quedar?a explicada por X
b1*(n-1)*sXY

# estad?stico de la prueba que se resuelve mediante la tabla ANOVA
F = b1*(n-1)*sXY*(n-1)/((n-1)*sY^2-b1*(n-1)*sXY); F

# valor P en la prueba de si el factor X reduce la variabilidad en la respuesta Y
1-pf(F,1,n-2)	# si F >= 0
pf(F,1,n-2)		# si F < 0

