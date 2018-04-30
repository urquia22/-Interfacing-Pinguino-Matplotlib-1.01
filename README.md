# Interfacing-Pinguino-Matplotlib-1.01
Interface to graph analog signal in python with Matplotlib library and the PinguinoVE4550 board version 1.01

# Instructions
Pinguino example to graph analog signal read on pin 13 of the penguin with the matplotlib library through serial communication using the pynguino communication library and pynguino.pde from yeison cardona to be seen in AnalogReadSerialMatplotlib-1.01.py

   1.Clone the repository
   2.Install libraries a) # apt-get install python-matplotlib.
   3.Load the .pde in the PinguinoVE4550, pynguino.pde from Yeison Cardona, that is attached in this repository.
   4.Use a potentiometer and place the 5 V input in pin 'A', the 'B' pin which is the middle one, connect the input pin in the pic pinguino (in this case it would be pin 13) and pin 'C' 'of the potentiometer connected to ground.
   5.Pinguino board pic18f4550 connected via usb to pc.

# How to Start the Example?
   1.PinguinoVE4550 board or Pinguino18f4550 connected via usb to pc.
   2.Open the terminal.
   3.Placed in the folder where your AnalogReadSerialMatplotlib-1.01.py file is located. execute $ cd /home/usuario/folder where is your file.
   4.As administrator execute # python AnalogReadSerialMatplotlib-01.py and will open the window with the real-time graph.
   
# Note**
pynguino.pde was compiled in the IDE 9.05, since this version of the library gives error when compiling in the IDE of the last versions, this version of pynguino.pde is more efficient in this case than the last version of the library.
in the AnalogReadSerialMatplotlib.py application use the cdc-8bit.pde and the pynguino-2.0 library, but here the communication process is slower, for this reason I decided to try the old version of pynguino and the Pinguino IDE 9.05.
