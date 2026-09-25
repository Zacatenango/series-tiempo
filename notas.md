# Dataframes y Tibbles

Un dataframe es un conjunto de vectores de longitud igual pegados lado a lado como columnas. Cada columna es un vector ordinario, de tal forma que tiene un solo tipo. Cada fila es el i-ésimo elemento de cada columna.

Un tibble es la versión Tidyverse de un dataframe, y es lo que fpp3 usa.

Puedo armar un Tibble sencillito con 2 vectores:

```R
mes <- c("Ene", "Feb", "Mar")
ventas <- c(10, 12, 9)
DF = tibble(mes, ventas)
DF
```

El resultado es:

```text
# A tibble: 3 × 2
  mes   ventas
  <chr>  <dbl>
1 Ene       10
2 Feb       12
3 Mar        9
```

Para direccionar una columna del tibble/DF, uso el signo de pesos:

```R
> DF$ventas
[1] 10 12  9
```

Saco la cantidad de filas con nrow()

```R
> nrow(DF)
[1] 3
```
