# Examen 2 de series de tiempo

## Glosario básico

- **Naïve:** pronosticar con el valor de la última muestra.
- **Seasonal naïve:** pronosticar con el valor de la última temporada.
- **AR:** autorregresión.


## Suavizado exponencial simple (SES) - flashcards

En SES, $\hat{\sigma}_h = \hat{\sigma}\sqrt{1+\alpha^2(h-1)}$. Cuando $\alpha = 1$, esta expresión colapsa a $\hat{\sigma}_h = \hat{\sigma}\sqrt{h}$, lo cual es la fórmula de Naïve.

- Es decir, la varianza del pronóstico a $h$ pasos en SES con $\alpha = 1$ es la varianza por la raíz cuadrada de los $h$ pasos.
- Un $\alpha$ más pequeña hace que la varianza del pronóstico crezca más lentamente.


## ARIMA

## SES y ARIMA - flashcards

El SES con $\alpha = 0.4$ es exactamente equivalente a ARIMA(0,1,1) con $\theta = -0.6$.

- Esto es porque el SES es una caminata aleatoria con ruido, por lo que el término de diferenciación $d$ de ARIMA(p,d,q) es 1 y hay también una media móvil de 1 muestra de duración. El $\theta$ de ARIMA en términos del $\alpha$ de SES entonces es $\theta = \alpha - 1$.
   - s
- Un $\alpha$ de SES igual a 1 da un $\theta$ de ARIMA igual a 0.
- ARIMA(0,1,0) = naïve.

AR(1) (autorregresión) sin constante y $\phi = 0.5$, siendo el último valor $y_T = 80$, da un pronóstico a 2 pasos de 20.

- Esto es porque cada paso multiplica por $\phi$, por lo que primero se divide entre 2, luego entre 4. Es como el decaimiento de la respuesta de un filtro de un polo.

Con ARIMA(1,0,0) estacionario con $c = 3$ y $\phi = 0.4$, a medida que $h \rightarrow \infty$, los pronósticos convergen a 5.

- El promedio de un AR(1) estacionario es:

```math
\bar{x} = \frac{c}{1-\phi} 
```

- Entonces, el promedio es $\bar{x} = 3 / (1-0.4) = 3 / 0.6 = 5$. Los intervalos también convergen a un ancho constante.

Con ARIMA(0,1,0) y $c = 2$, los pronósticos tienen aspecto de línea recta que aumenta 2 unidades por paso.

- $y_T - y_{T-1} = 2 + \varepsilon_{T}$, y cada paso añade $c$; esto es una caminata aleatoria con drift, una línea con pendiente c a partir del último valor. Con $d = 1$, los valores crecen sin límite.
