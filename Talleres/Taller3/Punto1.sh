#!/bin/bash

for file in $(ls) #Recorro todos los archivos
do
	echo "# nombre de archivo: $file" >> archivos.md #Imprimo el nombre de cada archivo
	echo "\`\`\`" >> archivos.md
	cat $file >> archivos.md # Imprimo el código de cada archivo 
	echo "\`\`\`" >> archivos.md
done
