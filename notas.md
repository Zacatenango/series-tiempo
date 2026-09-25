# Notas de estudio

## Dataframes y Tibbles

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

Para sacar como vector una columna del tibble/DF, uso el signo de pesos:

```R
> DF$ventas
[1] 10 12  9
```

Saco la cantidad de filas con nrow()

```R
> nrow(DF)
[1] 3
```

## Los 2 principales verbos de dplyr

dplyr es una librería que, principalmente, ofrece los 2 principales verbos: `filter()` y `mutate()`. filter() deja únicamente las filas que hacen que la condición del segundo parámetro sea TRUE, y mutate() añade o modifica columnas.

filter() y mutate() se prestan para usarse con sintaxis de pipe, como si fuera un comando de UNIX shell que transforma o hace algo con la stdin y tira a stdout como `pbzip2` o `sha256sum`.

Así, si le doy `filter(<columna> <operador> <valor>)` a un DF, me aislará únicamente las filas que cumplan la condición.

```R
> DF
# A tibble: 3 × 2
  mes   ventas
  <chr>  <dbl>
1 Ene       10
2 Feb       12
3 Mar        9

> DF |> filter(ventas > 9)
# A tibble: 2 × 2
  mes   ventas
  <chr>  <dbl>
1 Ene       10
2 Feb       12
```

Si quiero introducir una columna calculada, uso `mutate(<nueva columna>=<columna existente> <expresión>)`

```R
> DF |> mutate(doble=ventas*2)
# A tibble: 3 × 3
  mes   ventas doble
  <chr>  <dbl> <dbl>
1 Ene       10    20
2 Feb       12    24
3 Mar        9    18
```

## Ubicación en memoria de los DF y tibbles

```R
> DF
# A tibble: 3 × 2
  mes   ventas
  <chr>  <dbl>
1 Ene       10
2 Feb       12
3 Mar        9
```
