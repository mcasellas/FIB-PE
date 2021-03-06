# Como probablemente sabes, los captchas son pruebas que ciertos
# formularios web incluyen para que el ordenador sepa que eres un
# humano y no una m�quina (como el test de Turing, pero al rev�s).
#
# Por supuesto, la retorcida mentalidad de los cient�ficos se ha
# volcado para tratar de encontrar sistemas anti-captcha, es decir,
# procedimientos que pueden responder a la cuesti�n planteada sin
# mediaci�n humana. Un equipo especialmente perverso de la UPC
# trabaja en un procedimiento con el objetivo de reventar el
# sistema Captcha de Google, uno de los m�s resistentes de los
# habitualmente usados.
 



# 1. El equipo de la UPC ha preparado un estudio en el que trata de
# adivinar la respuesta de $N$ captchas independientes, de los que
# consigue la respuesta correcta en $k$ de ellos. Obt�n en forma de
# IC $a$% la estimaci�n de la probabilidad de �xito para su
# procedimiento.
# (responde con proporciones, no con porcentajes; tres decimales
# correctos al menos para cada extremo del intervalo)


N = 210
k = 27
a = 99.5
 
P = k/N
riesgo = 1 - a/100
 
offset = qnorm(1 - riesgo/2) * sqrt(P*(1-P)/N)
paste(P - offset, P + offset)
 


# 2. El equipo UPC prepara un nuevo trabajo con una t�cnica
# modificada. Est� calculando el tama�o de muestra necesario, y se
# han definido los siguientes requisitos:
# - confianza: $a3$%,
# - el intervalo resultante tendr� una amplitud total esperada igual
#   a $W$%,
# - no se espera que la proporci�n de �xitos real sea mayor que
#   $ptop$%.
# Deduce el n�mero de observaciones que se requiere observar.
a3 = 99
W = 7.5
ptop = 25
 
riesgo2 = 1 - a3/100
n = (ptop/100)*(1-ptop/100) / (((W/200) / qnorm(1 - riesgo2/2))^2)
 
paste(round(n))
 


# 3. �Y si no se hace ninguna suposici�n sobre el umbral superior de
# la proporci�n que se desea estimar, cu�l ser�a entonces el c�lculo
# del tama�o de muestra?
 
n2 = 0.5^2 / (((W/200) / qnorm(1 - riesgo2/2))^2)
paste(round(n2))
 


# 4. Aparece en la revista cient�fica "Journal of Irreproducible
# Results" un trabajo en el que se describe una experiencia similar
# al objeto de estudio de nuestro equipo. En este trabajo, los
# autores presentan una proporci�n de �xito ($ic2$), con confianza
# $a2$%. Sin embargo, los autores han olvidado incluir el dato de
# cu�ntos captchas utilizaron. �Puedes averiguarlo t�?
# La respuesta ha de ser un n�mero entero, coge el valor redondeado
# por exceso.
ic2 = c(0.1049, 0.1441)
a2 = 80
 
W2 = (ic2[2] - ic2[1])/2
P2 = ic2[1] + W2
riesgo3 = 1 - a2/100
n3 = P2*(1-P2) / ((W2 / qnorm(1 - riesgo3/2))^2)
 
round(ceiling(n3))
 


# 5. Volviendo a los resultados de la primera pregunta, el equipo se
# prepara para resolver una prueba de hip�tesis. De acuerdo a
# estudios previos, se trata de plantearse si sus resultados
# coinciden o no con una proporci�n aut�ntica igual a $po.h0$:
# H0: p = $po.h0$
# Determina el valor del estad�stico asociado a esta prueba,
# a partir de aquellos resultados.
# (tres decimales al menos)
po.h0 = 0.12
 
z = (P - po.h0) / sqrt(po.h0*(1-po.h0)/N)
paste(z)
 


# 6. Calcula el valor P de la prueba anterior.
# (tres decimales correctos)
za = abs(z)
 
paste(2*pnorm(-za))


.