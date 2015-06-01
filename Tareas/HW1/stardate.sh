echo "############################################"
figlet  Stardate
echo "############################################"
figlet $1
awk -v new="$1" -F"\t" '{if($1==new) print $2}' worldhistory.tsv 
#Busca que la primera columna del archivo de historia sea igual al ano ingresado al programa e imprime los hechos relevantes de ese ano.
echo "############################################"
echo LOOK AT THE FOLLOWING STARS:
echo RA		DEC	HIP No.
awk -v new="$1" -F"," '{if((2015-new+1)>$10&&(2015-new)<$10) print $8,$9,$2}' hyg.csv|head -5
#Crea la nueva variable new donde guarda el ano que le entra al programacomo parámetro, luego selecciona las estrellas  cuya luz es contemporánea a los eventos previamente mostrados e imprime la ascención recta, declinación y código de los 5 primeros planetas.
echo "############################################"
