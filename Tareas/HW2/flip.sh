#!/bin/bash

sed 's/'$1'/,/g' $3 | sed 's/'$2'/+/g' | sed 's/,/'$2'/g'  | sed 's/+/'$1'/g' #Cambia todas las letras a del archivo que entra por parámetro por i y del mismo modo todas las i por a.