# Examen 2 de series de tiempo

## Suavizado exponencial simple (SES)

## ARIMA

## SES y ARIMA

El SES con $\alpha = 0.4$ es exactamente equivalente a ARIMA(0,1,1) con $\theta = -0.6$.

- Esto es porque el SES es una caminata aleatoria con ruido, por lo que el término de diferenciación $d$ de ARIMA(p,d,q) es 1 y hay también una media móvil de 1 muestra de duración. El $\theta$ de ARIMA en términos del $\alpha$ de SES entonces es $\theta = \alpha - 1$.
   - s
- Un $\alpha$ de SES igual a 1 da un $\theta$ de ARIMA igual a 0.
- ARIMA(0,1,0) = naïve.
