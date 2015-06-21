Primera clase
**Métodos Computacionales** vacaciones 2015

Herramientas del curso:
+ git
+ GitHub
+ bash
+ C
+ Python

Semana 1: Esta semana no asistí a clase por encontrarme en la escuela de Física Matemática.

Semana 2: En esta semana aprendimos a manejar la herramienta gnuplot, a utilizar expresiones regulares para limpiar archivos de texto y elementos básicos de Python y C. 

Hands-on 2: 

+ ^(.... ) Expresión regular que representa cuatro caracteres al inicio de una línea con un espacio a continuación.

+Este código corresponde al programa en bash que recibe un archivo y dos de sus columnas y hace una gráfica paramétrica de las columnas. Fue probado con el archivo de las lunas de Júpiter.

```
gnuplot
set term dumb
set parametric
set size ratio 1
set datafile separator ","
plot "$1" using $2:$3
```

+Para separar el archivo de dígitos de Pi seleccionamos lo siguiente y lo reemplazamos por nada en TextWrangler:

```
\<.*\> :# Quitamos toda la información extra que viene de la página.

:.* :# Quitamos el contador de dígitos de pi.

\D :# Quitamos las letras PI al inicio.

\n :# Juntamos todas las líneas en una para poderlas separar luego.
```
+ Finalmente en la terminal ejecutamos el siguiente comando al archivo
```
sed 's/.\{20\}/&\n/g' PI.txt
```
Separamos los caracteres en grupos de 20 y le damos espacio para que el archivo nos quede en líneas como se desea. Obtuve el archivo de la página https://archive.org/stream/Pi_to_100000000_places/pi.txt, lo que al parecer lo hacía más complicado pero ya lo dejé así.

Semana 3: En esta semana trabajamos con C y python, aprendimos a hacer gráficas e histogramas en python. Además vimos un ejemplo de lammbs y un experimento que simula un gas en una caja para ver si cumple la distribución de Rayleigh.

Hands-on 4: 9 de Junio de 2015

+ Make se creó originalmente para compilar programas escritos en diferentes lenguajes, se utiliza para actualizar conjuntos de archivos que dependan de otros conjuntos de archivos.

+ En Make se puede pensar en los conjuntos de archivos como grafos, donde los nodos del grafo son las tareas a realizar. Esta forma de ordenar los archivos permite ordenar las tareas que se deben realizar primero que otras, cada vez que modificamos el archivo debemos recompilar el programa.

+ Make es muy útil entonces para manejar tareas que tenemos que repetir una y otra vez. Creamos un archivo de build que se escribe con cierto formato, este archivo maneja todas estas tareas y leva un registro de lo que está actualizado y lo que no.

**Proyecto**: Teniendo en cuenta lo visto estas dos semanas en clase me gustaría aplicarlo para tomar un determinado problema en física cuya solución requiera métodos numéricos, solucionarlo y poder hacer gráficas de las soluciones con la herramientas aprendidas y analizar así las soluciones obtenidas. Problemas interesantes en este sentido se pueden encontrar en el campo de la materia condensada cuando se tienen en cuenta procesos no-Markovianos, algo que aún no está muy estudiado.   

Hands-on 5: 10 de Junio de 2014

El siguiente código de python corresponde al tercer punto, para hacer el arreglo de figuras de Lissajous.

``` python
%pylab inline

from numpy import sin,pi,linspace
from pylab import plot,show,subplot

a = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49] #Crea un arreglo de 25 números, en este caso los primeros 25 impares.
b = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50] #Crea un arreglo con los primeros 25 números pares para que no haya figuras de Lissajous repetidas.
delta = pi/4 #Se fija el desfase entre los osciladores
t = linspace(-pi,pi,300) #Se define la variable paramétrica.

figure(figsize=(15,15)) #Se fija el tamaño de la figura.

for i in range(0,25): 
 x = sin(a[i] * t + delta) # Ecuaciones paramétricas para las figuras de Lissajous.
 y = sin(b[i] * t) #Ecuaciones paramétricas para las figuras de Lissajous.
 subplot(5,5,i+1) #Se grafican las 25 figuras en un arreglo de 5x5.
 plot(x,y)
 plt.axis('off')   #Se eliminan los ejes.
show()
```
![Lissajous](https://github.com/NicolasMorales-Duran/MC/blob/master/Lissajous)

Semana 4:  Esta semana aprendimos a utilizar la transformada de Fourier para aproximar funciones y sus aplicaciones al manejo de imágenes. Además aprendimos diversas técnicas de interpolación para hacer ajustes de determinados conjuntos de datos que nos son proporcionados, algo bastante útil para física experimental.

Hands-on 7: 16 de Junio de 2015

El siguiente código de python corresponde a la interpolación del campo magnético del dipolo.

```python
%pylab inline
import numpy as np
import matplotlib.pyplot as plt
from scipy import interpolate

x = np.array([2.3,2.8,3.2,3.7,4.3])
b = np.array([34745,19689,12594,7982,5822])

from scipy.optimize import curve_fit

def func(x,m):
    return 2*m/(4*np.pi*(x**3))
    
nonlfit =curve_fit(func, x,b)
plt.figure(figsize=(10,5))
plt.ylabel(r'$P(\theta)$',fontsize=15)
plt.xlabel(r'$\theta$',fontsize=15)
th=np.linspace(2.3,4.3,100)
plt.plot(x,b,'or')
plt.plot(th,func(th,nonlfit[0][0]),"g")
plt.title(u'el papi',fontsize=15)
plt.show()
print 
```
Ahora imprimimos la tabla con los 100 valores
```python
for i in range (100):
    print th[i],func(th,nonlfit[0][0])[i]
```

Hands on 9: 19 de Junio de 2015

Series de Fourier:
```python

```

DFT y procesamiento de imágenes:
```python

```

**Proyecto**: Teniendo en cuenta las diferentes herramientas de aproximación e interpolación vistas me parece que podrían ser útiles para tomar resultados experimentales de compañeros que trabajen por ejemplo en los laboratorios de óptica cuántica o nanomateriales y hacer curvas que se ajusten a sus resultados. En ese sentido podría por ejemplo retomar los datos de cuando vi laboratorio intermedio (Proyecto relacionado con la caracterización de una plataforma piezoeléctrica a partir de un interferómetro de Mach-Zehnder) y hacer un mejor ajuste del que hice en su momento.