#!/bin/bash
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv
#Descarga el archivo de internet
head -1 lottery.csv
#Imprime la fecha.
awk -F"," '{if($1==201214211) print $2}' lottery.csv
#Busca si mi taller va a ser revisado.
rm lottery.csv
