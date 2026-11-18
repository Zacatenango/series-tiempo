# Estudio del examen 3

- **¿Qué significa que una serie sea estacionaria?**
- Significa que sus propiedades, media y varianza y autocorrelación, no dependen del tiempo. 
    - ARIMA requiere estacionariedad, eso se hace diferenciando la serie, la d de (p,d,q)

---

- **En la prueba KPSS, ¿qué indica un p-value pequeño?**
- Quiere decir que la serie no es estacionaria y hay que diferenciar.
    - La hipótesis nula en KPSS es "la serie es estacionaria", y los p-values pequeños, por convención menores a 0.05 (5%) rechazan la hipótesis nula.
    - En R eso se saca con unitroot_ndiffs()

---

- **¿Qué es cada letra de ARIMA(p,d,q)?**
- p es el orden de autorregresión (los rezagos de la propia serie, AR(p)), d las veces que se diferencia, q los rezagos de los errores (orden de la media móvil, MA(q))

---

- **Si la PACF se corta de golpe después del tiempo 2 y la ACF decae poco a poco, ¿qué modelo sugiere?**
- Sugiero AR(2), porque ese modelo se usa cuando la PACF se corta en un tiempo y la ACF decae lentamente. 
    - Si la ACF se cortara en un tiempo y la PACF decayera, ahí aplicaría MA(q)

---

- **Si la ACF se corta después del rezago 1 y la PACF decae poco a poco, qué modelo sugiere?
- MA(1), porque aplica para una ACF que se corta y una PACF que decae.

---

- **¿Cómo se escribe en Fable un ARIMA con orden fijo (1,1,1) y sin parte estacional?**
- `ARIMA(y ~ pdq(1,1,1) + PDQ(0,0,0))`
    - pdq() es la parte no estacional y PDQ() es la parte sí estacional. Si quitara el pdq(), ARIMA buscaría el orden automáticamente.

---

- **¿Cómo se escribe una regresión con errores ARIMA y un regresor x?**
- `ARIMA(y ~ x)`
    - Eso crea una regresión dinámica, donde y depende de x y los errores siguen un ARIMA.

---

- **¿Cómo se agregan términos de Fourier (regresión armónica) con K = 3?**
- `ARIMA(y ~ fourier(K=3) + PDQ(0,0,0))`
    - fourier(K = ) modela la estacionalidad con sinusoidales, y se apaga la estacional del ARIMA con PDQ(0,0,0). K va de 1 a m/2; se elige por AICc.

---

- **¿Cuándo puedes comparar dos modelos ARIMA por AICc?**
- Si tienen el mismo orden de diferenciación, es decir, la misma d y D.
    - Esto es porque diferenciar cambia los datos con los que se calcula la verosimilitud. Por lo tanto, para comparar modelos con diferente diferenciación, hay que usar cross-validation o precisión en test.

---

- **En una regresión con errores ARIMA, ¿qué residuos deben parecer ruido blanco?**
- Los residuos de innovación.
    - Los residuos de regresión eta siguen el ARIMA y sí tienen autocorrelación. Los residuos de innovación deben ser ruido blanco, y se revisa eso con Ljung-Box, `residuals(fit, type='innovation')` o 'regression'.

---

- **Si Ljung-Box da p-value de 40%, ¿qué concluyo?**
- Que los residuos parecen ser ruido blanco porque parece haber autocorrelación, y no hay evidencia de que no lo sean.

---

- **¿A qué tienden a largo plazo los pronósticos de un ARIMA con d = 1 y sin constante?**
- Tienden a un valor constante o línea plana.
    - Con d=0 y sin constante, los residuos son 0. Con d=1 y sin constante, son constantes. Con d=1 y con constante (eso hace un drift), tienen tendencia lineal. Con d=2 y sin constante, tienen tendencia lineal.

---

- **Para pronosticar con un modelo que tiene regresores, ¿qué necesitas?**
- Pasar new_data con los valores futuros de los regresores.
    - Se hace con `forecast(fit, new_data=futuro)` donde futuro tiene las fechas y los valores de x. A su vez, el futuro se hace con `new_data(datos,12) |> mutate(x=...)`. Los regresores de calendario (Fourier, trend, días hábiles) se conocen de antemano.

---

- **¿Qué función da el número de diferencias necesarias?**
- `features(y, unitroot_ndiffs)`
    - unitroot_ndiffs da d; unitroot_nsdiffs da D (estacional). report() muestra coeficientes; glance() da AICc; accuracy() da RMSE, MAPE, etc.

---

- **¿Qué función usas para ver los coeficientes estimados de un modelo?**
- `report(fit)`
    - report() muestra coeficientes, sigma² y AICc. glance() da una tabla resumen (AICc, etc.). augment() da ajustados y residuos. accuracy() da errores.
