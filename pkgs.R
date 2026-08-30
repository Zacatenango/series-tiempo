# Series de tiempo
# Script para instalar las paqueterías necesarias
# 
# 
# NOTA: Puede tardar varios minutos en concluir la instalación.
# 
# Solo es necesario correr el documento completo una vez.

# paqueterías necesarias

if (!require("pak")) install.packages("pak")

Sys.setenv(MAKEFLAGS = "-j50")
Sys.setenv(PKG_NUM_WORKERS = "2")
pak::pak(c("remotes", "devtools", "vctrs", "tidyverse", "lubridate",
                  "tsibble", "fable", "feasts", "tsibbledata", "fpp3",
                  "plotly", "gganimate", "png", "patchwork", "gifski",
                  "tidymodels", "tidyquant", "learnr", "gapminder",
           "nycflights13", "rmarkdown", "gapminder", "ggpubr",
                  "timetk", "seasonal", "modeltime", "prophet",  
                  "shiny", "shinythemes", "shinydashboard", "shinyWidgets", 
                  "colourpicker", "GGally", "ggthemes", "moderndive", 
           "fable.prophet", "pacman"
           )) #"pbenavidesh/maf3074"
