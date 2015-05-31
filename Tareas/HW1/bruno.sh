echo Planetas Extrasolares
echo =====================================
echo Cantidad de planetas incluidos en el catálogo:
awk -F"," '{print $1}' kepler.csv | wc -l
echo =====================================
echo Planetas extrasolares con masa menor a una centésima de la masa de Júpiter:
awk -F"," '{if($2>0 && $2<0.01) print $1}' kepler.csv
echo Cantidad de planetas extrasolares con masa menor a una centésima de la masa de Júpiter:
awk -F"," '{if($2>0 && $2<0.01) print $1}' kepler.csv |wc -l
echo =====================================
echo El planeta con menor periodo orbital es: 
sort -t "," --key=6 -n kepler.csv |awk -F"," '{print $1}'|head -2|tail -1
echo Su periodo orbital es:
sort -t "," --key=6 -n kepler.csv |awk -F"," '{print $6}'|head -2|tail -1