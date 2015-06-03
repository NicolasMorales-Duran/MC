#!/bin/bash
echo Planetas Extrasolares
echo =====================================
echo Cantidad de planetas incluidos en el catálogo:
awk -F"," '{print $1}' kepler.csv |sed '1d'| wc -l
#Primero se fija "," como separador, luego se toma la primera columna del archivo y se le quita la primera fila. Finalmente se cuenta el número de planetas.
echo =====================================
echo Planetas extrasolares con masa menor a una centésima de la masa de Júpiter:
awk -F"," '{if($2>0 && $2<0.01) print $1}' kepler.csv
#Se seleccionan los planetas cuyo dato de masa exista y sea menor a 0.01 la masa de Júpiter y se imprimen.
echo Cantidad de planetas extrasolares con masa menor a una centésima de la masa de Júpiter:
awk -F"," '{if($2>0 && $2<0.01) print $1}' kepler.csv |wc -l
#Lo mismo que en el comando anterior pero se cuentan las líneas para dar el n†umero de planetas.
echo =====================================
echo El planeta con menor periodo orbital es: 
sort -t "," --key=6 -n kepler.csv |awk -F"," '{print $1}'|head -2|tail -1
#Se organiza en orden ascendente la columna 6 del archivo y se selecciona únicamente el nombre del primer planeta. 
echo Su periodo orbital es:
sort -t "," --key=6 -n kepler.csv |awk -F"," '{print $6}'|head -2|tail -1
#Lo mismo que en el comando anterior pero se imprime el periodo orbital del planeta en cuestión.
