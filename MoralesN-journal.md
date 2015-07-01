Primera clase
**Métodos Computacionales** vacaciones 2015

Herramientas del curso:
+ git
+ GitHub
+ bash
+ C
+ Python

Semana 1: Esta semana no asistí a clase por encontrarme en la escuela de Física Matemática pero me adelanté en los temas de Bash.

Semana 2: En esta semana aprendimos a manejar la herramienta gnuplot, a utilizar expresiones regulares para limpiar archivos de texto y elementos básicos de Python y C. 

Hands-on 2: 2 de Junio de 2014

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

Hands-on 5: 10 de Junio de 2015

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

Hands-0n 6: 12 de Junio de 2015.


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

**Proyecto**: Teniendo en cuenta las diferentes herramientas de aproximación e interpolación vistas me parece que podrían ser útiles para tomar resultados experimentales de compañeros que trabajen por ejemplo en los laboratorios de óptica cuántica o nanomateriales y hacer curvas que se ajusten a sus resultados. En ese sentido podría por ejemplo retomar los datos de cuando vi laboratorio intermedio (Proyecto relacionado con la caracterización de una plataforma piezoeléctrica a partir de un interferómetro de Mach-Zehnder) y hacer un mejor ajuste del que hice en su momento.

Semana 5: En esta semana aprendimos dos herramientas muy útiles como lo son la integración y la diferenciación numéricas. Al final de la semana comenzamos con el tema de ecuaciones diferenciales y métodos para solucionarlas numéricamente también como Runge-Kutta.

Hands-on 10: 23 de Junio de 2015

El siguiente código en python corresponde a la actividad requerida

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import ifft, fft, fftfreq
%matplotlib inline

arc = np.genfromtxt('monthrg.dat') #Importamos los datos.
ann0 = arc[:,0] #Año en que se toma el dato
mes0 = arc[:,1] #Mes en que se toma el dato
d0 = arc[:,2] #Número de días en que se toma el dato
ave0 = arc[:,3] #Promedio de manchas solares

ann = []
mes = []
ave = []
for i in range(len(d0)): #Tomamos únicamente las posiciones en que efectivamente hubo toma de datos,
    if(d0[i]!=0):
        ann.append(ann0[i])
        mes.append(mes0[i])
        ave.append(ave0[i])

ann = [ann[i] + mes[i]/12. for i in range(len(ann))] #Tomamos el año como un decimal, añadiendo el tiempo correspondiente a en qué mes se toman los datos

plt.plot(ann,ave)
Vemos como varía el ciclo solar

N=len(ann)
fouave = fft(ave) #transformada de Fourier de los datos
fre = fftfreq(N, 1./12.) #frecuencia

maxim = max(np.abs(fouave)[fre>0.01]) #Buscamos el máximo sobre todos los datos transformados

a = 0
for i in range(len(fouave[fre>0.01])):
    if(np.abs(fouave[fre>0.01][i])==maxim): #Buscamos el índice donde está el máximo
        a = i
        
1/fre[a] #Calculamos el periodo

El periodo solar es de 12 años aproximadamente.

plt.plot(fre,np.abs(fouave),'o') #Graficamos los datos transformados
plt.xlim(-0.2,0.2)
plt.show()

fouave[np.abs(fre) >= 0.18 ] = 0 #Eliminamos los datos con  frecuencias mayores a cierto valor para hacer el filtrado pues vemos que los valores significativos están alrededor del cero 
newave = ifft(fouave) #Hacemos la transformada inversa de Fourier

plt.figure(figsize=(15,15)) #Hacemos la gráfica de la señal original y de la señal filtrada.
plt.plot(ann,ave,'b',alpha=0.5)
plt.plot(ann,np.abs(newave),'r',linewidth=1.5)
plt.show()

plt.figure(figsize=(15,15)) #Graficamos sólo desde el año 1900
plt.plot(ann[2988:],ave[2988:],'b',alpha=0.5)
plt.plot(ann[2988:],np.abs(newave[2988:]),'r',linewidth=3.)
plt.show()
```
Semana 6: En esta semana seguimos trabajando con ecuaciones diferenciales pero tomando en cuenta el caso en que estas sean no lineales o consten de un sistema acoplado. 

Hands-on 13: 1 de Julio de 2014

El siguiente código de python demuestra las ecuaciones utilizadas para los métodos de Adams-Bashford.

```python
from sympy import *
init_printing(use_unicode = True)
x = symbols('x')

t,fn,fn1,fn2,h,tn,tn1,tn2 = symbols('t fn fn1 fn2 h tn tn1 tn2') #A segundo orden

tn1 = tn - h
tn2 = tn - 2*h
simplify(integrate(fn2*((t-tn1)*(t-tn)/(tn2-tn)/(tn2-tn1)) + fn1*((t-tn)*(t-tn2)/(tn1-tn)/(tn1-tn2)) + fn*((t-tn1)*(t-tn2)/(tn-tn1)/(tn-tn2)),(t,tn,tn+h)))

t,fn,fn1,fn2,fn3,h,tn,tn1,tn2,tn3 = symbols('t fn fn1 fn2 fn3 h tn tn1 tn2 tn3') #A tercer orden

tn1 = tn - h
tn2 = tn - 2*h
tn3 = tn - 3*h
simplify(integrate(  fn3*((t-tn)*(t-tn1)*(t-tn2)/(tn3-tn)/(tn3-tn1)/(tn3-tn2)) 
                   + fn2*((t-tn)*(t-tn1)*(t-tn3)/(tn2-tn)/(tn2-tn1)/(tn2-tn3)) 
                   + fn1*((t-tn)*(t-tn2)*(t-tn3)/(tn1-tn)/(tn1-tn2)/(tn1-tn3)) 
                   + fn*((t-tn1)*(t-tn2)*(t-tn3)/(tn-tn1)/(tn-tn2)/(tn-tn3)),(t,tn,tn+h)))
```

**Proyecto**: Me parece muy interesante, como ya había mencionado previamente, utilizar lo aprendido en clase para resolver sistemas de ecuaciones que no tienen solución analítica. La razón por la que me gustaría hacerlo es que hace un tiempo desarrollé un proyecto con un profesor y un compañero que consistía en una generalización de la ecuación de Schrodinger-Langevin.

Esta ecuación es característica de los sistemas clásicos disipativos y cuánticos abiertos y surgió originalmente para estudiar el movimiento Browniano. En general, cuando se utiliza la aproximación de Caldeira-Legget para estudiar determinados sistemas y se obtiene la ecuación de Schrodinger-Langevin, esta no tiene solución analítica por lo que las herramientas del curso serían útiles. 

La generalización en la que trabajamos considera un acople no lineal en general entre el sistema y el entorno que se puede aplicar a casos concretos como las junturas Josephson o a determinadas moléculas quirales cuya energía viene dada por un doble pozo no simétrico, además se pueden considerar los casos cuando el sistema es Markoviano o no-Markoviano y a partir de las soluciones de las ecuaciones de movimiento obtenidas analizar las diferencias entre ambos casos.

Si efectivamente se pudiese desarrollar este proyecto sería muy interesante para mí ver si los resultados obtenidos teóricamente en efecto concuerdan con las simulaciones computacionales. En todo caso para el tema del proyecto me gustaría tomar algún problema físico que no sea analíticamente soluble y resolverlo numéricamente para analizar las soluciones obtenidas. Menciono en particular el efecto Josephson pues es característico de la mecánica cuántica pero se presenta a escala macroscópica, lo cual rompe el paradigma de que todos los fenómenos cuánticos se dan a escalas muy pequeñas. 