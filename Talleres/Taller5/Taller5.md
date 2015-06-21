#Taller 5
*Métodos Computacionales - Laboratorio*

19-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller5/ y en él añada un enlace al cuaderno de IPython elaborado. No olvide al final hacer un *commit* y un *push*.

## series de Fourier

1. ([Fenómeno de Gibbs](https://en.wikipedia.org/wiki/Gibbs_phenomenon)) Diseñe y ejecute un experimento numérico que le permita calcular la constante de *Wilbraham-Gibbs*. En ello puede que le resulte útil una rutina de `scipy.optimize` llamada [basinhopping](http://docs.scipy.org/doc/scipy-0.15.1/reference/generated/scipy.optimize.basinhopping.html). Hágalo en un cuaderno de IPython llamdo `gibbs.ipynb`. **Debe** usar *fuerza bruta* y puede asumir que la discontinuidad se da del máximo al mínimo global de las sucesivas aproximaciones a la onda cuadrada.

![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller5/gibbs.png?raw=true =500x) 
**Solución**
```python
%pylab inline
import numpy as np
import matplotlib.pyplot as plt
import itertools
from scipy.optimize import basinhopping

fig=plt.figure(figsize=(15,10)) #Graficamos los primeros 8 términos de la serie de Fourier de la función ventana de altura \frac{\pi}{4}, se puede apreciar cómo se va aproximado cada vez más la serie.
x = np.linspace(0.0,2*np.pi,128)
y=0.*x
plt.plot([0.,0.,np.pi,np.pi,2*np.pi,2*np.pi],[0.,np.pi/4,np.pi/4,-np.pi/4,-np.pi/4,0.],"k",lw=3)
for i in range(8):
    y+=np.pi/np.pi*1./(2*i+1)*np.sin((2*i+1)*x) 
    plt.plot(x,y) 
plt.show() 

def f(x,it): #Definimos la función que devuelve el mínimo de la serie de Fourier para un orden determinado
    y=0.*x
    for i in range(it):
        y+=np.pi/np.pi*1./(2*i+1)*np.sin((2*i+1)*x)
    return y
    
minimizer_kwargs = {"method": "BFGS"}
y = []

n=15
for i in range(n):
    def g(x):
        return f(x,i)
    ret = basinhopping(g, np.pi, minimizer_kwargs=minimizer_kwargs,niter=128)
    y.append(abs(ret.fun))
    
T = [] #Hacemos la gráfica de la constante de gibbs para diversos órdenes de la aproximación de Fourier, vemos que el resultado tiende al valor teórico que se encuentra en la Wikipedia.
for i in range(1,len(y[1:])):
    T.append((2*y[1:][i]-np.pi/2)/np.pi) 
        
plt.figure(figsize=(15,10))
plt.plot(range(1,len(y[1:])),T)
plt.plot(range(1,len(y[1:])),T,color='red')
plt.xlabel('order')
plt.ylabel(r'$(G - \pi/2)/\pi$')
plt.show()

```

## GitHub branches & tags

1. Ponga una etiqueta al actual commit de su repositorio llamada *v0.33* y haga un push de ella a GitHub.
**Solución**
Basta con hacer lo siguiente en la terminal:

```
git tag -a v0.33 486ea1948b
git push origin v0.33
```

**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**
