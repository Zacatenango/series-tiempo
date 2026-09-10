#! /usr/bin/R

library(dplyr)
library(tsibble)
library(jsonlite)

# Hay que sacar una API key en https://fredaccount.stlouisfed.org/apikeys
llave_fred <- "5a6f836d3bec81357acf24ea01781a7a"

# Generado por Claude Code. Bug de Tidyquant: la librería se conecta mal a la delegación de St.
# Louis de la Reserva Federal, lo que hace que siempre falle la carga de los datos con
# tidyquant::tq_get(). Claude lo intentó, se rindió, y mejor hizo una función que recibe los mismos
# parámetros indicados en el enunciado de la tarea y tira el tibble esperado por el resto del código
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

fred_series("MAUINSA", from="1993-01-01", to="2025-10-01", api_key=llave_fred) |>
   mutate(date=yearmonth(date)) |>
   as_tsibble(index=date) ->
   imports
