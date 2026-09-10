#! /usr/bin/R

library(dplyr)
library(tsibble)
library(jsonlite)

# Hay que sacar una API key en https://fredaccount.stlouisfed.org/apikeys
FRED_API_KEY <- "5a6f836d3bec81357acf24ea01781a7a"  # nolint: object_name_linter.


# Generado por Claude Code. Tidyquant tiene un bug: la librería se conecta mal a la delegación de St
# Louis de la Reserva Federal, lo que hace que siempre falle la carga de los datos con
# tidyquant::tq_get(). Claude lo intentó, se rindió, y mejor hizo una función que hace a pie algo
# parecido a tidyquant::tq_get(get="economic.data"), mismos parámetros y mismo resultado.
fred_series <- function(id, from, to, api_key)
{
   paste0("https://api.stlouisfed.org/fred/series/observations",
          "?series_id=", id, "&api_key=", api_key, "&file_type=json",
          "&observation_start=", from, "&observation_end=", to) |> fromJSON() -> respuesta
   respuesta$observations -> observaciones
   # FRED marca los datos faltantes con un punto, que hay que volver NA antes de convertir a número
   observaciones$value[observaciones$value == "."] <- NA
   tibble(date = as.Date(observaciones$date), price = as.numeric(observaciones$value))
}


# Ahora sí, regresamos a la tarea: bajamos datos de importaciones de carros desde México hacia EEUU
# desde 1993 hasta Septiembre de 2025.
fred_series("MAUINSA", from="1993-01-01", to="2025-10-01", api_key=FRED_API_KEY) |>
   mutate(date=yearmonth(date)) |>
   as_tsibble(index=date) ->
   imports
