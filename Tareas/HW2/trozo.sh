#!/bin/bash

awk '{print substr($0,'$1','$(echo "$2-$1"| bc -l)')}' $3 #Busca la cadena de texto que está entre los caracteres que entran por parámetro.