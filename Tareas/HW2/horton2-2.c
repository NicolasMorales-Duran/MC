//Grupo de trabajo: Alejandro Hernández A. - Nicolás Morales-Durán.
#include <stdio.h>

int main(void)
{
	float inches = 0.0f;
	float feet = 0.0f;
	float yard = 0.0f;
	float length = 0.0f;
	float width = 0.0f;
	float area = 0.0f;

	const float inches_per_foot = 12.0f; //Define la conversión de pies a pulgadas.
	const float inches_per_yard = 36.0f; //Define la conversión de yardas a pulgadas.

	printf("Enter length in whole feet: " ) ;
	scanf("%f", &feet);
	printf("                                            ...and then inches: " ) ;
	scanf("%f", &inches); //Pide al usuario que introduzca el largo de la habitación.
	
	length = feet*inches_per_foot + inches; //Hace la conversión de unidades.
	length /= inches_per_yard; //Hace la conversión de unidades.

	printf("Enter width in whole feet: " ) ;
	scanf("%f", &feet);
	printf("                                            ...and then inches: " ) ;
	scanf("%f", &inches); //Pide al usuario que introduzca el ancho de la habitación.
	
	width = feet*inches_per_foot + inches;	//Hace la conversión de unidades.
	width /= inches_per_yard; //Hace la conversión de unidades.

	area = length*width;

	printf("Area in squared yards: %.2f\n", area); //Imprime el área de la habitación en yardas cuadradas.
	
	return 0;
}
