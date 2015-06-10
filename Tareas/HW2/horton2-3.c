//Grupo de trabajo: Alejandro Hernández A. - Nicolás Morales-Durán.
	#include <stdio.h>

	int main(void)
	{
		int product_type;
		int quantity;
		float price = 0.0f;
		_Bool product = 1;

		const float price_1 = 3.50f; //Define los precios de los productos.
		const float price_2 = 5.50f; //Define los precios de los productos.

		printf("Enter \"1\" for Type 1 product or \"2\" for Type 2 product: "); //Pide al usuario el producto que desea.
		scanf("%d", &product_type);

		product = ((product_type==1)?1:0);

		printf("Enter quantity of product: "); //Pide al usuario la cantidad.
		scanf("%d", &quantity);

		if(product==1)
		{
			price = quantity*price_1;
			printf("The price is: $ %.2f\n", price);
		}	
		else
		 {
		  	price = quantity*price_2;
			printf("The price is: $ %.2f\n", price);
		}
				
		return 0; //Calcula el precio de la cantidad de productos que desea el usuario y lo imprime.
	}
