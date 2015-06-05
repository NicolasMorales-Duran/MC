#!/bin/bash
let a=1
for file in $(ls)
do
	gcc -O "$file.out" -C $file #Compila el archivo. 
	grep -A 1 "Example" $file #Imprime las líneas deseadas.
	open $file.out # Ejecuta el ejecutable.
	read -p "Press any key to continue" #Espera a que el usuario presione una tecla. 
	if(a==32) #Solo considera los primeros 30 archivos. 
		break
	let a++	 
echo
done
