#! /usr/bin/R

library(dplyr)
library(tsibble)
library(jsonlite)

tidyquant::tq_get(x="MAUINSA", get="economic.data", from="1993-01-01", to="2025-10-01") |> mutate(date=yearmonth(date)) |> as_tsibble(index=date) -> imports
