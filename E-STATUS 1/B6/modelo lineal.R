Call:
lm(formula = y ~ x)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.56538 -0.13236 -0.01933  0.16110  0.53712 

Coefficients:
             Estimate Std. Error  t value Pr(>|t|)    
(Intercept) 48.783032   0.029782 %?#^{!??   <2e-16 ***
x           -0.004704   0.004360   -1.079    0.285    
---
Signif. codes:  0 ?***? 0.001 ?**? 0.01 ?*? 0.05 ?.? 0.1 ? ? 1 

Residual standard error: 0.2321 on 62 degrees of freedom
Multiple R-squared: 0.01843,	Adjusted R-squared: 0.002599 
F-statistic: 1.164 on 1 and 62 DF,  p-value: 0.2848
--------------------------------------------------------------;

b0 = 0; sb0 = 0.319862; tb0 = 128.677; pb0 = 2e-16
b1 = 0.016163; sb1 = 0.005944; tb1 = 2.719; pb1 = 0.00981

b0 = tb0*sb0; b0

tb0 = b0/sb0; tb0

sb0 = b0/tb0; sb0

df = 38


# PREGUNTA: ?Cu?nto vale la estimaci?n del t?rmino independiente?
b1

# PREGUNTA: Extremo superior de un intervalo de confianza 95% para la pendiente.
prob = 0.95
alfa = 1-prob; alfa
t = qt(1-alfa/2,df); t
b0-t*sb0

# PREGUNTA: Responda con el estad?stico de la prueba ?0=0.
tb0

# PREGUNTA: Responda con el estad?stico de la prueba ?1=0.
tb1

# PREGUNTA: ?Podr?amos rechazar con estos datos ?1=-0.1? (use riesgo a=1%; 0: no, 1: s?).
B1 = 0.05
alfa = 0.02
t = qt(1-alfa/2,df); t
ifelse((b1-B1)/sb1>t,"rebutgem H0","no rebutgem H0")

# PREGUNTA: ?Rechazar?a la hip?tesis de que la recta realmente es horizontal? (0: no, 1: s?)
B1 = 0
ifelse((b1-B1)/sb1>tb1,"rebutgem H0","no rebutgem H0")

# PREGUNTA: P-valor de la prueba ?0=0.
pb0

# PREGUNTA: P-valor de la prueba ?1=0.
pb1

# PREGUNTA: En la salida hay un valor corrompido. ?Puede recuperar el valor original?
# si falta alguno: t=b/s

# PREGUNTA: Diga el valor que se ha estimado para la desviaci?n t?pica del t?rmino aleatorio del modelo.
E = 


IC = c(b1-qt(0.975,df-2)*sb1,b1+qt(0.975,df-2)*sb1); IC  
