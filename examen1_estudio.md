# Estudio del examen 1

## Distribución normal e intervalos de predicción

**En una distribución normal estándar, 95% de los valores están a 1.96 desviaciones std del promedio, y 80% están a 1.28 desv std.**

En el caso del 80%, 1.28 es el punto en el eje x donde 90% de toda la integral de la distribución estándar está atrás del corte en **x = 1.28;** es decir, 10% de la distribución estándar está adelante de x = 1.28. Como esa distribución es simétrica, quiere decir que 10% de la dist std está atrás de x = -1.28. Lo que nos deja con 80% de la distribución. Y sabemos que x = 1.28 es 1.28 desv std, porque la distribución normal estándar es de promedio 0 y desv std 1.

El intervalo del 95% es igual, pero con 2 cortes que delimitan una integral que vale 0.95, y que son **x = -1.96 y x = 1.96.**

Entonces, si mi modelo pronostica las ventas del siguiente mes como $\hat{y} = 100$ y los residuos muestran $\hat{\sigma} = 10$, **¿cuál es el intervalo de predicción de 95%?**

**Respuesta:** El intervalo de 95% es [80.4, 119.6]; ya que la desviación estándar de los residuos es 10, y conforme a lo aquí explicado, el 95% de la integral central de una dist normal std está de -1.96 desv std a 1.96 desv std del promedio.

**¿Cuál es el intervalo de predicción de 80%?** Ese es [87.2, 112.8], por lo mismo pero con 1.28 desv std para el 80%.

**¿Por qué el segundo intervalo es más chico?** Porque el porcentaje del intervalo se refiere a la probabilidad de que el valor real a futuro caiga en el intervalo de predicción. Entonces, para incrementar la Pr de que el valor real caiga en el intervalo de predicción, hacemos más amplio el intervalo.

## Ensanchamiento de intervalos de predicción con el tiempo

Sea una caminata aleatoria acumuladora de ruido blanco:

```math
f[T] = f[T-1] + \varepsilon[T]
```

donde $n$ es alguna posición de nuestro eje de tiempo, $f[T]$ es nuestra serie de tiempo en la posición $T$, $f[T-1]$ es el dato anterior de la serie de tiempo, y $\varepsilon[T]$ es una serie de ruido blanco.

Quiere decir que por cada vez que avanzamos 1 unidad en el tiempo, se suma un ruido aleatorio $\varepsilon[T]$. Entonces, si queremos predecir el valor de $f[T]$ unas $h$ unidades en el futuro... vamos a tener un futuro afectado por $h$ ruidos aleatorios:

```math
f[T+h] = f[T] + \varepsilon[T+1] + \varepsilon[T+2] + \dots + \varepsilon[T+h]
```

donde cada $\varepsilon[T]$ tiene varianza $\sigma^2$.

1. **Pregunta:** ¿Cuál es la varianza de la suma de h errores independientes, todos ellos con varianza $\sigma^2$?
   - **Respuesta:** La varianza de la sumatoria de variables aleatorias independientes es la sumatoria de sus varianzas individuales. Como en este caso la varianza es la misma, $\sigma^2$, entonces la varianza de $h$ errores independientes es $h\sigma^2$.
   - **Fuente:** ["Data 140: Probability for Data Science" de Ani Adhikari y Jim Pitman, Universidad de Berkeley](https://data140.org/textbook/)
2. **Pregunta:** Con $\hat{\sigma} = 10$ y $\hat{y} = 100$, ¿cuál sería entonces el intervalo de 95% en $h = 4$ y cómo se compara con $h = 1$?
   - **Respuesta:** Siendo la varianza de todos los errores $\hat{\sigma}^2$, el intervalo es:

```math
Var(\varepsilon_1, \dots, \varepsilon_h) = h\hat{\sigma}^2 \\
= (4)(10^2) \\
= 400
```

Pero el intervalo es en términos de desviación estándar, así que la desviación estándar en $T = t + 4$ es la raíz cuadrada de la varianza que acabamos de sacar:

```math
\hat{\sigma}_{T=t+4} = \sqrt{400} = 20
```

Y el intervalo de 95% es $\pm1.96\hat{\sigma}$, es decir, [60.8, 139.2].

Estos valores son el doble del intervalo en $h=1$. ¿Quiere decir que la amplitud del intervalo crece en proporción a la raíz cuadrada de la predicción?
