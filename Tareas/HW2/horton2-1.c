//Grupo de trabajo: Alejandro Hernández A. - Nicolás Morales-Durán.
#include <stdio.h>

int main(void)
{
	float inches = 0.0f;
	float feet = 0.0f;
	float yard = 0.0f;

	const float inches_per_foot = 12.0f; //Define la conversión de pies a pulgadas. 
	const float inches_per_yard = 36.0f; //Define la conversión de yardas a pulgadas.

	printf("Enter distance in inches: " ) ;
	scanf("%f", &inches); //Solicita al usuario la distancia a convertir en pulgadas.

	feet = inches/inches_per_foot; //Hace la conversión de unidades.
	yard = inches/inches_per_yard; //Hace la conversión de unidades.

	printf("Distance in feet: %.2f\n", feet ); //Imprime la distancia en pies.
	printf("Distance in yards: %.2f\n", yard ); //Imprime la distancia en pulgadas.
	return 0;
}
