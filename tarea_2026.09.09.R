#! /usr/bin/R

library(dplyr)
library(fpp3)
library(jsonlite)


# Hay que sacar una API key en https://fredaccount.stlouisfed.org/apikeys
FRED_API_KEY <- "5a6f836d3bec81357acf24ea01781a7a"  # nolint: object_name_linter.


# Generado por Claude Code. Tidyquant tiene un bug: la librería se conecta mal a la delegación de St
# Louis de la Reserva Federal, lo que hace que siempre falle la carga de los datos con
# tidyquant::tq_get(). Claude lo intentó, se rindió, y mejor hizo una función que hace a pie un
# proceso funcionalmente equivalente al de tidyquant::tq_get(get="economic.data"), con los mismos
# parámetros y el mismo resultado
fred_series <- function(id, from, to, api_key)
{
   paste0("https://api.stlouisfed.org/fred/series/observations",
          "?series_id=", id, "&api_key=", api_key, "&file_type=json",
          "&observation_start=", from, "&observation_end=", to) |> fromJSON() -> respuesta
   observaciones <- respuesta$observations
   # FRED marca los datos faltantes con un punto, que hay que volver NA antes de convertir a número
   observaciones$value[observaciones$value == "."] <- NA
   tibble(date = as.Date(observaciones$date), price = as.numeric(observaciones$value))
}


# Ahora sí, regresamos a la tarea: bajamos datos de importaciones de carros desde México hacia EEUU
# desde 1993 hasta Septiembre de 2025.
fred_series("MAUINSA", from="1993-01-01", to="2025-10-01", api_key=FRED_API_KEY) |>
   mutate(date=yearmonth(date)) |>  # mutate() añade, tumba o transforma columnas en un DF
   as_tsibble(index=date) ->
   importaciones

# Para darnos una idea de nuestros datos, vamos a visualizarlos
importaciones |> autoplot() + theme(legend.position="none") -> importaciones_grafica

# Ahora dividimos nuestra serie de tiempo en formato tsibble en entrenamiento y test
# El enunciado nos pide un pronóstico de 14 meses. En series de tiempo la división no se hace por
# muestreo aleatorio, porque tenemos que preservar la temporalidad de nuestros datos; se hace
# partiendo la secuencia de datos en entrenamiento primero, testing después. La práctica usual es
# que el periodo de testing sea igual al periodo de pronóstico; entonces, voy a poner como
# entrenamiento desde el inicio hasta Agosto de 2024, y testing será de Sep 2024 en adelante
# Lo anterior conforme al contenido del curso: https://pbenavidesh.github.io/narsil/docs/modules/module_1/03_fcst/forecasting.html#train-test-split-1
importaciones |> filter_index(. ~ "2024 Aug") -> importaciones_entrenamiento
importaciones |> filter_index("2024 Sep" ~ .) -> importaciones_testing

# Pero antes de hacer nuestro fitting, vamos a probar con los 4 modelos básicos: promedio
importaciones_entrenamiento |> model(model_1=)
