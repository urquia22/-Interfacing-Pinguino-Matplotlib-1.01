//pynguino

// Yeison Nolberto Cardona Álvarez 2011
// Página del proyecto: http://code.google.com/p/pinno-processing/
// contacto: yeison.eng@gmail.com, @YeisonEng

//Si desea utilizar el Pic 18F4550 en vez de el Pic 18F2550 (por defecto),
//descomentar la siguiente línea
#define PIC18F4550

#include <stdlib.h>

#define RunLed PORTAbits.RA4 //Para controlar el Led de run

int cond;
int i;
int pin;
int value;
unsigned char receivedbyte;
unsigned char local_identificador[15];
unsigned char lectura[15];
unsigned char pin_n[2];
unsigned char mode[6];
unsigned char type[7];
char lectura_n[5];
unsigned char digitalwrite_n[1];
unsigned char analogwrite_n[4];
unsigned char function[15];


void setup(){
RunLed=1;
}//setup

void loop(){

cond=1;
while (cond){	//Creamos un ciclo hasta hasta realizar una lectura
	receivedbyte=CDC.read(local_identificador);
	local_identificador[receivedbyte]=0;
	if (receivedbyte>0)
		if (strcmp(local_identificador, "PinnoProcessing")==0){	//Comparamos la lectura con un identificador para comprobar una comunicación con el módulo Pynguino
			CDC.print("Conectado",9);
			RunLed=0;
			cond=0;}	}

while (1){	//Se crea un ciclo en el que se realizan todas las acciones

cond=1;
while (cond){	//Leemos un cadena para identificar la acción
	receivedbyte=CDC.read(lectura);
	lectura[receivedbyte]=0;
	if (receivedbyte>0) cond=0;}

if (strcmp(lectura, "setup")==0){	//Si la acción corresponde a modificar el modo de un pin
	cond=1;
	while (cond){	//Leemos el número del pin
		receivedbyte=CDC.read(pin_n);
		pin_n[receivedbyte]=0;
		pin=atoi(pin_n);
		if (receivedbyte>0) cond=0;}
	cond=1;
	while (cond){	//Leemos el modo del pin (input o outout)
		receivedbyte=CDC.read(mode);
		mode[receivedbyte]=0;
		if (receivedbyte>0) cond=0;}
		if (strcmp(mode, "input")==0) pinMode(pin,INPUT);	//Definimos un el pin como entrada o salida
		else if (strcmp(mode, "output")==0) pinMode(pin,OUTPUT);
	}//setup_n

else if (strcmp(lectura, "read")==0){ //Si la acción corresponde a leer un estado
	cond=1;
	while (cond){	//Leemos el número del pin
		receivedbyte=CDC.read(pin_n);
		pin_n[receivedbyte]=0;
		pin=atoi(pin_n);
		if (receivedbyte>0) cond=0;}
		
	cond=1;
	while (cond){	//Leemos el tipo de lectura
		receivedbyte=CDC.read(type);
		type[receivedbyte]=0;
		if (receivedbyte>0) cond=0;}
		
	if (strcmp(type, "digital")==0){	//Si queremos leer un pin digital
		if (digitalRead(pin)==0) CDC.print("0",1);
		else if (digitalRead(pin)==1) CDC.print("1",1);}

	else if (strcmp(type, "analog")==0){	//Ó un pin análogo
		value=analogRead(pin);
		itoa(value, lectura_n, 10);
		CDC.print(lectura_n,5);}
	}//read_n

else if (strcmp(lectura, "write")==0){	//Si la acción corresponde a fijar el estado de un pin
	cond=1;
	while (cond){	//Leemos el número del pin
		receivedbyte=CDC.read(pin_n);
		pin_n[receivedbyte]=0;
		pin=atoi(pin_n);
		if (receivedbyte>0) cond=0;}
		
	cond=1;
	while (cond){	//Leemos el tipo de valor a fijar
		receivedbyte=CDC.read(type);
		type[receivedbyte]=0;
		if (receivedbyte>0) cond=0;}

	if (strcmp(type, "digital")==0){	//Si es del tipo digital
	cond=1;
	while (cond){
		receivedbyte=CDC.read(digitalwrite_n);
		digitalwrite_n[receivedbyte]=0;
		if (receivedbyte>0) cond=0;}
		if (digitalwrite_n[0]=='1') digitalWrite(pin,HIGH);	//establecemos el valor correspondiente
		else if (digitalwrite_n[0]=='0') digitalWrite(pin,LOW);}

	else if (strcmp(type, "analog")==0){	//Si es del tipo análogo
	cond=1;
	while (cond){
		receivedbyte=CDC.read(analogwrite_n);	//Leemos el valor a fijar
		analogwrite_n[receivedbyte]=0;
		if (receivedbyte>0){
			cond=0;
			analogWrite(pin,atoi(analogwrite_n));}	}	}	//y lo estblecemos
	}//write

else if (strcmp(lectura, "allOutput")==0){	//Si la acción corresponde a fijar todos los pines como salida
	for (i=0;i<=17;i++){
		pinMode(i,OUTPUT);
		digitalWrite(i,LOW);}	//también los dejamos en un estado bajo
	}//all_output

else if (strcmp(lectura, "allInput")==0){	//Si la acción corresponde a fijar todos los pines como entrada
	for (i=0;i<=17;i++)
		pinMode(i,INPUT);
	}//all_input

else if (strcmp(lectura, "allHigh")==0){	//Si la acción corresponde a poner en alto todos los pines
	for (i=0;i<=17;i++){
		pinMode(i,OUTPUT);
		digitalWrite(i,HIGH);}
	}//all_high

else if (strcmp(lectura, "allLow")==0){	//Si la acción corresponde a poner en bajo todos los pines
	for (i=0;i<=17;i++){
		pinMode(i,OUTPUT);
		digitalWrite(i,LOW);}
	}//all_low
	
else if (strcmp(lectura, "reset")==0) reset();	//Si la acción corresponde a resetear pinguino

receivedbyte=0;
}//ciclo de acciones
}//loop"""
