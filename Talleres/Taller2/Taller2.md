#Taller 2
*Métodos Computacionales - Laboratorio*

03-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller2/. No olvide al final hacer un *commit* y un *push*.

## Lotería

1. Escriba  un script de `bash` llamado `loteria.sh` que determine si su taller es afortunado y va a ser revisado. La información necesaria siempre va a estar en el momento adecuado en el archivo [lottery](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv). Además de imprimir si el taller va a ser o no revisado también se debe imprimir la primera línea del archivo `csv` que tiene la fecha. Guárdelo en la carpeta de ejecutables de su computador.

###Solución
```
!/bin/bash
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv

Descarga el archivo de internet

head -1 lottery.csv

Imprime la fecha.

awk -F"," '{if($1==201214211) print $2}' lottery.csv

Busca si mi taller va a ser revisado.

rm lottery.csv
```
## Expresiones Regulares

1. Descargue el [archivo](http://www.minhacienda.gov.co/portal/page/portal/HomeMinhacienda/presupuestogeneraldelanacion/ProyectoPGN/2015/Presentacion%20Proyecto%202015.pdf) del Ministerio de Hacienda con información sobre el Presupuesto General de la Nación 2015. Abra el archivo, diríjase a la página 10, haga *copy-paste* los datos de la tabla comenzando en *EDUCACIÓN* y terminando en *100,0*, guárdelos en un archivo llamado `pgn.dat`. Escriba comandos de `sed` que lleven a cabo las siguientes tareas de búsqueda y reemplazo y aplíquelos secuencialmente sobre el archivo `pgn.dat`: 

	* eliminar todos los puntos,

	* cambiar por puntos todas las comas que estén seguidas de algún dígito,

	* cambiar por `tab` todos los espacios en blanco que estén seguidos de algún dígito o por (,

	* eliminar todos los paréntesis derechos,

	* y por último cambiar todos los paréntesis izquierdos por -. El resultado final debe quedar guardado en el archivo `pgn.tsv`.

	* Finalmente usar `sort --field-separator=$'\t' ...`  y `head` para organizar el archivo de acuerdo al cambio porcentual y encontrar el sector con el menor cambio porcentual.

###solución
```
sed 's/\.//g' pgn.dat | sed 's/,\d/,&/g'| sed 's/,,/./g'| sed 's/( \d| ()/,&/g' |sed's/, /\t/g' |sed 's/)//g'| sed 's/(/-/g'> pgn.tsv
sort --field-separator=$'\t' --key=4 -n pgn.tsv | head -1 
```
Ka primera l\'inea del código anterior realiza los requerimientos especificados en el taller y la segunda l\'inea ordena el archivo de menor a mayor teniendo en cuenta la columna de cambio porcentual y devuelve el dato del menor cambio porcentual.
El sector con menor cambio porcentual es: Registraduría.
 
## gnuplot

1. Haga con [Saturno](http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html) lo mismo que hicimos con Júpiter: limpiar el archivo llevándolo a formato `csv` y hacer una gráfica con `gnuplot` que evalúe la tercera ley de Kepler. Hay que tener especial cuidado con la columna para el periodo de rotación.
```
gnuplot
set term aqua
set datafile separator "\t"
quad(x)=x**2
cube(x)=x**3
plot "Documents/saturno.csv" using (quad($4)):(cube($3)) with lines
set xlabel "Periodo"
set ylabel "Semieje mayor" 
replot
```
Luego de limpiar el archivo obtenido de internet y separarlo por Tab aplicamos el anterior código,en efecto se ve que la gráfica es una línea recta.
**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**
