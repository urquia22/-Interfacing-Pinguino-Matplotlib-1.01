#!/usr/bin/env python
# -*- coding: utf-8 -*-
import PBpinguino                            # importamos librerias necesarias // import necessary libraries
import matplotlib.pyplot as plt		      
from collections import deque 
               
a = PBpinguino.TAPinguino()		     # iniciamos comunicacion via serial  // start communication via serial with pinguino

a.pin_mode(13, "input")			     # pin 13 como entrada // pin 13 as input
Leer = 13             			     # asignamos a la variable Leer = 13   //  assign to the variable Read = 13	       		
onda = deque([0]*290 , maxlen=290)           # asignamos a onda = deque con longitud máxima  "290" // onda = deque with maximum length "290"
c = 0.004887585533		  	    
fig, ax = plt.subplots()                     # creamos la figura  // create the figure                   
linea, = ax.plot(onda)			     # dibujamos la figura // draw the figure
while True:
    ax.set_xlim(-2, 300)                     # fija limites de "x" // fixed limits of "x"
    y = (a.analog_read(Leer))*c	             # y = lectura analogica en el pin 13 // assign to variable y = analog reading on pin 13
    onda.append(y)                           # agregamos "y" a onda //  add "y" to onda 
    linea.set_ydata(onda)                    # actualiza data de "y" // update data from "y"
    ax.set_ylim(-0.2, 5.2)		      
    plt.pause(1000 ** -2)     		     # pausa la graficacion y almacena valores // Pause the graphing and store values             
plt.show()  				     # Mustrar la grafica // Show the graph
                                          	
	
