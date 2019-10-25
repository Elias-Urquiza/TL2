# Cuentas

import math

def polarizacion(IDSS,VP,RG,RD,RS,RL,VDD):
	
	a = IDSS/(VP*VP)
	b = -1/RS-(2*IDSS)/VP
	c = IDSS

	VGSQ = (-b - math.sqrt(b*b - 4*a*c))/(2*a)

	IDQ = IDSS*(1-VGSQ/VP)**2

	VDSQ = VDD - RD*IDQ - IDQ*RS

	return (VGSQ,VDSQ,IDQ)


def parametros(IDSS,VP,Rs,RG,RD,RS,RL,VDD,IDQ):
	
	gm = 2*math.sqrt(IDSS*IDQ)/VP	

	RDA = RD*RL/(RD+RL)

	Av =  RDA/(1/gm + RS)

	Avs = Av*(RG/(RG+Rs))

	Ai = Av*RG/RL

	GP = Avs*Ai

	RI = RG

	RO = RD*(1+gm*RS)	


	return(gm,Av,Avs,Ai,GP)



# Resistencias

Rs = 50.0
RG = 820000.0
RD = 1000.0
RS = 470.0
RL = 10000.0
VDD = 12.0

# Transistor

IDSS_tipico = 0.014
IDSS_max = 0.020
IDSS_min = 0.008

VP_tipico = 4.0
VP_max = 6.0
VP_min = 2.0


# Polarizacion
Q_tipico = polarizacion(IDSS_tipico,VP_tipico,RG,RD,RS,RL,VDD)
Q_max = polarizacion(IDSS_max,VP_max,RG,RD,RS,RL,VDD)
Q_min = polarizacion(IDSS_min,VP_min,RG,RD,RS,RL,VDD)

print("PUNTO DE REPOSO: VGSQ (V), VDSQ (V), IDQ (A)")
print("Tipico:= ", Q_tipico)
print("Maximo:= ", Q_max)
print("Minimo:= ", Q_min)


# Parametros
tipicos = parametros(IDSS_tipico,VP_tipico,Rs,RG,RD,RS,RL,VDD,Q_tipico[2])
maximos = parametros(IDSS_max,VP_max,Rs,RG,RD,RS,RL,VDD,Q_max[2])
minimos = parametros(IDSS_min,VP_min,Rs,RG,RD,RS,RL,VDD,Q_min[2])

print("PARAMETROS: gm (A/V), Av, Avs, Ai, GP")
print("Tipicos: ", tipicos)
print("Maximos: ", maximos)
print("Minimos: ", minimos)