figlet arXiv
echo =====================================
echo Searching the arXiv for the new stuff
echo http://arxiv.org/list/cond-mat/new
echo =====================================
echo keyword: $1
#Imprime la palabra que se busca
echo =====================================
echo Articles found: 
curl -s http://arxiv.org/list/cond-mat/new | grep -iw Title: | sed 's/.*>/+/g' | grep $1 | wc -l
#Mestra el número de artículos que se encontraron
curl -s http://arxiv.org/list/cond-mat/new | grep -iw Title: | sed 's/.*>/+/g' | grep $1
#Toma los artículos nuesvos de la página, selecciona sólo las líneas que dicen Title: y luego imprime los títulos senalándolos con + 
echo =====================================
