//Grupo de trabajo: Alejandro Hernández A. - Nicolás Morales-Durán.
#include <stdio.h>

int main(void)
{
	float salary = 0.0f;
	float hours = 0.0f;
	int dollars;
	int cents;

	printf("Enter your weekly pay: $"); //Pide el salario semanal del trabajador.
	scanf("%f", &salary);

	printf("Enter how much hours you work per week: "); //Pide la cantidad de horas que trabaja el usuario.
	scanf("%f", &hours);

	salary /= hours;

	dollars = (int) salary;
	cents = (int) (salary*100)%100;

	printf("Your average hourly pay rate is %d dollars and %d cents.\n", dollars, cents);	//Imprime el salario promedio por hora.		

	return 0;
}
